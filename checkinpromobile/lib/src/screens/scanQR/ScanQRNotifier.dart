import 'dart:async';
import 'dart:convert';
import 'package:async/async.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/ETDataQRCode.dart';
import 'package:checkinpromobile/src/model/ETOrderDetailInfo.dart';
import 'package:checkinpromobile/src/model/ETOrderInfo.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/EventDetailInfo.dart';
import 'package:checkinpromobile/src/model/EventGuest.dart';
import 'package:checkinpromobile/src/model/EventTicketDetail.dart';
import 'package:checkinpromobile/src/model/FormatQRCode.dart';
import 'package:checkinpromobile/src/model/VisitorInviteCheckinSync.dart';
import 'package:checkinpromobile/src/model/WelcomeMessage.dart';
import 'package:checkinpromobile/src/screens/EventDetail/EventDetailScreen.dart';
import 'package:checkinpromobile/src/screens/MainNotifier.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/services/SyncService.dart';
import 'package:checkinpromobile/src/services/printService/PrinterModel.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart' as loc;
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:checkinpromobile/src/screens/SurveyScreen/SurveyScreen.dart';
import 'package:checkinpromobile/src/screens/SurveyScreen/SurveyNotifier.dart';
import 'package:checkinpromobile/src/model/SurveyForm.dart';
import 'dart:math' show cos, sqrt, asin;

import '../../../main.dart';

class ScanQRNotifier extends MainNotifier {
  final GlobalKey repaintBoundary = new GlobalKey();
  MyApp parent;
  bool isShowPrinter = false;
  int turnCamera = 0;
  QRViewController controller;
  bool isScanned = false;
  bool isLoading = false;
  bool isShowLogo = true;
  var numCheckInOrder = 0;
  double eventId = 0;
  double branchId = 0;
  double employeeId = 0;
  String qrCodeStr = "";
  String qrCodeStrCache = "";
  String qrCodeStrAttendanceCheckedCache = "";
  CancelableOperation cancelEvent;
  CancelableOperation cancelGetFlow;
  CancelableOperation cancelableRefresh;
  CancelableOperation cancelableLogout;
  var isRestoreLang = false;
  String badgeTemplateId;
  bool isDoneAnyWay = false;
  Timer timerDoneAnyWay;
  double topAnimation;
  double sizeQR;
  EventGuest eventGuest;
  PrinterModel printerModel;
  int isPrintForEvent = 0;
  Timer timerAllow;
  Timer timerAllowScanForAttendanceChecked;
  Timer timerOutBack;
  DateTime now = DateTime.now();
//  ETDataQRCode etDataQRCode;

  doTimerOutBack(BuildContext context) {
    timerOutBack = Timer(Duration(seconds: 30), () {
      // Back to dashboard
      AppRouter.pop(context);
    });
  }

  Future<void> startStream(BuildContext context) async {
    controller.scannedDataStream.listen((scanData) async {
      if (this.controller != null && !isScanned) {
        timerOutBack?.cancel(); // Reset timer outback
        qrCodeStr = scanData.code;
        // For checkin and checkout for visitor and events
        if (qrCodeStr == qrCodeStrCache) {
          return;
        }
        // For checked attendance
        if (qrCodeStrAttendanceCheckedCache.isNotEmpty) {
          return;
        }
        this.isScanned = true;
        this.controller.pauseCamera();
        _scanQRCodeFormat(qrCodeStr, context);
        notifyListeners();
        await Future.delayed(const Duration(milliseconds: 500));
        print('this.controller.pauseCamera()');
        this.controller.resumeCamera();
      }
    });
  }

  void _scanQRCodeFormat(String qrCode, BuildContext context) async {
    try {
      FormatQRCode formatQRCode = FormatQRCode.fromJson(jsonDecode(qrCodeStr));
      switch (formatQRCode.type) {
        case FormatQRCode.HR:
          var branchId = double.parse(formatQRCode.data.split('_')[3]);
          _checkInForAttendance(context, branchId, employeeId, formatQRCode);
          break;
        case FormatQRCode.EVENT:
          _requestScanQRCheckinEventGuest(context, formatQRCode.data,
              typeScan: formatQRCode.type);
          break;
        case FormatQRCode.INVITATION:
          _requestScanQRCheckinInvitationGuest(context, formatQRCode.data, typeScan: formatQRCode.type);
          break;
        case FormatQRCode.EVENT_TICKET:
          {
            double eventTicketId = arguments["eventTicketId"] as double;
            checkInEventTicket(formatQRCode.data, null, eventTicketId);
            break;
          }
      }
    } catch (e) {
      Utilities().showNoButtonDialog(context, DialogType.WARNING, 3,
          appLocalizations.titleNotification, appLocalizations.invalidQR, () {
        this.isScanned = false;
        this.qrCodeStr = '';
        isLoading = false;
        notifyListeners();
      });
    }
  }

