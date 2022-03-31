import 'dart:async';
import 'dart:typed_data';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/BaseListResponse.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/ETOrderDetailInfo.dart';
import 'package:checkinpromobile/src/model/ETOrderInfo.dart';
import 'package:checkinpromobile/src/model/ETOrderDetailInfo.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/EventDetailInfo.dart';
import 'package:checkinpromobile/src/model/EventGuest.dart';
import 'package:checkinpromobile/src/model/EventGuestOffline.dart';
import 'package:checkinpromobile/src/screens/AppBarNotifier.dart';
import 'package:checkinpromobile/src/screens/print/PrinterPage.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/services/SyncService.dart';
import 'package:checkinpromobile/src/services/printService/PrinterModel.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'package:checkinpromobile/src/model/EventTicket.dart';
import 'package:checkinpromobile/src/model/EventTicketDetail.dart';
import 'package:checkinpromobile/src/model/Authenticate.dart';
import 'package:checkinpromobile/src/model/EmployeeInfo.dart';
import 'package:async/async.dart';

class EventDetailNotifier extends AppBarNotifier {
  final GlobalKey repaintBoundary = new GlobalKey();
  RoundedLoadingButtonController btnTryAgainController =
      new RoundedLoadingButtonController();
  List<EventGuest> lstGuest = List();
  List<EventGuest> lstSearchGuest = List();
  EventDetailInfo model = EventDetailInfo.init();
  EventGuest guestPrinter;
  PrinterModel printModel;
  Timer timerDoneAnyWay;
  int selectedBarIndex = 0;

  AsyncMemoizer<List<EventTicket>> memCacheTicket = AsyncMemoizer();
  EmployeeInfo employee;
  Authenticate authenAppbar;
  List<EventTicket> listEventTicket = List();
  EventTicketDetail eventDetail;
  String bookingLink;
  List<ETOrderInfo> listOrderInfo =  List();
  List<ETOrderInfo> listOrderInfoPaid =  List();
  List<ETOrderDetailInfo> listOrderDetailInfo;

  int totalItem = Constants.MAX_INT;
  int totalSearchItem = Constants.MAX_INT;
  int pageIndex = 1;
  int pageIndexSearch = 1;
  bool statusCheckin = false;
  bool reloadListOrder = false;
  int numCheckInOrder = 0;

  bool isSearchOpen = false;
  bool isWaitingPrinter = false;
  bool isNoInternet = false;
  bool isLoading = true;
  bool isLoadingCheckIn = false;
  bool isLoadingGuest = false;
  bool isLoadingSearchGuest = false;
  String visitorTypeName = '';
  String startDateEvent = '';
  String endDateEvent = '';
  String startDateEventTicket = '';
  String endDateEventTicket = '';
  bool isEventTicket = true;
  bool isInit = false;

  Uint8List bytesCover;
  double employeeId; // use for insert event sync db local
  bool isDownloadingLocal = false;
  String downloadStatusTitle = '';
  double percentDownloading;
  String langSaved;

  @override
  String getSubTitle(BuildContext context) {
    // TODO: implement getSubTitle
    throw UnimplementedError();
  }

  @override
  String getTitle(BuildContext context) {
    // TODO: implement getTitle
    return '';
  }

  @override
  void onClickLeft(BuildContext context) {
    // TODO: implement onClickLeft
  }

  @override
  void onClickRight(BuildContext context) {
    // TODO: implement onClickRight
  }
  
  void initData() {
    if (!isInit) {
      isInit = true;
      listOrderInfo = arguments["listOrderInfo"] as List<ETOrderInfo>;
      listOrderInfoPaid = arguments["listOrderInfoPaid"] as List<ETOrderInfo>;
      eventDetail = arguments["eventDetail"] as EventTicketDetail;
      isEventTicket = arguments["isEventTicket"] as bool;
      bookingLink = eventDetail?.settingInfo?.bookingLink ?? "";
      langSaved = preferences.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
    }
  }

  void getCoverHeader(String coverName) async {
    if (coverName == null || coverName.isEmpty) {
      return;
    }
    final file = await Utilities()
        .getLocalFile(Constants.FOLDER_TEMP_EVENT, coverName, null);

    bytesCover = file.readAsBytesSync();
    notifyListeners();
  }

