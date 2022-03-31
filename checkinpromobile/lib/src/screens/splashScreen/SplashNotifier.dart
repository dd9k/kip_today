import 'dart:async';
import 'dart:io';
import 'package:async/async.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/Authenticate.dart';
import 'package:checkinpromobile/src/model/BaseListResponse.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/IdEmployeeInfo.dart';
import 'package:checkinpromobile/src/model/PersonalInfo.dart';
import 'package:checkinpromobile/src/model/WelcomeMessage.dart';
import 'package:checkinpromobile/src/screens/DomainPage/DomainScreen.dart';
import 'package:checkinpromobile/src/screens/ResetPassword/ResetPasswordScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/HomeScreen.dart';
import 'package:checkinpromobile/src/screens/login/LoginScreen.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/services/SyncService.dart';
import 'package:checkinpromobile/src/utilities/PermissionCallBack.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluro/fluro.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../main.dart';
import '../MainNotifier.dart';

class SplashNotifier extends MainNotifier {
  var isRequestDone = false;
  var isCountDownDone = false;
  CancelableOperation cancelableOperation;
  Timer timerLoading;
  Timer timerCountdown;
  bool isWaitingRequest = false;
  IdEmployeeInfo employeeInfo;
  String dataNotification;

  void initURL() {
    var index = parent.preferences.getInt(Constants.KEY_DEV_MODE) ?? 0;
    Constants().indexURL = index;
  }

  Future<void> countDownToNext(BuildContext context) async {
    if (Platform.isAndroid) {
      dataNotification = await Constants.REMINDER_CHANNEL.invokeMethod(Constants.ACTION_HANDLER_NOTIFICATION);
    }
    timerCountdown = Timer(Duration(milliseconds: 650), () {
      isCountDownDone = true;
      if (isRequestDone) {
        moveToNext(context);
      }
    });
  }

  void refreshToken(BuildContext context) async {
    var isLogin = parent.preferences.getBool(Constants.KEY_IS_LOGGED) ?? false;
    parent.preferences.setBool(Constants.KEY_FIRST_START, true);
    if (isLogin) {
      var isConnectInternet = MyApp.of(context).isConnection;
      var isEventTicket = utilities.getAuthorization(parent.preferences).isEventTicket;
      if (isConnectInternet) {
        if (utilities.isNeedRefresh(parent.preferences) || isEventTicket == true) {
          var firebaseId =
              parent.preferences.getString(Constants.KEY_FIREBASE_TOKEN) ?? "";
          timerLoading = Timer(Duration(seconds: 3), () {
            isWaitingRequest = true;
            notifyListeners();
          });
          await useAppOnline(context, firebaseId);
        } else {
          getWelcomeMessage(context);
          isRequestDone = true;
          if (isCountDownDone) {
            moveToNext(context);
          }
        }
      } else {
        isRequestDone = true;
        if (isCountDownDone) {
          moveToNext(context);
        }
      }
    } else {
      isRequestDone = true;
      if (isCountDownDone) {
        moveToNext(context);
      }
    }
  }

