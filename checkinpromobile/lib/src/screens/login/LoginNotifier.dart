import 'dart:convert';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/Authenticate.dart';
import 'package:checkinpromobile/src/model/BaseListResponse.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/IdEmployeeInfo.dart';
import 'package:checkinpromobile/src/model/PersonalInfo.dart';
import 'package:checkinpromobile/src/model/WelcomeMessage.dart';
import 'package:checkinpromobile/src/screens/ActiveEmail/ActiveEmailScreen.dart';
import 'package:checkinpromobile/src/screens/DomainPage/DomainScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/HomeScreen.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/services/SyncService.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/utilities/UtilityNotifier.dart';
import 'package:checkinpromobile/src/utilities/Validator.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

enum LOGIN_ERROR_TYPE {
  IS_EMPTY_EMAIL,
  IS_EMPTY_PASS,
  WRONG_EMAIL_FORMAT,
  EMAIL_NOT_EXIST,
  WRONG_PASSWORD,
}

class LoginNotifier extends UtilityNotifier {
  RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool isLoading = false;
  bool isShowFAB = true;
  bool isUpdateLang = false;
  bool isFabOpen = false;
  bool isTouchOutSide = false;
  bool isShowPass = false;
  String errorEmail;
  String errorPass;
  LOGIN_ERROR_TYPE loginErrorType;
  bool isLoginByBio = false;
  IdEmployeeInfo employeeInfo;
  String dataNotification;