  Future getEventGuestAllOnline(BuildContext context, double eventId) async {
    if (!await utilities.isConnectInternet()) {
      // Show popup when disconnect internet
      locator<Utilities>().showTwoButtonDialog(
          context,
          DialogType.QUESTION,
          null,
          appLocalizations.titleError,
          appLocalizations.noInternet,
          appLocalizations.buttonTryAgain,
          appLocalizations.buttonClose, () {
        getEventGuestAllOnline(context, eventId);
      }, () {});
      return;
    }
    percentDownloading = null;
    downloadStatusTitle = appLocalizations.downloadingContent;
    isDownloadingLocal = true;
    notifyListeners();
    ApiCallBack callBack =
        ApiCallBack((BaseListResponse baseListResponse) async {
      if (baseListResponse.data != null) {
        final lst = baseListResponse.data
            .map((Map model) => EventGuestOffline.fromJson(model))
            .toList();
        // Delete all before insert new guest
        db.eventGuestDAO
            .deleteAllGuestAllsForScanQRByEventId(eventId)
            .then((v) {
          // Insert all guest
          db.eventGuestDAO.insertAlls(lst, eventId);
        });
      }
      Future.delayed(Duration(milliseconds: 1000), () {
        percentDownloading = 1.0;
        downloadStatusTitle = appLocalizations.downloadCompletedContent;
        notifyListeners();
      });
      Future.delayed(Duration(milliseconds: 2000), () {
        isDownloadingLocal = false;
        if (isNoInternet) {
          isLoadingGuest = true;
          // Clear guests
          this.resetEventGuestsData();
          Future.delayed(Duration(milliseconds: 500), () {
            // Call API get event guests
            this.getEventGuests(context, eventId.toInt(), callbackFn: () {
              isLoadingGuest = false;
              notifyListeners();
            });
          });
        }
        notifyListeners();
      });
    }, (Errors message) {
      isDownloadingLocal = false;
      notifyListeners();
      if (message.code != -2) {}
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        // Show popup when disconnect internet
        locator<Utilities>().showTwoButtonDialog(
            context,
            DialogType.QUESTION,
            null,
            appLocalizations.titleError,
            appLocalizations.noInternet,
            appLocalizations.buttonTryAgain,
            appLocalizations.buttonClose, () {
          getEventGuestAllOnline(context, eventId);
        }, () {});
      } else {
        // Show popup when something wrong
        locator<Utilities>().showOneButtonDialog(
            context,
            DialogType.ERROR,
            null,
            appLocalizations.titleError,
            appLocalizations.somethingWrongContent,
            appLocalizations.buttonClose,
            () {});
      }
    });
    // Call api method get
    await ApiRequest().requestGetEventGuestAll(context, eventId, callBack);
  }

  void doTryAgainForGuest(BuildContext context, int eventId) {
    isLoadingGuest = true;
    notifyListeners();
    // Clear guests
    this.resetEventGuestsData();
    // Call API get event guests
    this.getEventGuests(context, eventId, callbackFn: () {
      isLoadingGuest = false;
      notifyListeners();
      this.btnTryAgainController.stop();
    });
  }

  Future getEventDetailInfo(BuildContext context, int id) async {
    model = await db.eventTodayDAO.getEventDetailById(id.toDouble());
    if (model == null) {
      getEventDetailInfoOnline(context, id);
    } else {
      // Get visitor type by lang
      if (model.visitorTypeValue != null && model.visitorTypeValue.isNotEmpty) {
        Map<String, dynamic> visitorTypeValueToJson =
            convert.json.decode(model.visitorTypeValue);
        var preferences = await SharedPreferences.getInstance();
        var langSaved = preferences.getString(Constants.KEY_LANGUAGE) ??
            Constants.LANG_DEFAULT;
        if (langSaved == Constants.EN_CODE) {
          visitorTypeName = visitorTypeValueToJson["en"];
        } else if (langSaved == Constants.VN_CODE) {
          visitorTypeName = visitorTypeValueToJson["vi"];
        }
      }
      // Start date event
      startDateEvent =
          await utilities.convertDateToStringLongDate(model.startDate, context);
      endDateEvent =
          await utilities.convertDateToStringLongDate(model.endDate, context);
      printModel = await Utilities().getPrinter();
      isLoading = false;
      notifyListeners();
    }
  }

  Future getEventDetailInfoOnline(BuildContext context, int id) async {
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      model = EventDetailInfo.fromJson(baseResponse.data);
      // Get visitor type by lang
      if (model.visitorTypeValue != null && model.visitorTypeValue.isNotEmpty) {
        Map<String, dynamic> visitorTypeValueToJson =
            convert.json.decode(model.visitorTypeValue);
        var preferences = await SharedPreferences.getInstance();
        var langSaved = preferences.getString(Constants.KEY_LANGUAGE) ??
            Constants.LANG_DEFAULT;
        if (langSaved == Constants.EN_CODE) {
          visitorTypeName = visitorTypeValueToJson["en"];
        } else if (langSaved == Constants.VN_CODE) {
          visitorTypeName = visitorTypeValueToJson["vi"];
        }
      }
      // Start date event
      startDateEvent =
          await utilities.convertDateToStringLongDate(model.startDate, context);
      endDateEvent =
          await utilities.convertDateToStringLongDate(model.endDate, context);
      printModel = await Utilities().getPrinter();
      isLoading = false;
      notifyListeners();
    }, (Errors message) {
      if (message.code != -2) {}
    });

    await ApiRequest().requestGetEventDetail(context, callBack, id);
  }

  Future getEventGuests(BuildContext context, int id,
      {Function callbackFn}) async {
    // If full list
    if (totalItem <= lstGuest.length) {
      if (callbackFn != null) {
        callbackFn();
      }
      return;
    }
    isNoInternet = false;
    ApiCallBack callBack =
        ApiCallBack((BaseListResponse baseListResponse) async {
      totalItem = baseListResponse.totalCount; // Get total
      pageIndex = pageIndex + 1;
      try {
        final lst = baseListResponse.data
            .map((Map model) => EventGuest.fromJson(model))
            .toList();
        lstGuest = locator<Utilities>().combineTwoList(lstGuest, lst);
        notifyListeners();
        if (callbackFn != null) {
          callbackFn();
        }
      } catch (e) {
        utilities.printLog(e.toString());
      }
    }, (Errors message) async {
      if (message.code != -2) {}
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        // No internet
        final lstEventGuestLocal =
            await db.eventGuestDAO.getAlls(id.toDouble(), pageIndex - 1);
        // If user not yet sync to local DB
        if (lstEventGuestLocal == null || lstEventGuestLocal.isEmpty) {
          isNoInternet = true;
        } else {
          if (lstEventGuestLocal != null && lstEventGuestLocal.isNotEmpty) {
            totalItem = lstEventGuestLocal[0].totalCount;
            pageIndex = pageIndex + 1;
          }
          lstGuest = locator<Utilities>()
              .combineTwoList(lstGuest, lstEventGuestLocal ?? []);
          notifyListeners();
          if (callbackFn != null) {
            callbackFn();
          }
        }
      }
      if (callbackFn != null) {
        callbackFn();
      }
    });
    await ApiRequest().requestGetEventGuests(
        context, callBack, id, pageIndex, Constants.PAGE_MAX_SIZE, '');
  }

  Future getEventSearchGuests(BuildContext context, int id,
      {String searchText = '', bool isLoadMore = false, Function callbackFn}) async {
    isLoadingSearchGuest = true;
    notifyListeners();
    // If full list
    if (totalSearchItem <= lstSearchGuest.length) {
      isLoadingSearchGuest = false;
      notifyListeners();
      callbackFn();
      return;
    }
    ApiCallBack callBack =
        ApiCallBack((BaseListResponse baseListResponse) async {
      pageIndexSearch = pageIndexSearch + 1;
      totalSearchItem = baseListResponse.totalCount; // Get total
      if (baseListResponse.data != null) {
        final lst = baseListResponse.data
            .map((Map model) => EventGuest.fromJson(model))
            .toList();
        if (isLoadMore) {
          lstSearchGuest =
              locator<Utilities>().combineTwoList(lstSearchGuest, lst);
        } else {
          lstSearchGuest = lst;
        }
      }
      isLoadingSearchGuest = false;
      notifyListeners();
      if (callbackFn != null) {
        callbackFn();
      }
    }, (Errors message) async {
      if (message.code != -2) {}
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        final lstEventGuestLocal = await db.eventGuestDAO
            .getSearchAlls(id.toDouble(), searchText, pageIndexSearch - 1);
        if (lstEventGuestLocal != null && lstEventGuestLocal.isNotEmpty) {
          totalSearchItem = lstEventGuestLocal[0].totalCount;
          pageIndexSearch = pageIndexSearch + 1;
        }
        lstSearchGuest = locator<Utilities>()
            .combineTwoList(lstSearchGuest, lstEventGuestLocal);
        if (callbackFn != null) {
          callbackFn();
        }
      }
      isLoadingSearchGuest = false;
      notifyListeners();
    });

    await ApiRequest().requestGetEventGuests(context, callBack, id,
        pageIndexSearch, Constants.PAGE_MAX_SIZE, searchText);
  }

  void updateCheckInForGuestByScanQR(List<EventGuest> lstEventGuestsScan) {
    bool isUpdateStatus = false;
    for (var eventGuestsScan in lstEventGuestsScan) {
      for (var guest in lstGuest) {
        if (guest.inviteCode == eventGuestsScan.inviteCode &&
            guest.visitorName == eventGuestsScan.visitorName &&
            guest.visitorEmail == eventGuestsScan.visitorEmail) {
          // Update status layout
          guest.checkinStatus = 1;
          isUpdateStatus = true;
          break;
        }
      }
    }
    if (isUpdateStatus) {
      statusCheckin = !statusCheckin;
      notifyListeners();
    }
    // Remove all item in list guest checked
    utilities.lstEventGuestCheckedScan.clear();
    utilities.lstEventGuestCheckedScan = null;
  }

  Future actionCheckinEventGuest(
      BuildContext context, EventGuest guest, int index) async {
    final isSynced =
        await db.eventGuestDAO.checkSynchronizedGuestAll(guest.eventId);
    if (isSynced) {
      // Update status check-in to DB local
      db.eventGuestDAO
          .checkInForGuestByInviteCode(
              guest.inviteCode, model.branchId.toDouble(), employeeId)
          .then((_) {
        Future.delayed(Duration(seconds: 1), () {
          locator<SyncService>().syncEventCheckedGuest(context);
        });
      });
      guest.checkinStatus = 1;
      statusCheckin = !statusCheckin;
      notifyListeners();
      return;
    }
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      guest.checkinStatus = 1;
      statusCheckin = !statusCheckin;
      notifyListeners();
    }, (Errors message) {
      if (message.code != -2) {}
      if (message.description == 'EVENT_CannotCheckIn') {
        Utilities().showNoButtonDialog(
            context,
            DialogType.SUCCES,
            3,
            appLocalizations.notifyTitle,
            appLocalizations.cannotCheckinContent,
            () {});
      }
      if (message.description == appLocalizations.noPhone) {
        Utilities().showNoButtonDialog(
            context,
            DialogType.SUCCES,
            3,
            appLocalizations.notifyTitle,
            appLocalizations.alreadyCheckoutContent,
            () {});
      }
      if (message.description == appLocalizations.noData) {
        Utilities().showNoButtonDialog(context, DialogType.SUCCES, 3,
            appLocalizations.notifyTitle, appLocalizations.noData, () {});
      }
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        // Show popup when disconnect internet
        locator<Utilities>().showTwoButtonDialog(
            context,
            DialogType.QUESTION,
            null,
            appLocalizations.titleError,
            appLocalizations.noInternet,
            appLocalizations.buttonTryAgain,
            appLocalizations.buttonClose, () {
          actionCheckinEventGuest(context, guest, index);
        }, () {});
      }
    });
    await ApiRequest().requestEventAction(context, callBack, guest.inviteCode);
  }

  void resetEventSearchGuestsData() {
    totalSearchItem = Constants.MAX_INT;
    pageIndexSearch = 1;
    lstSearchGuest.clear();
  }

  void resetLoadingSearchNull() {
    isLoadingSearchGuest = null;
    notifyListeners();
  }

  void resetEventGuestsData() {
    totalItem = Constants.MAX_INT;
    pageIndex = 1;
    lstGuest.clear();
  }

  void doPrinter(BuildContext cx, EventGuest item) async {
    guestPrinter = item;
    notifyListeners();
    var preferences = await SharedPreferences.getInstance();
    String printer = preferences.getString(Constants.KEY_PRINTER);
    bool checkPrintSetting = (printer != null && printer.isNotEmpty);
    if (!checkPrintSetting) {
      AppRouter.pushTo(cx, PrinterPage.route_name);
    } else {
      if (model.isPrint == 1) {
        isWaitingPrinter = true;
        notifyListeners();
        await Future.delayed(new Duration(milliseconds: 500));
        printTemplate();
      }
    }
  }

  Future<void> printTemplate() async {
    timerDoneAnyWay = Timer(Duration(seconds: Constants.TIMEOUT_PRINTER), () {
      if (isWaitingPrinter) {
        isWaitingPrinter = false;
        notifyListeners();
      }
    });
    String response = "";
    try {
      if (printModel == null) {
        printModel = await Utilities().getPrinter();
      }
      if (printModel != null) {
        RenderRepaintBoundary boundary =
            repaintBoundary.currentContext.findRenderObject();
        await Utilities().printJob(printModel, boundary);
        if (isWaitingPrinter) {
          timerDoneAnyWay?.cancel();
          isWaitingPrinter = false;
          notifyListeners();
        }
      }
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
      Utilities().printLog("$response ");
      if (isWaitingPrinter) {
        timerDoneAnyWay?.cancel();
        isWaitingPrinter = false;
        notifyListeners();
      }
    } catch (e) {}
  }

  void openOrCloseSearch() {
    isSearchOpen = !isSearchOpen;
    notifyListeners();
  }

  void updateTabBar(int index) {
    selectedBarIndex = index;
    notifyListeners();
  }

  Future<EventTicketDetail> getEventTicketOrder(double eventId, Function callbackFn) async {
    var completer = new Completer<EventTicketDetail>();
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      eventDetail = EventTicketDetail.fromJson(baseResponse.data);
      listOrderInfo = eventDetail.orderInfo;
      listOrderInfo?.sort((a, b) => a.guestName.compareTo(b.guestName));
      await db.eTOrderInfoDAO.insertAll(eventDetail.orderInfo);
      db.eTBookingConfigInforDAO.insertOne(eventDetail.settingInfo);
      await db.eTBookingDiscountInfoDAO.insertAll(eventDetail.ticketInfo.bookingDiscountInfo);
      await db.eTTicketInfoDAO.insertOne(eventDetail.ticketInfo);
      await db.eTPayMentInfoDAO.insertOne(eventDetail.paymentInfo);
      await db.eTPaymentTypeDAO.insertAll(eventDetail.paymentTypes, eventDetail.eventInfo.id);
      completer.complete(eventDetail);
      callbackFn();
      reloadListOrder = !reloadListOrder;
      notifyListeners();
    }, (Errors message) async {
      callbackFn();
      reloadListOrder = !reloadListOrder;
      notifyListeners();
    });
    await ApiRequest()
        .requestEventTicketDetails(context, eventId, callBack);
    return completer.future;
  }

  Future<List<ETOrderInfo>> getOrderFromData(double eventId, String searchKey) async {
    if (searchKey?.isNotEmpty == true) {
      listOrderInfo = await db.eTOrderInfoDAO.searchOrdersByKey(eventId, searchKey);
      listOrderInfoPaid = await db.eTOrderInfoDAO.searchOrdersPaidByKey(eventId, searchKey);
    } else {
      listOrderInfo = await db.eTOrderInfoDAO.getOrdersByEventId(eventId);
      listOrderInfoPaid = await db.eTOrderInfoDAO.getOrdersPaidByEventId(eventId);
    }
    reloadListOrder = !reloadListOrder;
    notifyListeners();
    return listOrderInfo ?? List();
  }

  Future checkInEventOrder(ETOrderInfo etOrderInfo, List<ETOrderDetailInfo> orderDetails, double eventTicketId, bool isPaidList, {Function callBackDone}) async {
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
    isLoadingCheckIn = true;
    notifyListeners();
    for (ETOrderDetailInfo orderDetail in orderDetails) {
      if (!orderDetail.isUsed()) {
        checkInEventTicket(etOrderInfo, orderDetail, eventTicketId, isPaidList, orderDetails: orderDetails, isSingle: false, callBackDone: callBackDone); 
      }
    }
  }

  Future checkInEventTicket(ETOrderInfo etOrderInfo, ETOrderDetailInfo orderDetail, double eventTicketId, bool isPaidList,
      {List<ETOrderDetailInfo> orderDetails, bool isSingle = true, Function callBackDone}) async {
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
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      await updateCheckIn(orderDetail, isPaidList, etOrderInfo);
      if (isSingle || numCheckInOrder == orderDetails?.length) {
        utilities.playSound();
        Utilities().showNoButtonDialog(context, DialogType.SUCCES, Constants.AUTO_HIDE_LESS,
            appLocalizations.notifyTitle, appLocalizations.checkinSuccess, null);
        reloadListOrder = !reloadListOrder;
        numCheckInOrder = 0;
        isLoadingCheckIn = false;
        if (callBackDone != null) {
          callBackDone();
        }
        notifyListeners();
      }
    }, (Errors message) async {
      isLoadingCheckIn = false;
      notifyListeners();
      if (callBackDone != null) {
        callBackDone();
      }
      if (message.code != -2) {
        if (message.description == appLocalizations.inviteCodeUsed) {
          await updateCheckIn(orderDetail, isPaidList, etOrderInfo);
        }
        if (isSingle || numCheckInOrder == orderDetails?.length) {
          Utilities().showErrorPop(context, message.description, null, () {}, callbackDismiss: () {});
        }
      }
    });
    await ApiRequest().requestCheckInEventTicket(context, orderDetail.inviteCode, eventTicketId, callBack);
  }

  Future updateCheckIn(ETOrderDetailInfo orderDetail, bool isPaidList, ETOrderInfo etOrderInfo) async {
    orderDetail.status = "1";
    if (isPaidList) {
      int indexOther = listOrderInfo.indexWhere((element) => element.id == etOrderInfo.id);
      ETOrderInfo etOrderInfoOther = listOrderInfo[indexOther];
      int indexDetail = etOrderInfoOther.orderDetails.indexWhere((element) => element.id == orderDetail.id);
      ETOrderDetailInfo detail = etOrderInfoOther.orderDetails[indexDetail];
      detail.status = "1";
    } else {
      int indexOther = listOrderInfoPaid.indexWhere((element) => element.id == etOrderInfo.id);
      if (indexOther >= 0) {
        ETOrderInfo etOrderInfoOther = listOrderInfoPaid[indexOther];
        int indexDetail = etOrderInfoOther.orderDetails.indexWhere((element) => element.id == orderDetail.id);
        if (indexDetail >= 0) {
          ETOrderDetailInfo detail = etOrderInfoOther.orderDetails[indexDetail];
          detail.status = "1";
        }
      }
    }
    await db.eTOrderDetailInfoDAO.updateUsedStatus(orderDetail.inviteCode, "1");
    numCheckInOrder++;
  }

  Future paidForOrder(ETOrderInfo orderInfo, {Function callBackDone}) async {
    if (eventDetail.isEventExpired()) {
      Utilities().showErrorPop(context, appLocalizations.eventExpired, Constants.AUTO_HIDE_LESS, () {
      }, callbackDismiss: () {
        if (callBackDone != null) {
          callBackDone();
        }
      });
    } else {
      isLoadingCheckIn = true;
      notifyListeners();
      ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
        orderInfo.status = OrderTicketStatus.PAID;
        await db.eTOrderInfoDAO.updateStatusOrdersById(orderInfo.id, OrderTicketStatus.PAID, orderInfo.paymentType == PaymentType.CASH);
        if (orderInfo.paymentType == PaymentType.CASH) {
          listOrderInfoPaid.add(orderInfo);
        }
        utilities.playSound();
        Utilities().showNoButtonDialog(
            context,
            DialogType.SUCCES,
            Constants.AUTO_HIDE_LESS,
            appLocalizations.notifyTitle,
            appLocalizations.paySuccess, null);
        reloadListOrder = !reloadListOrder;
        isLoadingCheckIn = false;
        if (callBackDone != null) {
          callBackDone();
        }
        notifyListeners();
      }, (Errors message) async {
        isLoadingCheckIn = false;
        notifyListeners();
        if (callBackDone != null) {
          callBackDone();
        }
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
}