  Future useAppOnline(BuildContext context, String firebaseId) async {
    ApiCallBack listCallBack = ApiCallBack((BaseResponse baseResponse) async {
      var authenticationString = JsonEncoder().convert(baseResponse.data);
      parent.preferences.setString(Constants.KEY_AUTHENTICATE, authenticationString);
      parent.preferences.setInt(Constants.KEY_LAST_REFRESH, DateTime.now().millisecondsSinceEpoch);
      // Get fullname in authentication string
      var authorizationModel = Authenticate.fromJson(baseResponse.data);
      employeeInfo = authorizationModel.employeeInfo;
      getWelcomeMessage(context);
      PersonalInfo personalInfo = employeeInfo.personalInfo;
      parent.preferences.setString(Constants.KEY_FULLNAME, personalInfo.fullName);
      // Save Attendance mode
      parent.preferences.setBool(
          Constants.KEY_IS_ATTENDANCE_MODE, employeeInfo.isAttendance ?? false);
      utilities.printLog(
          'Class SplashScreen === Function useAppOnline === Api call success',
          isOutputFile: Constants.PRINT_LOG_OUTPUT_FILE);
      moveToNext(context);
      // Sync to server
      locator<SyncService>().syncEventCheckedGuest(context);
      locator<SyncService>().syncInvitationCheckedVisitor(context);
    }, (Errors message) async {
      utilities.printLog(
          'Class SplashScreen === Function useAppOnline === ${message.code} - ${message.description}',
          isOutputFile: Constants.PRINT_LOG_OUTPUT_FILE);
      if (message.code != -2) {
        // Cho trường hợp thiết bị android reinstall không xoá cache máy
        if (message.code == 0) {
          final username = parent.preferences.getString(Constants.KEY_EMAIL) ?? "";
          final password = parent.preferences.getString(Constants.KEY_PASSWORD) ?? "";
          if (username != '' && password != '') {
            doLogin(context, username, password);
          } else {
            doSignout(context);
          }
        } else {
          final username = parent.preferences.getString(Constants.KEY_EMAIL) ?? "";
          final password = parent.preferences.getString(Constants.KEY_PASSWORD) ?? "";
          if (username != '' && password != '') {
            doLogin(context, username, password);
          }
        }
      } else {
        final username = parent.preferences.getString(Constants.KEY_EMAIL) ?? "";
        final password = parent.preferences.getString(Constants.KEY_PASSWORD) ?? "";
        if (username != '' && password != '') {
          doLogin(context, username, password);
        }
      }
    });
    var authorization = utilities.getAuthorization(parent.preferences);
    var token = (authorization as Authenticate).refreshToken;
    // Set timer next screen when api request long time
    cancelableOperation = await ApiRequest()
        .requestRefreshTokenApi(context, firebaseId, token, listCallBack);
    await cancelableOperation.valueOrCancellation();
  }

  Future getWelcomeMessage(BuildContext context) async {
    ApiCallBack callBack = ApiCallBack((BaseListResponse baseListResponse) async {
      var listMessage = baseListResponse.data.map((Map model) => WelcomeMessage.fromJson(model)).toList();
      await db.welcomeMessageDAO.deleteAll();
      await db.welcomeMessageDAO.insertAll(listMessage);
    }, (Errors message) async {

    });
    List<double> branches = List();
    employeeInfo?.jobInfo?.office?.forEach((element) {
      branches.add(element.id);
    });
    await ApiRequest()
        .requestGetWelcomeMessage(context, branches, callBack);
  }