  _checkInForAttendance(BuildContext context, double branchId, double accountId,
      FormatQRCode formatQRCode) async {

    // Vừa mới check mà chưa hết 30s thì không cho check
    if (timerAllowScanForAttendanceChecked != null &&
        timerAllowScanForAttendanceChecked.isActive) {
      this.isScanned = false;
      this.qrCodeStr = '';
      this.isDoneAnyWay = false;
      return;
    }
    qrCodeStrAttendanceCheckedCache = qrCodeStr;
    isLoading = true;
    notifyListeners();
    timerAllowScanForAttendanceChecked =
        Timer(Duration(milliseconds: 30000), () {
          qrCodeStrAttendanceCheckedCache = "";
          timerAllowScanForAttendanceChecked.cancel();
        });

    loc.LocationData currentLocation = arguments["currentLocation"];
    final arrayInviteCode = formatQRCode.data.split('_');
    final String checkinCode = arrayInviteCode[0] ?? "";
    String checkedInTime = arguments["checkedInTime"];
    if (currentLocation != null) {
      if (checkedInTime == null || checkedInTime.isEmpty) {
        _getSurvey(context, branchId, accountId, checkinCode, currentLocation);
      } else {
        _requestScanQREmployeeCheckin(context, checkinCode, currentLocation, branchId);
      }
    } else {
      if (arguments["locationEnabled"] != true) {
        Utilities().showNoButtonDialog(
            context,
            DialogType.WARNING,
            3,
            appLocalizations.notifyTitle,
            appLocalizations.locationServiceEnableContent, () {
          // Back to dashboard
          AppRouter.pop(context);
        });
        return;
      } else if (arguments["locationGranted"] == loc.PermissionStatus.denied || arguments["locationGranted"] == loc.PermissionStatus.deniedForever) {
        Utilities().showNoButtonDialog(
            context,
            DialogType.WARNING,
            3,
            appLocalizations.notifyTitle,
            appLocalizations.getLocationWrong, () {
          // Back to dashboard
          AppRouter.pop(context);
          return;
        });
      } else {
        loc.Location location = new loc.Location();
        currentLocation = await location.getLocation();
        if (checkedInTime == null || checkedInTime.isEmpty) {
          _getSurvey(context, branchId, accountId, checkinCode, currentLocation);
        } else {
          _requestScanQREmployeeCheckin(context, checkinCode, currentLocation, branchId);
        }
      }
    }
  }