  Future<bool> _isBiometricAvailable(bool mounted) async {
    bool isAvailable = false;
    try {
      isAvailable = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return isAvailable;

    isAvailable
        ? print('Biometric is available!')
        : print('Biometric is unavailable.');

    return isAvailable;
  }

  Future<void> _getListOfBiometricTypes(bool mounted) async {
    List<BiometricType> listOfBiometrics;
    try {
      listOfBiometrics = await _localAuthentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;
  }

  Future<void> _authenticateUser(BuildContext context, bool mounted) async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason:
            "Please authenticate to view your transaction overview",
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    isAuthenticated
        ? print('User is authenticated!')
        : print('User is not authenticated.');

    if (isAuthenticated) {
      AppRouter.pushToWithArguments(context, HomeScreen.route_name, isRemoveUntil: true, arguments: {
        'dataNotification': dataNotification
      });
    }
  }

  void onTap() {
    isTouchOutSide = true;
    notifyListeners();
  }

  Future<void> loginBio(BuildContext context, bool mounted) async {
    if (await _isBiometricAvailable(mounted)) {
      await _getListOfBiometricTypes(mounted);
      await _authenticateUser(context, mounted);
    }
  }

  Future<void> initURL() async {
    var langSaved = parent.preferences.getString(Constants.KEY_LANGUAGE) ??
        Constants.LANG_DEFAULT;
    if (arguments != null) {
      dataNotification = arguments["dataNotification"] as String;
    }
    currentLang = langSaved;
    var index = parent.preferences.getInt(Constants.KEY_DEV_MODE) ?? 0;
    Constants().indexURL = index;
  }

  List<bool> selections =
      List.generate(Constants.URL_LIST.length, (index) => false);

  Future<void> showPass() async {
    isShowPass = !isShowPass;
    isUpdateLang = !isUpdateLang;
    notifyListeners();
  }

  Future doLogin(BuildContext context, String username, String password) async {
    if (isLoginByBio) {
      return;
    }
    errorEmail = null;
    errorPass = null;
    isLoading = true;
    notifyListeners();
    final validEmailStr = Validator(context).validateEmail(username);
    if (validEmailStr != null) {
      errorEmail = validEmailStr;
      if (validEmailStr == appLocalizations.errorNoUserName) {
        loginErrorType = LOGIN_ERROR_TYPE.IS_EMPTY_EMAIL;
      } else if (validEmailStr == appLocalizations.validateEmail) {
        loginErrorType = LOGIN_ERROR_TYPE.WRONG_EMAIL_FORMAT;
      }
      isUpdateLang = !isUpdateLang;
      isLoading = false;
      btnController.stop();
      notifyListeners();
      return;
    }
    final validPassStr = Validator(context).validatePassword(password);
    if (validPassStr != null) {
      errorPass = validPassStr;
      if (validPassStr == appLocalizations.errorNoPassword) {
        loginErrorType = LOGIN_ERROR_TYPE.IS_EMPTY_PASS;
      }
      isUpdateLang = !isUpdateLang;
      isLoading = false;
      btnController.stop();
      notifyListeners();
      return;
    }

    var firebaseToken =
        parent.preferences.getString(Constants.KEY_FIREBASE_TOKEN) ?? "";
    var domain =
        parent.preferences.getString(Constants.KEY_DOMAIN_STRING) ?? "";
    var deviceInfor = await locator<Utilities>().getDeviceInfo();
    var deviceEmployee = await locator<Utilities>().getInfoDeviceForEmployee();
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      var authenticationString = JsonEncoder().convert(baseResponse.data);
      employeeInfo = Authenticate.fromJson(baseResponse.data).employeeInfo;
      getWelcomeMessage(context);
      parent.preferences
          .setString(Constants.KEY_AUTHENTICATE, authenticationString);
      parent.preferences
          .setString(Constants.KEY_EMPLOYEE_DATA, authenticationString);
      parent.preferences.setBool(Constants.KEY_IS_LOGGED, true);
      parent.preferences.setBool(Constants.KEY_IS_HAS_LOGIN, true);
      parent.preferences.setBool(Constants.KEY_HAS_CACHE_ACCOUNT_DATA, true);
      // Save email and password login
      parent.preferences.setString(Constants.KEY_EMAIL, username);
      parent.preferences.setString(Constants.KEY_PASSWORD, password);
      // Get fullname in authentication string
      PersonalInfo personalInfo = employeeInfo.personalInfo;
      parent.preferences
          .setString(Constants.KEY_FULLNAME, personalInfo.fullName);
      // Save Attendance mode
      parent.preferences.setBool(
          Constants.KEY_IS_ATTENDANCE_MODE, employeeInfo.isAttendance ?? false);
      // Next screen
      moveToHome(context);
    }, (Errors message) {
      handlerError(context, username, password, message);
    });
    await ApiRequest().requestLoginApi(context, username, password,
        firebaseToken, deviceInfor, deviceEmployee, domain, callBack);
  }

  Future<bool> checkSettingKeyBiometricsInPreference() async {
    var bioConfig =
        parent.preferences.getBool(Constants.KEY_BIO_CONFIG) ?? false;
    if (!bioConfig) {
      return false;
    }
    return true;
  }

  Future authenticateLogin(BuildContext context,
      TextEditingController emailCtrl, TextEditingController passCtrl) async {
    isLoginByBio = true;
    var username = parent.preferences.getString(Constants.KEY_EMAIL) ?? "";
    var password = parent.preferences.getString(Constants.KEY_PASSWORD) ?? "";
    // If username or password not exist
    if (username.isEmpty || password.isEmpty) {
      isLoginByBio = false;
      Utilities().showNoButtonDialog(
          context,
          DialogType.WARNING,
          3,
          appLocalizations.notifyTitle,
          appLocalizations.messageCommonError,
          () {});
      return;
    }
    emailCtrl.value = TextEditingValue(text: username);
    passCtrl.value = TextEditingValue(text: password);
    errorEmail = null;
    errorPass = null;
    isLoading = true;
    btnController.start();
    notifyListeners();
    var firebaseToken =
        parent.preferences.getString(Constants.KEY_FIREBASE_TOKEN) ?? "";
    var domain =
        parent.preferences.getString(Constants.KEY_DOMAIN_STRING) ?? "";
    var deviceInfor = await locator<Utilities>().getDeviceInfo();
    var deviceEmployee = await locator<Utilities>().getInfoDeviceForEmployee();
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      var oldUsername = parent.preferences.getString(Constants.KEY_EMAIL) ?? "";
      if (oldUsername != username) {
        doClearAccountData(this.context, isMoveDomain: false);
      }
      var authenticationString = JsonEncoder().convert(baseResponse.data);
      employeeInfo = Authenticate.fromJson(baseResponse.data).employeeInfo;
      getWelcomeMessage(context);
      parent.preferences
          .setString(Constants.KEY_AUTHENTICATE, authenticationString);
      parent.preferences
          .setString(Constants.KEY_EMPLOYEE_DATA, authenticationString);
      parent.preferences.setBool(Constants.KEY_IS_LOGGED, true);
      parent.preferences.setBool(Constants.KEY_IS_HAS_LOGIN, true);
      parent.preferences.setBool(Constants.KEY_HAS_CACHE_ACCOUNT_DATA, true);
      // Save email and password login
      parent.preferences.setString(Constants.KEY_EMAIL, username);
      parent.preferences.setString(Constants.KEY_PASSWORD, password);
      // Get fullname in authentication string
      PersonalInfo personalInfo = employeeInfo.personalInfo;
      parent.preferences
          .setString(Constants.KEY_FULLNAME, personalInfo.fullName);
      // Save Attendance mode
      parent.preferences.setBool(
          Constants.KEY_IS_ATTENDANCE_MODE, employeeInfo.isAttendance ?? false);
      // Next screen
      moveToHome(context);
    }, (Errors message) {
      isLoading = false;
      btnController.stop();
      notifyListeners();
      handlerError(context, username, password, message);
      isLoginByBio = false;
    });
    await ApiRequest().requestLoginApi(context, username, password,
        firebaseToken, deviceInfor, deviceEmployee, domain, callBack);
  }

  Future getWelcomeMessage(BuildContext context) async {
    ApiCallBack callBack =
        ApiCallBack((BaseListResponse baseListResponse) async {
      var listMessage = baseListResponse.data
          .map((Map model) => WelcomeMessage.fromJson(model))
          .toList();
      await db.welcomeMessageDAO.deleteAll();
      await db.welcomeMessageDAO.insertAll(listMessage);
    }, (Errors message) async {});
    List<double> branches = List();
    employeeInfo?.jobInfo?.office?.forEach((element) {
      branches.add(element.id);
    });
    await ApiRequest().requestGetWelcomeMessage(context, branches, callBack);
  }

  void handlerError(
      BuildContext context, String username, String password, Errors message) {
    isLoading = false;
    btnController.stop();
    if (message.code == -1) {
      utilities.showErrorPop(context, message.description, null, null);
    } else if (message.code >= 0) {
      if (appLocalizations.wrongPassword == message.description) {
        errorPass = message.description;
        loginErrorType = LOGIN_ERROR_TYPE.WRONG_PASSWORD;
      }
      if (appLocalizations.emailNotExist == message.description) {
        errorEmail = message.description;
        loginErrorType = LOGIN_ERROR_TYPE.EMAIL_NOT_EXIST;
      }
      if (message.description == Constants.COM_WRONGDOMAIN) {
        utilities.showNoButtonDialog(context, DialogType.WARNING, 3,
            appLocalizations.notifyTitle, appLocalizations.wrongDomain, () {});
      }
      if ("CO_NumberOfDevicesExceedsLimit" == message.description) {
        utilities.showNoButtonDialog(
            context,
            DialogType.WARNING,
            3,
            appLocalizations.notifyTitle,
            appLocalizations.limitDeviceError,
            () {});
      }
      if (message.description == "DE_RuleOneAccOneDevice") {
        utilities.showNoButtonDialog(
            context,
            DialogType.WARNING,
            3,
            appLocalizations.notifyTitle,
            appLocalizations.ruleOneAccOneDeviceForLogin,
            () {});
      }
    }
    notifyListeners();
  }

  void moveToHome(BuildContext context) {
    // Sync to server
    locator<SyncService>().syncEventCheckedGuest(context);
    locator<SyncService>().syncInvitationCheckedVisitor(context);
    AppRouter.pushToWithArguments(context, HomeScreen.route_name, isRemoveUntil: true, arguments: {
      'dataNotification': dataNotification
    });
  }

  Future<void> updateLang(BuildContext context, String lang) async {
    var langSaved = parent.preferences.getString(Constants.KEY_LANGUAGE) ??
        Constants.LANG_DEFAULT;
    if (langSaved == lang) {
      return;
    }
    if (!Constants.LIST_LANG.contains(lang)) {
      lang = Constants.EN_CODE;
    }
    parent.preferences.setString(Constants.KEY_LANGUAGE, lang);
    await appLocalizations.load(Locale(lang));
    currentLang = lang;
    switch (loginErrorType) {
      case LOGIN_ERROR_TYPE.IS_EMPTY_EMAIL:
        errorEmail = appLocalizations.errorNoUserName;
        break;
      case LOGIN_ERROR_TYPE.IS_EMPTY_PASS:
        errorPass = appLocalizations.errorNoPassword;
        break;
      case LOGIN_ERROR_TYPE.WRONG_EMAIL_FORMAT:
        errorEmail = appLocalizations.validateEmail;
        break;
      case LOGIN_ERROR_TYPE.EMAIL_NOT_EXIST:
        errorEmail = appLocalizations.emailNotExist;
        break;
      case LOGIN_ERROR_TYPE.WRONG_PASSWORD:
        errorPass = appLocalizations.wrongPassword;
        break;
      default:
    }
    isUpdateLang = !isUpdateLang;
    notifyListeners();
  }

  void doClearAccountData(BuildContext context, {bool isMoveDomain = true}) async {
    parent.preferences.setString(Constants.KEY_FULLNAME, '');
    parent.preferences.setString(Constants.KEY_EMAIL, '');
    parent.preferences.setString(Constants.KEY_PASSWORD, '');
    parent.preferences.setBool(Constants.KEY_BIO_CONFIG, false);
    parent.preferences.setBool(Constants.KEY_HAS_CACHE_ACCOUNT_DATA, false);
    parent.preferences.setBool(Constants.KEY_IS_LOGGED, false);
    parent.preferences.setString(Constants.KEY_AUTHENTICATE, "");
    parent.preferences.setString(Constants.KEY_EMPLOYEE_DATA, "");
    parent.preferences.setBool(Constants.KEY_IS_LOGGED, false);
    parent.preferences
        .setString(Constants.KEY_INFO_STEP, Constants.KEY_IS_DOMAIN);
    // Clear all data in local DB
    await db.deleteAllDataInDB();
    // Move to Domain screen
    if (isMoveDomain) {
      AppRouter.pushTo(context, DomainScreen.route_name, isRemoveUntil: true);
    }
  }

  void gotoActiveEmailScreen(BuildContext context) {
    // Move to login screen
    AppRouter.pushTo(context, ActiveEmailScreen.route_name);
  }
}