  Future doLogin(BuildContext context, String username, String password) async {
    var firebaseToken = parent.preferences.getString(Constants.KEY_FIREBASE_TOKEN) ?? "";
    var domain = parent.preferences.getString(Constants.KEY_DOMAIN_STRING) ?? "";
    var deviceInfor = await locator<Utilities>().getDeviceInfo();
    var deviceEmployee = await locator<Utilities>().getInfoDeviceForEmployee();
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      var authenticationString = JsonEncoder().convert(baseResponse.data);
      employeeInfo = Authenticate.fromJson(baseResponse.data).employeeInfo;
      getWelcomeMessage(context);
      parent.preferences.setString(Constants.KEY_AUTHENTICATE, authenticationString);
      parent.preferences.setString(Constants.KEY_EMPLOYEE_DATA, authenticationString);
      parent.preferences.setBool(Constants.KEY_IS_LOGGED, true);
      parent.preferences.setBool(Constants.KEY_IS_HAS_LOGIN, true);
      parent.preferences.setBool(Constants.KEY_HAS_CACHE_ACCOUNT_DATA, true);
      // Save email and password login
      parent.preferences.setString(Constants.KEY_EMAIL, username);
      parent.preferences.setString(Constants.KEY_PASSWORD, password);
      // Get fullname in authentication string
      PersonalInfo personalInfo = employeeInfo.personalInfo;
      parent.preferences.setString(Constants.KEY_FULLNAME, personalInfo.fullName);
      // Save Attendance mode
      parent.preferences.setBool(
          Constants.KEY_IS_ATTENDANCE_MODE, employeeInfo.isAttendance ?? false);
      // Next screen
      moveToNext(context);
    }, (Errors message) async {
      parent.preferences.setBool(Constants.KEY_IS_LOGGED, false);
      parent.preferences.setString(Constants.KEY_INFO_STEP, Constants.KEY_IS_DOMAIN);
      moveToNext(context);
    });
    await ApiRequest().requestLoginApi(context, username, password,
        firebaseToken, deviceInfor, deviceEmployee, domain, callBack);
  }

  void moveToNext(BuildContext context) async {
    var isLogin = parent.preferences.getBool(Constants.KEY_IS_LOGGED) ?? false;
    var infoStep = parent.preferences.getString(Constants.KEY_INFO_STEP) ?? '';
    var isFirstLaunch = parent.preferences.getBool(Constants.KEY_IS_LAUNCH) ?? true;
    var isHasCacheAccount =
        parent.preferences.getBool(Constants.KEY_HAS_CACHE_ACCOUNT_DATA) ?? false;
    var route = DomainScreen.route_name;
    if (!isFirstLaunch) {
      if (isLogin) {
        route = HomeScreen.route_name;
      } else {
        if (infoStep == Constants.KEY_IS_DOMAIN) {
          if (isHasCacheAccount) {
            final fullName =
                parent.preferences.getString(Constants.KEY_FULLNAME) ?? '';
            final email = parent.preferences.getString(Constants.KEY_EMAIL) ?? '';
            route = LoginScreen.route_name;
            AppRouter.pushToWithArguments(context, route,
                arguments: {
                  'email': email,
                  'fullName': fullName,
                  'loginType': 2,
                  'dataNotification': dataNotification
                },
                isRemoveUntil: true);
            return;
          }
          route = DomainScreen.route_name;
        } else if (infoStep == Constants.KEY_IS_LOGIN) {
          route = LoginScreen.route_name;
        } else if (infoStep == Constants.KEY_IS_CHANGE_PASS_FIRST) {
          route = ResetPasswordScreen.route_name;
        }
      }
      AppRouter.pushToWithArguments(context, route, isRemoveUntil: true, transitionType: TransitionType.fadeIn, arguments: {
        'dataNotification': dataNotification
      });
    } else {
      // Ask permission for device
      acquiredPermission(context);
    }
  }

  // Permission device start
  Future<void> acquiredPermission(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      if (Platform.isIOS) {
        await iOSPermission(context);
      } else {
        await platformPermission(context, true);
      }
    } catch(_) {
      doNextFlow(context);
    }
  }

  Future platformPermission(BuildContext context, bool iOSPermission) async {
    var permissionCallBack = PermissionCallBack(() async {
      await doNextFlow(context);
    }, () async {
      await doNextFlow(context);
    }, () async {
      await doNextFlow(context);
    });
    List<PermissionGroup> permissions = List();
    if (Platform.isAndroid) {
      permissions = Constants.PERMISSION_LIST_ANDROID;
    } else {
      permissions = Constants.PERMISSION_LIST_IOS;
    }
    await Utilities.requestPermission(
        context, permissions, permissionCallBack, false, iOSPermission);
  }

  Future doNextFlow(BuildContext context) async {
    if (Platform.isAndroid) {
      await firebaseCloudMessaging_Listeners();
    }
    parent.preferences.setBool(Constants.KEY_IS_LAUNCH, false);
    // Save to preferences device
    parent.preferences.setString(Constants.KEY_INFO_STEP, Constants.KEY_IS_DOMAIN);
    AppRouter.pushTo(context, DomainScreen.route_name, isRemoveUntil: true);
  }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  // ignore: non_constant_identifier_names
  Future<void> firebaseCloudMessaging_Listeners() async {
    await _firebaseMessaging.getToken().then((token) async {
      utilities.printLog("token: $token");
      parent.preferences.setString(Constants.KEY_FIREBASE_TOKEN, token);
    });
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {},
      onResume: (Map<String, dynamic> message) async {},
      onLaunch: (Map<String, dynamic> message) async {},
    );
  }

  Future<void> iOSPermission(BuildContext context) async {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) async {
      await platformPermission(context, settings.alert);
    });
    await firebaseCloudMessaging_Listeners();
  }
  // Permission device end

  Future doSignout(BuildContext context) async {
    var firebaseToken =
        parent.preferences.getString(Constants.KEY_FIREBASE_TOKEN) ?? "";
    var authorization = locator<Utilities>().getAuthorization(parent.preferences);
    var token = (authorization as Authenticate).refreshToken;
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      parent.preferences.clear();
      moveToNext(context);
    }, (Errors message) {
      parent.preferences.clear();
      moveToNext(context);
    });
    // Call API signout
    await ApiRequest()
        .requestSignOutApi(context, firebaseToken, token, callBack);
  }

  @override
  void dispose() {
    cancelableOperation?.cancel();
    timerCountdown?.cancel();
    timerLoading?.cancel();
    super.dispose();
  }
}