   Future _requestScanQREmployeeCheckin(BuildContext context, String checkinCode,
       loc.LocationData locationData, double branchId) async {
     ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
       doTimerOutBack(context);
       final data = baseResponse.data;
       isLoading = false;
       notifyListeners();
       // No data found
       if (data == null) {
         Utilities().showNoButtonDialog(context, DialogType.WARNING, 3,
             appLocalizations.notifyTitle, appLocalizations.noData, () {
               this.isScanned = false;
               this.qrCodeStr = '';
               this.qrCodeStrAttendanceCheckedCache = '';
               this.isDoneAnyWay = false;
               this.timerAllowScanForAttendanceChecked.cancel();
             });
         return;
       }
       final String fullName = data["fullName"] ?? "";
       final bool isCheckin = data["isCheckin"];
       if (fullName.isEmpty || isCheckin == null) {
         Utilities().showNoButtonDialog(context, DialogType.WARNING, 3,
             appLocalizations.notifyTitle, appLocalizations.noData, () {
               this.isScanned = false;
               this.qrCodeStr = '';
               this.qrCodeStrAttendanceCheckedCache = '';
               this.isDoneAnyWay = false;
               this.timerAllowScanForAttendanceChecked.cancel();
             });
         return;
       }
       utilities.playSound();
       if (!isCheckin) {
         // Show popup successfully
         String message = await utilities.getWelcomeMessage(fullName, branchId, WelcomeMessage.TYPE_OUT, parent.preferences, context);
         Utilities().showNoButtonDialog(
             context,
             DialogType.SUCCES,
             2,
             "",
             message, () {
           this.isScanned = true;
           this.qrCodeStr = '';
           this.isDoneAnyWay = false;
           // Back to dashboard
           AppRouter.popWithArguments(context, arguments: {
             'isReload' : true
           });
         }, isHiddenTitle: false);
       } else {
         // Show popup successfully
         String message = await utilities.getWelcomeMessage(fullName, branchId, WelcomeMessage.TYPE_IN, parent.preferences, context);
         Utilities().showNoButtonDialog(
             context,
             DialogType.SUCCES,
             2,
             "",
             message, () {
           this.isScanned = true;
           this.qrCodeStr = '';
           this.isDoneAnyWay = false;
           // Back to dashboard
           AppRouter.popWithArguments(context, arguments: {
             'isReload' : true
           });
         }, isHiddenTitle: false);
       }
     }, (Errors message) async {
       doTimerOutBack(context);
       isLoading = false;
       notifyListeners();
       if (message.code != -2) {}
       if (message.description == 'EA_LocationInvalid') {
         Utilities().showNoButtonDialog(context, DialogType.WARNING, 3,
             appLocalizations.notifyTitle, appLocalizations.locationInvalid, () {
           this.isScanned = false;
           this.qrCodeStr = '';
           this.isDoneAnyWay = false;
           qrCodeStrAttendanceCheckedCache = '';
           this.timerAllowScanForAttendanceChecked.cancel();
         });
       }
       if (message.description == "EA_InvalidQr" ||
           message.description == "EA_QrExpired") {
         Utilities().showNoButtonDialog(context, DialogType.WARNING, 3,
             appLocalizations.notifyTitle, appLocalizations.qrCodeExpired, () {
           this.isScanned = false;
           this.qrCodeStr = '';
           this.isDoneAnyWay = false;
           qrCodeStrAttendanceCheckedCache = '';
           this.timerAllowScanForAttendanceChecked.cancel();
         });
       }
       if (message.description == "EA_InvalidCompanyOrBranch") {
         Utilities().showNoButtonDialog(
             context,
             DialogType.WARNING,
             3,
             appLocalizations.notifyTitle,
             appLocalizations.checkinEmployeeBranchWrong, () {
           this.isScanned = false;
           this.qrCodeStr = '';
           this.isDoneAnyWay = false;
           qrCodeStrAttendanceCheckedCache = '';
           this.timerAllowScanForAttendanceChecked.cancel();
         });
       }
       if (message.description == appLocalizations.noData) {
         Utilities().showNoButtonDialog(context, DialogType.WARNING, 3,
             appLocalizations.notifyTitle, appLocalizations.noData, () {
           this.isScanned = false;
           this.qrCodeStr = '';
           this.isDoneAnyWay = false;
           qrCodeStrAttendanceCheckedCache = '';
           this.timerAllowScanForAttendanceChecked.cancel();
         });
       }
       if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
         // Show popup when disconnect internet
         locator<Utilities>().showTwoButtonDialog(
             context,
             DialogType.ERROR,
             null,
             appLocalizations.titleError,
             appLocalizations.noInternet,
             appLocalizations.buttonTryAgain,
             appLocalizations.buttonClose, () {
           this.isScanned = false;
           this.qrCodeStr = '';
           this.isDoneAnyWay = false;
           qrCodeStrAttendanceCheckedCache = '';
           this.timerAllowScanForAttendanceChecked.cancel();
           _requestScanQREmployeeCheckin(context, checkinCode, locationData, branchId);
         }, () {
           this.isScanned = false;
           this.qrCodeStr = '';
           this.isDoneAnyWay = false;
           qrCodeStrAttendanceCheckedCache = '';
           this.timerAllowScanForAttendanceChecked.cancel();
         });
       }
     });

     await ApiRequest().requestEmployeeCheckin(context, locationData.latitude,
         locationData.longitude, checkinCode, '', 0, branchId, callBack);
   }

  Future _requestScanQREmployeeCheckinNoValidation(
      BuildContext context, String checkinCode, loc.LocationData locationData, double branchId,
      {double surveyId = 0, String surveyAnswer = ''}) async {
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      doTimerOutBack(context);
      final data = baseResponse.data;
      isLoading = false;
      notifyListeners();
      // No data found
      if (data == null) {
        Utilities().showNoButtonDialog(context, DialogType.WARNING, 3,
            appLocalizations.notifyTitle, appLocalizations.noData, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.qrCodeStrAttendanceCheckedCache = '';
          this.isDoneAnyWay = false;
          this.timerAllowScanForAttendanceChecked.cancel();
        });
        return;
      }
      final String fullName = data["fullName"] ?? "";
      final bool isCheckin = data["isCheckin"];
      if (fullName.isEmpty || isCheckin == null) {
        Utilities().showNoButtonDialog(context, DialogType.WARNING, 3,
            appLocalizations.notifyTitle, appLocalizations.noData, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.qrCodeStrAttendanceCheckedCache = '';
          this.isDoneAnyWay = false;
          this.timerAllowScanForAttendanceChecked.cancel();
        });
        return;
      }
      utilities.playSound();
      if (!isCheckin) {
        // Show popup successfully
        String message = await utilities.getWelcomeMessage(fullName, branchId, WelcomeMessage.TYPE_OUT, parent.preferences, context);
        Utilities().showNoButtonDialog(
            context,
            DialogType.SUCCES,
            2,
            "",
            message, () {
          this.isScanned = true;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
          // Back to dashboard
          AppRouter.popWithArguments(context, arguments: {
            'isReload' : true
          });
        }, isHiddenTitle: false);
      } else {
        // Show popup successfully
        String message = await utilities.getWelcomeMessage(fullName, branchId, WelcomeMessage.TYPE_IN, parent.preferences, context);
        Utilities().showNoButtonDialog(
            context,
            DialogType.SUCCES,
            2,
            "",
            message, () {
          this.isScanned = true;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
          // Back to dashboard
          AppRouter.popWithArguments(context, arguments: {
            'isReload' : true
          });
        }, isHiddenTitle: false);
      }
    }, (Errors message) async {
      doTimerOutBack(context);
      isLoading = false;
      notifyListeners();
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        // Show popup when disconnect internet
        locator<Utilities>().showTwoButtonDialog(
            context,
            DialogType.ERROR,
            null,
            appLocalizations.titleError,
            appLocalizations.noInternet,
            appLocalizations.buttonTryAgain,
            appLocalizations.buttonClose, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
          qrCodeStrAttendanceCheckedCache = '';
          this.timerAllowScanForAttendanceChecked.cancel();
          _requestScanQREmployeeCheckinNoValidation(
              context, checkinCode, locationData, branchId,
              surveyId: surveyId, surveyAnswer: surveyAnswer);
        }, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
          qrCodeStrAttendanceCheckedCache = '';
          this.timerAllowScanForAttendanceChecked.cancel();
        });
      }
    });

    await ApiRequest().requestEmployeeCheckinNoValidation(
        context,
        locationData.latitude,
        locationData.longitude,
        checkinCode,
        surveyAnswer,
        surveyId,
        branchId,
        callBack);
  }

  _getSurvey(BuildContext context, double branchId, double accountId,
      String code, loc.LocationData locationData) async {
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      isLoading = false;
      notifyListeners();
      var preferences = await SharedPreferences.getInstance();
      var surveyString = JsonEncoder().convert(baseResponse.data);
      preferences.setString(Constants.KEY_SURVEY, surveyString);
      final Map survey = json.decode(surveyString);
      final surveyResponse = SurveyForm.fromJson(survey);
      if (surveyResponse.status == false ||
          surveyResponse.type != SurveyForm.CUSTOM_FORM ||
          surveyResponse.customFormData == null) {
        // Call API checkin attendance
        isLoading = true;
        notifyListeners();
        _requestScanQREmployeeCheckinNoValidation(context, code, locationData, branchId);
      } else {
        showModalBottomSheet<void>(
            enableDrag: false,
            builder: (_) {
              return ChangeNotifierProvider(
                create: (_) => SurveyNotifier(),
                child: SurveyScreen(
                  callbackDismiss: () {
                    this.isScanned = false;
                    this.qrCodeStr = '';
                    this.isDoneAnyWay = false;
                    qrCodeStrAttendanceCheckedCache = '';
                    this.timerAllowScanForAttendanceChecked.cancel();
                  },
                  callbackSubmit: (surveyId, surveyAnswer) {
                    // Call API checkin attendance no validation
                    isLoading = true;
                    notifyListeners();
                    _requestScanQREmployeeCheckinNoValidation(
                        context, code, locationData, branchId,
                        surveyId: surveyId, surveyAnswer: surveyAnswer);
                  },
                ),
              );
            },
            context: context,
            isScrollControlled: true);
      }
    }, (Errors message) async {
      doTimerOutBack(context);
      isLoading = false;
      notifyListeners();
      if (message.code != -2) {}
      if (message.description == "SURVEY_INVALID") {
        // Call API checkin attendance no validation
        isLoading = true;
        notifyListeners();
        _requestScanQREmployeeCheckinNoValidation(context, code, locationData, branchId);
      }
      if (message.description == 'EA_LocationInvalid') {
        Utilities().showNoButtonDialog(context, DialogType.WARNING, 3,
            appLocalizations.notifyTitle, appLocalizations.locationInvalid, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
          qrCodeStrAttendanceCheckedCache = '';
          this.timerAllowScanForAttendanceChecked.cancel();
        });
      }
      if (message.description == "EA_InvalidQr" ||
          message.description == "EA_QrExpired") {
        Utilities().showNoButtonDialog(context, DialogType.WARNING, 3,
            appLocalizations.notifyTitle, appLocalizations.qrCodeExpired, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
          qrCodeStrAttendanceCheckedCache = '';
          this.timerAllowScanForAttendanceChecked.cancel();
        });
      }
      if (message.description == "EA_InvalidCompanyOrBranch") {
        Utilities().showNoButtonDialog(
            context,
            DialogType.WARNING,
            3,
            appLocalizations.notifyTitle,
            appLocalizations.checkinEmployeeBranchWrong, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
          qrCodeStrAttendanceCheckedCache = '';
          this.timerAllowScanForAttendanceChecked.cancel();
        });
      }
      if (message.description == appLocalizations.noData) {
        Utilities().showNoButtonDialog(context, DialogType.WARNING, 3,
            appLocalizations.notifyTitle, appLocalizations.noData, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
          qrCodeStrAttendanceCheckedCache = '';
          this.timerAllowScanForAttendanceChecked.cancel();
        });
      }
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        // Show popup when disconnect internet
        locator<Utilities>().showTwoButtonDialog(
            context,
            DialogType.ERROR,
            null,
            appLocalizations.titleError,
            appLocalizations.noInternet,
            appLocalizations.buttonTryAgain,
            appLocalizations.buttonClose, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
          qrCodeStrAttendanceCheckedCache = '';
          this.timerAllowScanForAttendanceChecked.cancel();
          _getSurvey(context, branchId, accountId, code, locationData);
        }, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
          qrCodeStrAttendanceCheckedCache = '';
          this.timerAllowScanForAttendanceChecked.cancel();
        });
      }
    });
    await ApiRequest().requestGetHealthDeclaration(context, callBack, branchId,
        accountId, locationData.latitude, locationData.longitude, code);
  }

  Future _requestScanQRCheckinEventGuest(
      BuildContext context, String inviteCode,
      {String typeScan = ""}) async {
    isLoading = true;
    notifyListeners();
    final eventGuest =
        await db.eventGuestDAO.getGuestForScanQRByInviteCode(inviteCode);
    // If synced to local DB
    if (eventGuest != null) {
      // Nếu từ dashboard vào màn hình scan QR
      if (eventId == null || eventId <= 0) {
        EventDetailInfo eventDetailInfo =
            await db.eventTodayDAO.getEventDetailById(eventGuest.eventId);
        if (eventDetailInfo == null) {
          isLoading = false;
          notifyListeners();
          Utilities().showNoButtonDialog(
              context,
              DialogType.WARNING,
              3,
              appLocalizations.notifyTitle,
              appLocalizations.somethingWrongContent, () {
            this.isScanned = false;
            this.qrCodeStr = '';
            this.isDoneAnyWay = false;
          });
          return;
        }
        badgeTemplateId = eventDetailInfo.badgeTemplateId;
        isPrintForEvent = eventDetailInfo.isPrint;
        eventId = eventDetailInfo.id;
        branchId = eventDetailInfo.branchId * 1.0;
      }
      // If checked in
      if (eventGuest.checkinStatus == 1) {
        isLoading = false;
        notifyListeners();
        // If checked out
        if (eventGuest.signOut == null || eventGuest.signOut.isEmpty) {
          // Update status check-in sync to DB local
          db.eventGuestDAO
              .checkInForGuestByInviteCode(inviteCode, branchId, employeeId)
              .then((_) {
            Future.delayed(Duration(seconds: 1), () {
              locator<SyncService>().syncEventCheckedGuest(context);
            });
          });
          // Sign out
          utilities.playSound();
          // Show popup successfully
          Utilities().showNoButtonDialog(
              context,
              DialogType.SUCCES,
              3,
              appLocalizations.thankyouCheckoutTitle,
              eventGuest.visitorName, () {
            this.isScanned = false;
            this.qrCodeStr = '';
            this.isDoneAnyWay = false;
          }, isHiddenTitle: false);
        } else {
          Utilities().showNoButtonDialog(
              context,
              DialogType.WARNING,
              3,
              appLocalizations.notifyTitle,
              appLocalizations.checkoutAlreadyAgainContent, () {
            this.isScanned = false;
            this.qrCodeStr = '';
            this.isDoneAnyWay = false;
          });
        }
        return;
      }
      // Update status check-in sync to DB local
      db.eventGuestDAO
          .checkInForGuestByInviteCode(inviteCode, branchId, employeeId)
          .then((_) {
        Future.delayed(Duration(seconds: 1), () {
          locator<SyncService>().syncEventCheckedGuest(context);
        });
      });
      // Sign in
      final item = EventGuest.normal(
          eventGuest.visitorName ?? '',
          eventGuest.visitorEmail ?? '',
          eventGuest.visitorPhoneNumber ?? '',
          inviteCode,
          1,
          eventGuest.visitorType ?? '',
          eventGuest.visitorCompany ?? '');
      // Add to list guest scaned check in
      utilities.lstEventGuestCheckedScan?.add(item);
      // Do print
      doPrinter(context, item, () {
        isLoading = false;
        notifyListeners();
        utilities.playSound();
        // Show popup successfully
        Utilities().showNoButtonDialog(context, DialogType.SUCCES, 3,
            appLocalizations.welcomeCheckinTitle, item.visitorName, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
          timerAllow =
              Timer(Duration(seconds: Constants.TIMEOUT_ALLOW_CHECKOUT), () {
            qrCodeStrCache = '';
            this.timerAllow?.cancel();
          });
        }, isHiddenTitle: false);
      });
      return;
    }
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      doTimerOutBack(context);
      final data = baseResponse.data;
      // No data found
      if (data == null) {
        Utilities().showNoButtonDialog(context, DialogType.WARNING, 3,
            appLocalizations.notifyTitle, appLocalizations.noData, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
        });
        return;
      }
      // Sign in
      if (data['email'] != null && data['fullName'] != null) {
        qrCodeStrCache = qrCodeStr; // Cache qrcode
        badgeTemplateId = (data["badgeTemplateId"] as num)?.toString();
        isPrintForEvent = data["isPrint"] as int;
        eventId = (data["eventId"] as num)?.toDouble();
        branchId = (data["locationId"] as num)?.toDouble();
        final item = EventGuest.normal(
            data['fullName'],
            data['email'],
            data['phoneNumber'],
            data['inviteCode'],
            1,
            data['visitorType'],
            data['fromCompany']);
        // Add to list guest scaned check in
        utilities.lstEventGuestCheckedScan?.add(item);
        // Do print
        doPrinter(context, item, () {
          isLoading = false;
          notifyListeners();
          utilities.playSound();
          // Show popup successfully
          Utilities().showNoButtonDialog(context, DialogType.SUCCES, 3,
              appLocalizations.welcomeCheckinTitle, data['fullName'], () {
            this.isScanned = false;
            this.qrCodeStr = '';
            this.isDoneAnyWay = false;
            timerAllow =
                Timer(Duration(seconds: Constants.TIMEOUT_ALLOW_CHECKOUT), () {
              qrCodeStrCache = '';
              this.timerAllow?.cancel();
            });
          }, isHiddenTitle: false);
        });
      } else {
        // Sign out
        isLoading = false;
        notifyListeners();
        utilities.playSound();
        // Show popup successfully
        Utilities().showNoButtonDialog(context, DialogType.SUCCES, 3,
            appLocalizations.thankyouCheckoutTitle, data['fullName'], () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
        }, isHiddenTitle: false);
      }
    }, (Errors message) async {
      doTimerOutBack(context);
      isLoading = false;
      notifyListeners();
      if (message.code != -2) {}
      if (message.description == 'EVENT_CannotCheckIn') {
        Utilities().showNoButtonDialog(
            context,
            DialogType.WARNING,
            3,
            appLocalizations.notifyTitle,
            appLocalizations.cannotCheckinContent, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
        });
      }
      if (message.description == appLocalizations.noPhone) {
        Utilities().showNoButtonDialog(
            context,
            DialogType.WARNING,
            3,
            appLocalizations.notifyTitle,
            appLocalizations.checkoutAlreadyAgainContent, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
        });
      }
      if (message.description == appLocalizations.noData) {
        Utilities().showNoButtonDialog(context, DialogType.WARNING, 3,
            appLocalizations.notifyTitle, appLocalizations.noData, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
        });
      }
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        // Show popup when disconnect internet
        locator<Utilities>().showTwoButtonDialog(
            context,
            DialogType.ERROR,
            null,
            appLocalizations.titleError,
            appLocalizations.noInternet,
            appLocalizations.buttonTryAgain,
            appLocalizations.buttonClose, () {
          _requestScanQRCheckinEventGuest(context, inviteCode,
              typeScan: typeScan);
        }, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
        });
      }
    });

    await ApiRequest().requestEventAction(context, callBack, inviteCode);
  }

  Future _requestScanQRCheckinInvitationGuest(
      BuildContext context, String inviteCode,
      {String typeScan = ""}) async {
    isLoading = true;
    notifyListeners();
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      doTimerOutBack(context);
      final data = baseResponse.data;
      // No data found
      if (data == null) {
        Utilities().showNoButtonDialog(context, DialogType.WARNING, 3,
            appLocalizations.notifyTitle, appLocalizations.noData, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
        });
        return;
      }
      // Sign in
      if (data['email'] != null && data['fullName'] != null) {
        qrCodeStrCache = qrCodeStr; // Cache qrcode
        final item = VisitorInviteCheckinSync.insertLocal(
            data["signIn"] as String,
            data["timeZone"] as String,
            (data["invitationId"] as num)?.toDouble(),
            data["inviteCode"] as String,
            data["fullName"] as String,
            data["visitorType"] as String,
            data["email"] as String,
            data["phoneNumber"] as String,
            (data["locationId"] as num)?.toDouble(),
            (data["contactPersonId"] as num)?.toDouble());
        // Insert to local DB
        db.visitorInviteCheckinSyncDAO
            .checkInForInvitationSync(item, isSync: true)
            .then((_) {
          // Update sign in for invitation visitor expected today`
          db.invitationExpectedDAO.updateSignInTimeByInviteCode(
              item.inviteCode, DateTime.tryParse(item.signIn));
        });
        isLoading = false;
        notifyListeners();
        utilities.playSound();
        // Show popup successfully
        Utilities().showNoButtonDialog(context, DialogType.SUCCES, 3,
            appLocalizations.welcomeCheckinTitle, data['fullName'], () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
          timerAllow =
              Timer(Duration(seconds: Constants.TIMEOUT_ALLOW_CHECKOUT), () {
            qrCodeStrCache = '';
            this.timerAllow?.cancel();
          });
        }, isHiddenTitle: false);
      } else {
        // Update row local DB
        db.visitorInviteCheckinSyncDAO.checkOutForInvitationSync(
            inviteCode, DateTime.now(),
            isSync: true);
        // Sign out
        isLoading = false;
        notifyListeners();
        utilities.playSound();
        // Show popup successfully
        Utilities().showNoButtonDialog(context, DialogType.SUCCES, 3,
            appLocalizations.thankyouCheckoutTitle, data['fullName'], () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
        }, isHiddenTitle: false);
      }
    }, (Errors message) async {
      if (message.code != Constants.STATUS_CODE_NO_INTERNET) {
        doTimerOutBack(context);
        isLoading = false;
        notifyListeners();
      }
      if (message.code != -2) {}
      if (message.description == 'INV_CannotCheckIn') {
        Utilities().showNoButtonDialog(
            context,
            DialogType.WARNING,
            3,
            appLocalizations.notifyTitle,
            appLocalizations.cannotCheckinContent, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
        });
      }
      if (message.description == appLocalizations.noPhone) {
        Utilities().showNoButtonDialog(
            context,
            DialogType.WARNING,
            3,
            appLocalizations.notifyTitle,
            appLocalizations.checkoutAlreadyAgainContent, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
        });
      }
      if (message.description == appLocalizations.noData) {
        Utilities().showNoButtonDialog(context, DialogType.WARNING, 3,
            appLocalizations.notifyTitle, appLocalizations.noData, () {
          this.isScanned = false;
          this.qrCodeStr = '';
          this.isDoneAnyWay = false;
        });
      }
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        final itemVisitorInviteCheckinSync = await db
            .visitorInviteCheckinSyncDAO
            .getItemByInviteCode(inviteCode);
        if (itemVisitorInviteCheckinSync == null) {
          // Get item invitation visitor
          final itemInvitationLocal = await db.invitationExpectedDAO
              .getItemByInviteCode(
                  inviteCode, Constants.EXCEEDING_SECONDS_SEARCH_INVITATION);
          // Found item expected today
          if (itemInvitationLocal != null) {
            // Sign in
            final item = VisitorInviteCheckinSync.insertLocal(
                DateTime.now().toString(),
                itemInvitationLocal.timeZone,
                itemInvitationLocal.invitationId * 1.0,
                itemInvitationLocal.inviteCode,
                itemInvitationLocal.visitorName,
                itemInvitationLocal.visitorType,
                itemInvitationLocal.visitorEmail,
                itemInvitationLocal.visitorPhoneNumber,
                itemInvitationLocal.branchId,
                itemInvitationLocal.contactPersonId);
            db.visitorInviteCheckinSyncDAO
                .checkInForInvitationSync(item)
                .then((_) {
              // Update sign in for invitation visitor expected today
              db.invitationExpectedDAO.updateSignInTimeByInviteCode(
                  item.inviteCode, DateTime.tryParse(item.signIn));
            });
            doTimerOutBack(context);
            qrCodeStrCache = qrCodeStr; // Cache qrcode
            isLoading = false;
            notifyListeners();
            utilities.playSound();
            // Show popup successfully
            Utilities().showNoButtonDialog(
                context,
                DialogType.SUCCES,
                3,
                appLocalizations.welcomeCheckinTitle,
                itemInvitationLocal.visitorName, () {
              this.isScanned = false;
              this.qrCodeStr = '';
              this.isDoneAnyWay = false;
              timerAllow = Timer(
                  Duration(seconds: Constants.TIMEOUT_ALLOW_CHECKOUT), () {
                qrCodeStrCache = '';
                this.timerAllow?.cancel();
              });
            }, isHiddenTitle: false);
            // Not found item expected today
          } else {
            doTimerOutBack(context);
            isLoading = false;
            notifyListeners();
            Utilities().showNoButtonDialog(context, DialogType.WARNING, 3,
                appLocalizations.notifyTitle, appLocalizations.noData, () {
              this.isScanned = false;
              this.qrCodeStr = '';
              this.isDoneAnyWay = false;
            });
          }
        } else {
          doTimerOutBack(context);
          isLoading = false;
          notifyListeners();
          // Signed out
          if (itemVisitorInviteCheckinSync.signOut != null) {
            Utilities().showNoButtonDialog(
                context,
                DialogType.WARNING,
                3,
                appLocalizations.notifyTitle,
                appLocalizations.checkoutAlreadyAgainContent, () {
              this.isScanned = false;
              this.qrCodeStr = '';
              this.isDoneAnyWay = false;
            });
            return;
          }
          // Sign out
          db.visitorInviteCheckinSyncDAO.checkOutForInvitationSync(
              itemVisitorInviteCheckinSync.inviteCode, DateTime.now());
          utilities.playSound();
          // Show popup successfully
          Utilities().showNoButtonDialog(
              context,
              DialogType.SUCCES,
              3,
              appLocalizations.thankyouCheckoutTitle,
              itemVisitorInviteCheckinSync.visitorName, () {
            this.isScanned = false;
            this.qrCodeStr = '';
            this.isDoneAnyWay = false;
          }, isHiddenTitle: false);
        }
      }
    });
    await ApiRequest().requestEventAction(context, callBack, inviteCode);
  }

  double calculateLowerBound(double heightScreen, double sizeBox) {
    double percent = (sizeBox / heightScreen) * 100;

    double topPercent = (percent / 2) + 50;
    topAnimation = (heightScreen / 100) * topPercent;

    double bottomPercent = 50 - (percent / 2);
    double bottomAnimation = (heightScreen / 100) * bottomPercent;

    return bottomAnimation / topAnimation;
  }

  void doPrinter(BuildContext cx, EventGuest item, Function callback) async {
    eventGuest = item;
    printerModel = await Utilities().getPrinter();
    notifyListeners();
    var preferences = await SharedPreferences.getInstance();
    String printer = preferences.getString(Constants.KEY_PRINTER);
    bool checkPrintSetting = (printer != null && printer.isNotEmpty);
    if (!checkPrintSetting) {
      callback();
    } else {
      if (isPrintForEvent == 1) {
        await Future.delayed(new Duration(milliseconds: 500));
        printTemplate(callback);
      } else {
        callback();
      }
    }
  }

  Future<void> printTemplate(Function callback) async {
    timerDoneAnyWay = Timer(Duration(seconds: Constants.TIMEOUT_PRINTER), () {
      if (!isDoneAnyWay) {
        isDoneAnyWay = true;
        callback();
      }
    });
    String response = "";
    try {
      if (printerModel != null) {
        RenderRepaintBoundary boundary =
            repaintBoundary.currentContext.findRenderObject();
        await locator<Utilities>().printJob(printerModel, boundary);
        if (!isDoneAnyWay) {
          timerDoneAnyWay?.cancel();
          isDoneAnyWay = true;
          callback();
        }
      }
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
      locator<Utilities>().printLog("$response ");
      if (!isDoneAnyWay) {
        timerDoneAnyWay?.cancel();
        isDoneAnyWay = true;
        callback();
      }
    } catch (e) {
      if (!isDoneAnyWay) {
        timerDoneAnyWay?.cancel();
        isDoneAnyWay = true;
        callback();
      }
    }
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future checkInEventTicket(String inviteCodeScan, ETOrderDetailInfo orderDetailInfo, double eventTicketId, {List<ETOrderDetailInfo> orderDetails, bool isSingle = true, Function callBackDone}) async {
    EventTicketDetail eventDetail = arguments["eventDetail"] as EventTicketDetail;
    if (isSingle) {
      if (eventDetail.isEventNotStart()) {
        utilities.showErrorPop(context, appLocalizations.eventNotStart, Constants.AUTO_HIDE_LESS, () {},
            callbackDismiss: () {
              if (callBackDone != null) {
                callBackDone();
              }
            });
        return;
      } else if (eventDetail.isEventExpired()) {
        utilities.showErrorPop(context, appLocalizations.eventExpired, Constants.AUTO_HIDE_LESS, () {},
            callbackDismiss: () {
              if (callBackDone != null) {
                callBackDone();
              }
            });
        return;
      }
    }
    String inviteCode = orderDetailInfo?.inviteCode ?? inviteCodeScan;
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      await db.eTOrderDetailInfoDAO.updateUsedStatus(inviteCode, "1");
      orderDetailInfo?.status = "1";
      numCheckInOrder++;
      if (isSingle || numCheckInOrder == orderDetails?.length) {
        utilities.playSound();
        Utilities().showNoButtonDialog(
            context,
            DialogType.SUCCES,
            Constants.AUTO_HIDE_LESS,
            appLocalizations.notifyTitle,
            appLocalizations.checkinSuccess, null);
        numCheckInOrder = 0;
        if (callBackDone != null) {
          callBackDone();
        }
      }
    }, (Errors message) async {
      if (message.code != -2) {
        if (message.description == appLocalizations.orderNotPaid) {
          ETOrderInfo orderInfo = await db.eTOrderInfoDAO.getOrdersByInviteCode(inviteCode);
          showModalBottomSheet<void>(
            builder: (_) {
              String langSaved =
                  preferences.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
              return TicketOrderDetail(orderInfo, paymentType: eventDetail.paymentTypes, langSaved: langSaved, onPaid: (reload) {
                paidForOrder(orderInfo, callBackDone: reload);
              }, onCheckInAll: (reload) {
                checkInEventOrder(
                    orderInfo?.orderDetails, eventTicketId, callBackDone: reload);
              }, onCheckIn: (etOrderDetailInfo, reload) {
                checkInEventTicket(inviteCode, etOrderDetailInfo, eventTicketId,
                    callBackDone: reload);
              });
            },
            context: context,
            isScrollControlled: true,
            isDismissible: true,
          );
        } else {
          if (message.description == appLocalizations.inviteCodeUsed) {
            await db.eTOrderDetailInfoDAO.updateUsedStatus(inviteCode, "1");
            orderDetailInfo?.status = "1";
            numCheckInOrder++;
          }
          if (isSingle || numCheckInOrder == orderDetails?.length) {
            Utilities().showErrorPop(context, message.description, null, () {

            }, callbackDismiss: () {

            });
          }
        }
      }
    });
    await ApiRequest()
        .requestCheckInEventTicket(context, inviteCode, eventTicketId, callBack);
//    }
  }

  Future checkInEventOrder(List<ETOrderDetailInfo> orderDetails, double eventTicketId, {Function callBackDone}) async {
    EventTicketDetail eventDetail = arguments["eventDetail"] as EventTicketDetail;
    if (eventDetail.isEventNotStart()) {
      utilities.showErrorPop(context, appLocalizations.eventNotStart, Constants.AUTO_HIDE_LESS, () {},
          callbackDismiss: () {
            if (callBackDone != null) {
              callBackDone();
            }
          });
      return;
    } else if (eventDetail.isEventExpired()) {
      utilities.showErrorPop(context, appLocalizations.eventExpired, Constants.AUTO_HIDE_LESS, () {},
          callbackDismiss: () {
            if (callBackDone != null) {
              callBackDone();
            }
          });
      return;
    }
    numCheckInOrder = 0;
    for (ETOrderDetailInfo orderDetail in orderDetails) {
      if (!orderDetail.isUsed()) {
        checkInEventTicket(orderDetail.inviteCode, orderDetail, eventTicketId, orderDetails: orderDetails, isSingle: false, callBackDone: callBackDone);
      }
    }
  }

  Future paidForOrder(ETOrderInfo orderInfo, {Function callBackDone}) async {
    EventTicketDetail eventDetail = arguments["eventDetail"] as EventTicketDetail;
    if (eventDetail.isEventExpired()) {
      Utilities().showErrorPop(context, appLocalizations.eventExpired, Constants.AUTO_HIDE_LESS, () {
      }, callbackDismiss: () {
        if (callBackDone != null) {
          callBackDone();
        }
      });
    } else {
      ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
        utilities.playSound();
        orderInfo.status = OrderTicketStatus.PAID;
        await db.eTOrderInfoDAO.updateStatusOrdersById(orderInfo.id, OrderTicketStatus.PAID, orderInfo.paymentType == PaymentType.CASH);
        Utilities().showNoButtonDialog(
            context,
            DialogType.SUCCES,
            Constants.AUTO_HIDE_LESS,
            appLocalizations.notifyTitle,
            appLocalizations.paySuccess, null);
        if (callBackDone != null) {
          callBackDone();
        }
      }, (Errors message) async {
        if (message.code != -2) {
          if (message.description == appLocalizations.paidAlready) {
            orderInfo.status = OrderTicketStatus.PAID;
            await db.eTOrderInfoDAO.updateStatusOrdersById(orderInfo.id, OrderTicketStatus.PAID, false);
          }
          Utilities().showErrorPop(context, message.description, null, () {

          }, callbackDismiss: () {

          });
        }
      });
      await ApiRequest()
          .requestPaidOrder(context, orderInfo.id, callBack);
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    timerAllow?.cancel();
    timerAllowScanForAttendanceChecked?.cancel();
    timerOutBack?.cancel();
    super.dispose();
  }
}
