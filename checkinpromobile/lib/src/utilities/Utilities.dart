import 'dart:async';
import 'dart:convert';
import 'dart:io' show Directory, File, FileMode, Platform;
import 'dart:typed_data';
import 'package:async/async.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:checkinpromobile/src/constants/AppStyles.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/model/AttendanceDetailResponse.dart';
import 'package:checkinpromobile/src/model/AttendanceGroup.dart';
import 'package:checkinpromobile/src/model/AttendanceGroupResult.dart';
import 'package:checkinpromobile/src/model/Authenticate.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/DeviceInfo.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/EventGuest.dart';
import 'package:checkinpromobile/src/model/EventTicketDetail.dart';
import 'package:checkinpromobile/src/model/ImageDownloaded.dart';
import 'package:checkinpromobile/src/model/InvitationGroup.dart';
import 'package:checkinpromobile/src/model/InviteNewVisitor.dart';
import 'package:checkinpromobile/src/model/LogGroup.dart';
import 'package:checkinpromobile/src/model/SurveyForm.dart';
import 'package:checkinpromobile/src/model/UserInfor.dart';
import 'package:checkinpromobile/src/model/VisitorLog.dart';
import 'package:checkinpromobile/src/model/WelcomeMessage.dart';
import 'package:checkinpromobile/src/screens/homeScreen/dashBoard/DashBoardNotifier.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/services/printService/PrinterModel.dart';
import 'package:checkinpromobile/src/services/printService/QLPrinterModel.dart';
import 'package:checkinpromobile/src/services/printService/XPrinterModel.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:network_image_to_byte/network_image_to_byte.dart';
import 'package:ntp/ntp.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
//import 'package:image/image.dart' as imglib;
import 'AppLocalizations.dart';
import 'PermissionCallBack.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/constants/AppDestination.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:synchronized/synchronized.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';

class Utilities {
  static final Utilities _singleton = Utilities._internal();

  factory Utilities() {
    return _singleton;
  }

  Utilities._internal();

  final _lockWriteFile = Lock();
  List<Function> doAgainsInternet = [];
  double paddingTopSizeHeight = 0.0;
  bool isInitFirebaseConfig = false;
  AudioCache _audioCache = AudioCache();
  var localIndexThemes;
  VoidCallback addNewInviteVisitor;
  List<EventGuest> lstEventGuestCheckedScan;

  void showPopupErrorNoInternet(
      BuildContext context, ApiCallBack apiCallBack, Function doAgain) {
    Utilities().doAgainsInternet.add(doAgain);
    if (Utilities().doAgainsInternet.length <= 1) {
      locator<Utilities>().showOneButtonDialog(
          context,
          DialogType.ERROR,
          null,
          AppLocalizations.of(context).titleError,
          AppLocalizations.of(context).noInternet,
          AppLocalizations.of(context).buttonTryAgain, () {
        Utilities().doAgainsInternet.forEach((item) {
          item();
        });
        Utilities().doAgainsInternet.clear();
      });
    }
  }

  Future<bool> isConnectInternet() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  printLog(String mess, {bool isOutputFile = false}) {
    if (kDebugMode) {
      print(DateTime.now().toString() + ": " + mess);
    }
//    if (isOutputFile && kReleaseMode) {
//      _lockWriteFile.synchronized(() {
//        _writeLogFile(mess);
//      });
//    }
  }

  Future _writeLogFile(String text) async {
    final Directory directory = Platform.isAndroid
        ? await getExternalStorageDirectory() // Android
        : await getApplicationDocumentsDirectory(); // iOS
    final dateTimeNow = DateTime.now();
    final dateFileNameLog = DateFormat('yyyy_MM_dd').format(dateTimeNow);
    final dateWriteLog =
        DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(dateTimeNow);
    final File file = File('${directory.path}/CIP_TODAY_$dateFileNameLog.log');
    // Write log file
    file.writeAsStringSync('\n($dateWriteLog) $text',
        mode: FileMode.append, flush: true);
  }

  Future<Uint8List> saveNetworkImage(
      String link, String fileName, Database db) async {
    try {
      Uint8List byteImage = await networkImageToByte(link);
      File fileSaved = await saveLocalFile(
          Constants.FOLDER_TEMP_AVATAR, fileName, null, byteImage);
      List<String> paths =
      fileSaved?.path?.split("${Constants.FILE_TYPE_IMAGE_AVATAR}/");
      String realLink = link.split("?temp_url_sig").first;
      await db.imageDownloadedDAO.insert(ImageDownloaded(realLink, paths?.last));
      return byteImage;
    } catch(_) {
      return null;
    }
  }

  Future<DateTime> getDateTimeNow(bool isConnection) async {
    if (isConnection) {
      return await NTP.now();
    } else {
      return DateTime.now();
    }
  }

  Future<Uint8List> getSavedNetworkImage(
      String link, String fileName, Database db) async {
    try {
      String realLink = link?.split("?temp_url_sig")?.first;
      if (realLink == null || realLink.isEmpty) {
        return null;
      }
      ImageDownloaded imageSaved = await db.imageDownloadedDAO.getByLink(realLink);
      if (imageSaved == null || imageSaved.localPath == null) {
        return saveNetworkImage(link, fileName, db);
      }
      String name = imageSaved?.localPath;
      String localPath = await getLocalPathFile(
          Constants.FOLDER_TEMP, Constants.FILE_TYPE_IMAGE_AVATAR, name, null);
      return File(localPath).readAsBytes();
    } catch(_) {
      return null;
    }
  }

  Future<String> getToken() async {
    var preferences = await SharedPreferences.getInstance();
    var authentication =
        preferences.getString(Constants.KEY_AUTHENTICATE) ?? "";
    var token = Authenticate.fromJson(json.decode(authentication)).accessToken;
    return Constants.FIELD_BEARER + token;
  }

  String getJoinDate(DateTime date, AppLocalizations appLocalizations) {
    final now = new DateTime.now();

    int years = now.year - date.year;
    int months = now.month - date.month;
    int days = now.day - date.day;

    if (months < 0 || (months == 0 && days < 0)) {
      years--;
      months += (days < 0 ? 11 : 12);
    }

    if (days < 0) {
      final monthAgo = new DateTime(now.year, now.month - 1, date.day);
      days = now.difference(monthAgo).inDays + 1;
    }

    String yearString = "";
    String monthString = "";
    String dayString = "";
    if (years > 0) {
      yearString = "$years ${appLocalizations.year} ";
    }
    if (months > 0) {
      monthString = "$months ${appLocalizations.month} ";
    }
    if (days > 0) {
      dayString = "$days ${appLocalizations.day}";
    }
    return "$yearString$monthString$dayString";
  }

  Future<String> getTokenNotBearer() async {
    var preferences = await SharedPreferences.getInstance();
    var authentication =
        preferences.getString(Constants.KEY_AUTHENTICATE) ?? "";
    var token = Authenticate.fromJson(json.decode(authentication)).accessToken;
    return token;
  }

  getAuthorizationNoPreferences() async {
    var preferences = await SharedPreferences.getInstance();
    var authenticationString =
        preferences.getString(Constants.KEY_AUTHENTICATE) ?? "";
    var authentication =
        Authenticate.fromJson(json.decode(authenticationString));
    return authentication;
  }

  Authenticate getAuthorization(SharedPreferences preferences) {
    var authenticationString =
        preferences.getString(Constants.KEY_AUTHENTICATE) ?? "";
    var authentication =
        Authenticate.fromJson(json.decode(authenticationString));
    return authentication;
  }

  Future<UserInfor> getUserInfor() async {
    var preferences = await SharedPreferences.getInstance();
    var userInforString = preferences.getString(Constants.KEY_USER_INFOR) ?? "";
    if (userInforString.isEmpty) {
      return null;
    }
    var userInfor = UserInfor.fromJson(json.decode(userInforString));
    var completer = new Completer<UserInfor>();
    completer.complete(userInfor);
    return completer.future;
  }

  Greeting greetingMessage(BuildContext context) {
    var timeNow = DateTime.now().hour;
    if (timeNow <= 12) {
      return Greeting(AppLocalizations.of(context).goodMorning, Icons.wb_sunny,
          AppLocalizations.of(context).subMorning);
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return Greeting(AppLocalizations.of(context).goodAfternoon, Icons.cloud,
          AppLocalizations.of(context).subAfternoon);
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return Greeting(AppLocalizations.of(context).goodEvening, Icons.star,
          AppLocalizations.of(context).subEvening);
    } else {
      return Greeting(AppLocalizations.of(context).goodNight,
          Icons.brightness_3, AppLocalizations.of(context).subNight);
    }
  }

  void showErrorPop(
      BuildContext context, String message, int autoHide, Function callBack,
      {Function callbackDismiss, String title = ""}) {
    locator<Utilities>().showOneButtonDialog(
        context,
        DialogType.ERROR,
        autoHide,
        title,
        message,
        AppLocalizations.of(context).buttonClose, () {
      if (callBack != null) {
        callBack();
      }
    }, callbackDismiss: () {
      callbackDismiss();
    });
  }

  void showTwoButtonDialog(
      BuildContext context,
      DialogType type,
      int autoHide,
      String title,
      String content,
      String textLeft,
      String textRight,
      Function leftCallback,
      Function rightCallBack,
      {bool isHiddenTitle = true}) {
    AwesomeDialog(
        context: context,
        headerAnimationLoop: false,
        dialogType: type,
        animType: AnimType.SCALE,
        title: isHiddenTitle ? '' : title,
        desc: content,
        autoHide: autoHide,
        dismissOnTouchOutside: false,
        btnOkText: textRight,
        isDense: true,
        btnOkOnPress: rightCallBack,
        btnCancelText: textLeft,
        callBackWhenHide: leftCallback,
        btnCancelOnPress: leftCallback)
      ..show();
  }

  void showTwoButtonDialogPermission(
    BuildContext context,
    String title,
    String titlecontent,
    String titlecontent1,
    String titlecontent2,
    String titleallowAccess,
    String titleor,
    String titlegoToSetting,
    String titlefineIcon,
    String titleEnableLibrary,
    String titleBntLeft,
    String titleBntRight,
    double autoHeight,
    Function leftCallback,
    Function rightCallBack, {
    bool barrierDismissible = true,
    bool twoBnt = true,
  }) {
    var permissionTwoButton = Dialogpermission(
      title: title,
      titlecontent: titlecontent,
      titlecontent1: titlecontent1,
      titlecontent2: titlecontent2,
      titleallowAccess: titleallowAccess,
      titleor: titleor,
      titlegoToSetting: titlegoToSetting,
      titlefineIcon: titlefineIcon,
      titleEnableLibrary: titleEnableLibrary,
      titleBntLeft: titleBntLeft,
      titleBntRight: titleBntRight,
      autoHeight: autoHeight,
      onTapLeft: leftCallback,
      onTapRight: rightCallBack,
      onebnt: twoBnt,
    );

    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (BuildContext context) {
        return permissionTwoButton;
      },
    );
  }

  void popupAndSignOut(BuildContext context,
      CancelableOperation cancelableLogout, String message) {
    var timer = Timer(Duration(seconds: 10), () {
      AppRouter.pop(context);
      doLogout(context, cancelableLogout);
    });
    locator<Utilities>().showOneButtonDialog(
      context,
      DialogType.INFO,
      null,
      AppLocalizations.of(context).titleError,
      message,
      AppLocalizations.of(context).btnOk,
      () async {
        timer.cancel();
        doLogout(context, cancelableLogout);
      },
    );
  }

  Future<bool> getDefaultLang(BuildContext context) async {
    var userInfor = await locator<Utilities>().getUserInfor();
    var lang = userInfor?.companyLanguage?.elementAt(0)?.languageCode ??
        Constants.LANG_DEFAULT;
    if (!Constants.LIST_LANG.contains(lang)) {
      lang = Constants.EN_CODE;
    }
    var preferences = await SharedPreferences.getInstance();
    preferences.setString(Constants.KEY_LANGUAGE, lang);
    return await AppLocalizations.of(context).load(Locale(lang));
  }

  Future<int> getMemoryInformation() async {
    try {
      var result = await Constants.HARDWARE_CHANNEL
          .invokeMethod(Constants.MEMORY_METHOD);
      return (result / Constants.B_TO_GB).round();
    } on PlatformException {
      return 0;
    }
  }

  bool isNeedRefresh(SharedPreferences preferences) {
    int lastRefresh = preferences.getInt(Constants.KEY_LAST_REFRESH) ?? 0;
    int now = DateTime.now().millisecondsSinceEpoch;
    int duration = ((now - lastRefresh) / 3600000).round() + 1;
    return duration >= Constants.TIMEOUT_REFRESH;
  }

  Future<void> doLogout(
      BuildContext context, CancelableOperation cancelableOperation) async {
    Utilities().printLog('Class Utilities === Function doLogout',
        isOutputFile: Constants.PRINT_LOG_OUTPUT_FILE);
    var authorization =
        await locator<Utilities>().getAuthorizationNoPreferences();
    var refreshToken = (authorization as Authenticate).refreshToken;
    var prefer = await SharedPreferences.getInstance();
    var firebase = prefer.getString(Constants.KEY_FIREBASE_TOKEN) ?? "";

    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      await handlerLogout();
    }, (Errors message) async {
      await handlerLogout();
    });

    cancelableOperation = CancelableOperation.fromFuture(
      ApiRequest().requestSignOutApi(context, firebase, refreshToken, callBack),
      onCancel: () => {},
    );
    await cancelableOperation.valueOrCancellation();
  }

  Future handlerLogout() async {
    var preferences = await SharedPreferences.getInstance();
    var langSaved =
        preferences.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
    var index = preferences.getInt(Constants.KEY_DEV_MODE) ?? 0;
    var firebase = preferences.getString(Constants.KEY_FIREBASE_TOKEN) ?? "";
    preferences.clear();
    preferences.setString(Constants.KEY_LANGUAGE, langSaved);
    preferences.setString(Constants.KEY_FIREBASE_TOKEN, firebase);
    preferences.setInt(Constants.KEY_DEV_MODE, index);
    preferences.setBool(Constants.KEY_IS_LAUNCH, false);
  }

  Future getTotalUnreadNotification(
      BuildContext context, Function callback) async {
    var deviceInfor = await locator<Utilities>().getDeviceInfo();
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      final totalNotification =
          baseResponse.data['totalUnReadNotification'] as int;
      callback(totalNotification);
    }, (Errors message) {
      //handler show error
      callback(0);
      locator<Utilities>().printLog(
          'getTotalUnreadNotification: ${message.code} - ${message.description}');
    });
    await ApiRequest().requestGetTotalUnreadNotification(
        context, callBack, deviceInfor.identifier);
  }

  void showOneButtonDialog(BuildContext context, DialogType type, int autoHide,
      String title, String content, String textButton, Function callBack,
      {Function callbackDismiss}) {
    AwesomeDialog(
        context: context,
        headerAnimationLoop: false,
        dialogType: type,
        animType: AnimType.SCALE,
        title: title,
        desc: content,
        autoHide: autoHide,
        dismissOnTouchOutside: false,
        btnOkText: textButton,
        btnOkOnPress: callBack,
        callBackWhenHide: callBack,
        onDissmissCallback: callbackDismiss)
      ..show();
  }

  void showNoButtonDialog(BuildContext context, DialogType type, int autoHide,
      String title, String content, Function callBackWhenHide,
      {isHiddenTitle = true}) {
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      dialogType: type,
      animType: AnimType.SCALE,
      title: isHiddenTitle ? '' : title,
      desc: content,
      autoHide: autoHide ?? 5,
      callBackWhenHide: callBackWhenHide,
      dismissOnTouchOutside: true,
    )..show();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }

  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return "${packageInfo.version}(${packageInfo.buildNumber})";
  }

  void hideKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  static Future<bool> requestPermission(
      BuildContext context,
      List<PermissionGroup> permissions,
      PermissionCallBack permissionCallBack,
      bool isJustCheck,
      bool iOSPermission) async {
    var isDenied = false;
    List<PermissionGroup> permissionDeny = List();
    for (final permission in permissions) {
      var status = await PermissionHandler().checkPermissionStatus(permission);
      if (status != PermissionStatus.granted) {
        if (status == PermissionStatus.disabled) {
          permissionCallBack?.onDisable();
          return false;
        } else {
          if (!isJustCheck) {
            await PermissionHandler().requestPermissions([permission]);
            var status =
                await PermissionHandler().checkPermissionStatus(permission);
            if (status != PermissionStatus.granted) {
              permissionDeny.add(permission);
            }
          } else {
            if (!isDenied) {
              isDenied = true;
              var isNoShowAgain = await PermissionHandler()
                  .shouldShowRequestPermissionRationale(permission);
              if (!isNoShowAgain) {
                permissionCallBack?.onDisable();
              } else {
                permissionCallBack?.onDeny();
              }
              return false;
            }
          }
        }
        // permissionCallBack.onAllow();
        // return true;
      }
    }
    if (permissionDeny.isNotEmpty) {
//      var isNoShowAgain = true;
//      for (var element in permissionDeny) {
//        isNoShowAgain = await PermissionHandler()
//            .shouldShowRequestPermissionRationale(element);
//        if (!isNoShowAgain) break;
//      }
//      var mess = (Platform.isAndroid) ? AppLocalizations.of(context).noPermissionAndroid : AppLocalizations.of(context).noPermissionIOS;
//      locator<Utilities>().showTwoButtonDialog(
//          context,
//          DialogType.WARNING,
//          null,
//          AppLocalizations.of(context).noPermissionTitle,
//          mess,
//          AppLocalizations.of(context).btnSkip,
//          AppLocalizations.of(context).btnOpenSetting, () async {
//        permissionCallBack.onAllow();
//      }, () {
//        AppSettings.openAppSettings();
//      });
      var isNoShowAgain = true;
      for (var element in permissionDeny) {
        isNoShowAgain = await PermissionHandler()
            .shouldShowRequestPermissionRationale(element);
        if (!isNoShowAgain) break;
      }
      if (!isNoShowAgain) {
        permissionCallBack?.onDisable();
      } else {
        permissionCallBack?.onDeny();
      }
      return false;
    } else {
      permissionCallBack?.onAllow();
      return true;
    }
  }

  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  static String titleCase(String str) =>
      str
          ?.split(' ')
          ?.map((word) => word[0].toUpperCase() + word.substring(1))
          ?.join(' ') ??
      "";

  Future<DeviceInfo> getDeviceInfo() async {
    var data = DeviceInfo();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var androidInfo = await deviceInfo.androidInfo;
      data.model = androidInfo.model;
      data.deviceName = androidInfo.model;
      data.identifier = androidInfo.androidId;
      data.osVersion = androidInfo.version.release;
    }
    if (Platform.isIOS) {
      var iosInfo = await deviceInfo.iosInfo;
      data.model = iosInfo.utsname.machine;
      data.deviceName = iosInfo.name;
      data.identifier = await _getIDFVKeyChainForiOS(
          'IDFV-IOS', iosInfo.identifierForVendor);
      data.osVersion = iosInfo.systemVersion;
    }
    return data;
  }

  Future<DeviceEmployee> getInfoDeviceForEmployee() async {
    var deviceInfo = DeviceInfoPlugin();
    var data = DeviceEmployee();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      data.deviceId = await _getIDFVKeyChainForiOS(
          'IDFV-IOS', iosDeviceInfo.identifierForVendor); // unique ID on iOS
      data.os = "IOS";
      data.deviceName = iosDeviceInfo.name;
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      data.deviceId = androidDeviceInfo.androidId; // unique ID on Android
      data.os = "ANDROID";
      data.deviceName = androidDeviceInfo.model;
    }
    return data;
  }

  Future<String> _getIDFVKeyChainForiOS(String key, String deviceId) async {
    // Create storage
    final storage = new FlutterSecureStorage();
    // Read value
    String value = await storage.read(key: key);
    if (value == null || value.isEmpty) {
      // Write value
      await storage.write(key: key, value: deviceId);
      return deviceId;
    } else {
      return value;
    }
  }

  Timer timeoutToResetApp;

  void countDownToResetApp(int timeBackground, BuildContext context,
      SharedPreferences preferences) async {
    timeoutToResetApp?.cancel();
    var timeReset = Constants.TIMEOUT_RESET - timeBackground;
    timeoutToResetApp = Timer(Duration(hours: timeReset), () {
      refreshToken(context, preferences);
    });
  }

  Future refreshToken(
      BuildContext context, SharedPreferences preferences) async {
    var firebaseId = preferences.getString(Constants.KEY_FIREBASE_TOKEN) ?? "";
    ApiCallBack listCallBack = ApiCallBack((BaseResponse baseResponse) async {
      var authenticationString = JsonEncoder().convert(baseResponse.data);
      preferences.setString(Constants.KEY_AUTHENTICATE, authenticationString);
      preferences.setInt(
          Constants.KEY_LAST_REFRESH, DateTime.now().millisecondsSinceEpoch);
    }, (Errors message) {
      if (message.code != -2) {
        CancelableOperation cancelableLogout;
        locator<Utilities>().popupAndSignOut(context, cancelableLogout,
            AppLocalizations.of(context).expiredToken);
      }
    });
    var authorization = locator<Utilities>().getAuthorization(preferences);
    var token = (authorization as Authenticate).refreshToken;
    await ApiRequest()
        .requestRefreshTokenApi(context, firebaseId, token, listCallBack);
    locator<Utilities>().printLog("requestRefreshTokenApi");
    countDownToResetApp(0, context, preferences);
  }

  // Save and get local file path ⬇
  /// AUTHOR: HAO-LQ 20210401
  ///
  /// TODO: Download file from url and convert to bytes
  Future<List<int>> downloadFileImageByUrl(String url) async {
    if (url == null || url.isEmpty) {
      return null;
    }
    final ByteData imageData =
        await NetworkAssetBundle(Uri.parse(url)).load("");

    final Uint8List bytes = imageData.buffer.asUint8List();
    return bytes;
  }

  Color convertStringToColor(String source) {
    try {
      var colorValue = Constants.PREFIX_COLOR +
          source.replaceAll(RegExp("[^0-9a-zA-Z]+"), "").replaceAll('"', "");
      return Color(int.parse(colorValue));
    } catch (_) {
      return AppColors.DARK_BLUE_TEXT;
    }
  }

  String convertColorToString(Color source) {
    try {
      var listString = source
          .toString()
          .toLowerCase()
          .split(Constants.PREFIX_COLOR.toLowerCase());
      return listString[1].replaceAll(")", "");
    } catch (_) {
      return "0080f3";
    }
  }

  Future<String> localPath(String folderName) async {
    Directory root;
    if (Platform.isAndroid) {
      root = await getApplicationSupportDirectory();
    } else {
      root = await getApplicationDocumentsDirectory();
    }
    if (folderName == null || folderName.isEmpty) {
      return root.path;
    }
    Directory directory = Directory("${root.path}/$folderName");
    if (!(await directory.exists())) {
      await directory.create(recursive: true);
    }
    return directory.path;
  }

  Future<String> localPathDB(String folderName) async {
    Directory root;
    root = await getApplicationDocumentsDirectory();
    if (folderName == null || folderName.isEmpty) {
      return root.path;
    }
    Directory directory = Directory("${root.path}/$folderName");
    if (!(await directory.exists())) {
      await directory.create();
    }
    return directory.path;
  }

  Future<File> getLocalFile(
      String folderName, String name, String extension) async {
    try {
      final path = await localPath(folderName);
      File file = (extension == null)
          ? File('$path/$name')
          : File('$path/$name.$extension');
      if (file.existsSync()) {
        return file;
      } else {
        return null;
      }
    } catch (e) {
      locator<Utilities>().printLog(e);
      return null;
    }
  }

  Future<String> getLocalPathFile(
      String folderName, String type, String name, String extension) async {
    final path = await localPath(folderName);
    if (type != null) {
      name = type + "/" + name;
    }
    return (extension == null) ? '$path/$name' : '$path/$name.$extension';
  }

  Future<List<int>> rotateAndResize(String path) async {
    var file = File(path);
    List<int> imageBytes = file.readAsBytesSync();
    if (imageBytes.length > Constants.LIMIT_IMAGE_SIZE) {
      int percent =
          ((Constants.LIMIT_IMAGE_SIZE / imageBytes.length) * 100).toInt();
      imageBytes = await FlutterImageCompress.compressWithList(imageBytes,
          quality: percent, keepExif: true);
      await locator<Utilities>().saveLocalFileWithPath(path, imageBytes);
    }
    var image = await FlutterExifRotation.rotateImage(path: path);
    List<int> newBytes = image.readAsBytesSync();
    return newBytes;
  }

  Future<void> writeToFile(ByteData data, String path) async {
    final buffer = data.buffer;
    return File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  Future<File> saveLocalFile(
      String folderName, String name, String extension, List<int> file) async {
    try {
      final path = await localPath(folderName);
      var pathFile =
          (extension == null) ? ('$path/$name') : ('$path/$name.$extension');
      var fileSave = new File(pathFile.replaceAll(" ", "_"));
      printLog(
          'Class Utilities === Function saveLocalFile === path file local: $path/$name');
      // Write the file
      return await fileSave.writeAsBytes(file);
    } catch (e) {
      locator<Utilities>().printLog(e.toString());
      return null;
    }
  }

  Future<File> saveLocalFileWithPath(String path, List<int> file) async {
    try {
      var fileSave = new File(path);
      // Write the file
      return await fileSave.writeAsBytes(file);
    } catch (e) {
      locator<Utilities>().printLog(e);
      return null;
    }
  }
  // Save and get local file path ⬆

  List<String> getTimeFormat(BuildContext context, String lang) {
    bool is24HoursFormat = MediaQuery.of(context).alwaysUse24HourFormat;
    var date = DateTime.now();
    if (!is24HoursFormat) {
      return DateFormat(Constants.TIME_FORMAT_12_EN, lang)
          .format(date)
          .split(" ");
    }
    return DateFormat(Constants.TIME_FORMAT_24).format(date).split(" ");
  }

  String getFormat(BuildContext context, String date) {
    if (date == null || date == "") return "";
    var dateFormate = DateFormat("dd/MM/yyyy").format(DateTime.parse(date));
    return dateFormate.toString();
  }

  Future<void> deleteFile(File fileSave) async {
    if (fileSave != null && fileSave.existsSync()) {
      await fileSave?.delete(recursive: true);
      fileSave.existsSync();
    }
  }

  String getStringByLang(String source, String langSaved) {
    if (source == null || source.isEmpty) {
      return "";
    }
    String langBackUp;
    if (langSaved == Constants.VN_CODE) {
      langBackUp = Constants.EN_CODE;
    } else {
      langBackUp = Constants.VN_CODE;
    }
    try {
      var mapLang = json.decode(source);
      return (mapLang[langSaved] == null || mapLang[langSaved].isEmpty)
          ? mapLang[langBackUp]
          : mapLang[langSaved];
    } catch (e) {
      return "";
    }
  }

  Future<List<InvitationGroup>> createGroupInviteWithInvite(
      BuildContext context,
      String langSaved,
      List<InvitationGroup> invitationGroupList,
      List<InviteNewVisitor> inviteNewVisitor) async {
    var startDate = "";
    if (invitationGroupList != null && invitationGroupList.isNotEmpty) {
      startDate = invitationGroupList.last.startDate;
    }
    for (var i = 0; i < inviteNewVisitor.length; i++) {
      inviteNewVisitor[i].valueReminder =
          (await Provider.of<Database>(context, listen: false)
                  .reminderInvitationDAO
                  .getById(inviteNewVisitor[i].id))
              ?.reminderValue;
      if (startDate !=
          inviteNewVisitor[i].getStartJustDate(context, langSaved)) {
        startDate = inviteNewVisitor[i].getStartJustDate(context, langSaved);
        InvitationGroup invitationGroup = InvitationGroup.init();
        invitationGroup.startDate = startDate;
        invitationGroup.inviteNewVisitor = List();
        invitationGroup.inviteNewVisitor.add(inviteNewVisitor[i]);
        invitationGroupList.add(invitationGroup);
      } else if (invitationGroupList.isNotEmpty) {
        invitationGroupList.last.inviteNewVisitor.add(inviteNewVisitor[i]);
      }
    }
    return invitationGroupList;
  }

  List<InvitationGroup> insertNewInviteInGroupInvite(
      BuildContext context,
      String langSaved,
      List<InvitationGroup> invitationGroupList,
      InviteNewVisitor inviteNewVisitor) {
    var startDate = inviteNewVisitor.getStartJustDate(context, langSaved);
    var isContain = false;
    if (invitationGroupList?.isNotEmpty == true) {
      for (InvitationGroup invitationGroup in invitationGroupList) {
        if (invitationGroup.startDate == startDate) {
          isContain = true;
          invitationGroup.inviteNewVisitor.add(inviteNewVisitor);
          invitationGroup.inviteNewVisitor
              .sort((a, b) => a.startDate.compareTo(b.startDate));
          break;
        }
      }
    }
    if (!isContain) {
      InvitationGroup invitationGroup = InvitationGroup.init();
      invitationGroup.startDate = startDate;
      invitationGroup.inviteNewVisitor = List();
      invitationGroup.inviteNewVisitor.add(inviteNewVisitor);
      invitationGroupList.add(invitationGroup);
      invitationGroupList.sort((a, b) => a.startDate.compareTo(b.startDate));
    }
    return invitationGroupList;
  }

  List<InvitationGroup> updateInviteInGroupInvite(
      BuildContext context,
      String langSaved,
      List<InvitationGroup> invitationGroupList,
      InviteNewVisitor inviteNewVisitor) {
    InviteNewVisitor oldChild;
    if (invitationGroupList?.isNotEmpty == true) {
      for (InvitationGroup invitationGroup in invitationGroupList) {
        for (InviteNewVisitor child in invitationGroup.inviteNewVisitor) {
          if (child.id == inviteNewVisitor.id) {
            oldChild = child;
            break;
          }
        }
        if (oldChild != null) {
          invitationGroup.inviteNewVisitor.remove(oldChild);
          break;
        }
      }
    }
    insertNewInviteInGroupInvite(
        context, langSaved, invitationGroupList, inviteNewVisitor);
    return invitationGroupList;
  }

  List<LogGroup> createGroupLogWithLog(
      BuildContext context,
      String langSaved,
      List<LogGroup> logGroupList,
      List<VisitorLog> visitorLog,
      bool signOutLog) {
    var signIn = "";
    var signOut = "";
    if (logGroupList != null && logGroupList.isNotEmpty) {
      signIn = logGroupList.last.signIn;
      signOut = logGroupList.last.signOut;
    }
    for (var i = 0; i < visitorLog.length; i++) {
      if ((!signOutLog &&
              signIn != visitorLog[i].getInJustDate(context, langSaved)) ||
          (signOutLog &&
              signOut != visitorLog[i].getOutJustDate(context, langSaved))) {
        signIn = visitorLog[i].getInJustDate(context, langSaved);
        signOut = visitorLog[i].getOutJustDate(context, langSaved);
        LogGroup invitationGroup = LogGroup.init();
        invitationGroup.signIn = signIn;
        invitationGroup.signOut = signOut;
        invitationGroup.logVisitor = List();
        invitationGroup.logVisitor.add(visitorLog[i]);
        logGroupList.add(invitationGroup);
      } else if (logGroupList.isNotEmpty) {
        logGroupList.last.logVisitor.add(visitorLog[i]);
      }
    }
    return logGroupList;
  }

  String formatHourToTime(
      AppLocalizations appLocalizations, double totalWorkingTime) {
    double decimal = totalWorkingTime - totalWorkingTime.toInt();
    int hour = totalWorkingTime.toInt();
    int minutes = (60 * decimal).toInt();
    if (hour == 0 && minutes == 0) {
      int seconds = (3600 * decimal).toInt();
      if (seconds == 0) {
        return "";
      }
      return "$seconds ${appLocalizations.secondsTitle}";
    }
    String hourString =
        (hour == 0) ? "" : "$hour ${appLocalizations.hoursTitle}";
    String minutesString =
        (minutes == 0) ? "" : " $minutes ${appLocalizations.minutesTitle}";
    return hourString + minutesString;
  }

  AttendanceGroupResult createGroupAttendanceWithLog(BuildContext context,
      String langSaved, List<AttendanceDetail> attendanceList) {
    AttendanceGroupResult attendanceGroupResult = AttendanceGroupResult();
    List<AttendanceGroup> logGroupList = List();
    int totalNotEnough = 0;
    int totalNotCheckout = 0;
    double totalWorkingTime = 0;
    int totalLate = 0;
    var now = DateTime.parse(DateFormat("yyyy-MM-dd").format(DateTime.now()));
    for (var i = 0; i < attendanceList.length; i++) {
      if (attendanceList[i].isEnoughWorkingTime != true) {
        totalNotEnough++;
      }
      if (attendanceList[i]?.attendanceList?.isNotEmpty == true &&
          attendanceList[i].attendanceList[0].timeOut == null &&
          attendanceList[i].attendanceList[0].timeIn != null) {
        DateTime tempDate = DateFormat("yyyy-MM-dd")
            .parse(attendanceList[i].attendanceList[0].timeIn);
        if (tempDate.compareTo(now) != 0) {
          totalNotCheckout++;
        }
      }
      if (attendanceList[i].totalWorkingTime != null) {
        totalWorkingTime += attendanceList[i].totalWorkingTime;
      }
      if (attendanceList[i].isLate == true) {
        totalLate++;
      }
      DateTime tempDate =
          DateFormat("yyyy-MM-dd").parse(attendanceList[i].dayOfMonth);
      if (tempDate.weekday == DateTime.sunday || logGroupList.isEmpty) {
        if (logGroupList.isNotEmpty) {
          logGroupList.last.listDetail
              .sort((a, b) => b.dayOfMonth.compareTo(a.dayOfMonth));
          String lastDateLast = logGroupList.last.listDetail.last
              .getDayOfMonthDate(context, langSaved);
          String lastDateFirst = logGroupList.last.listDetail.first
              .getDayOfMonthDate(context, langSaved);
          logGroupList.last.weekRange = "$lastDateLast - $lastDateFirst";
        }
        AttendanceGroup logGroup = AttendanceGroup.init();
        logGroup.listDetail = List();
        logGroup.listDetail.add(attendanceList[i]);
        logGroupList.add(logGroup);
      } else if (logGroupList.isNotEmpty) {
        logGroupList.last.listDetail.add(attendanceList[i]);
      }
    }
    if (logGroupList.isNotEmpty) {
      DateTime tempDate = DateFormat("yyyy-MM-dd")
          .parse(logGroupList.first.listDetail.last.dayOfMonth);
      if (tempDate.month == now.month) {
        logGroupList.first.weekRange = AppLocalizations.of(context).thisWeek;
      }
      logGroupList.last.listDetail
          .sort((a, b) => b.dayOfMonth.compareTo(a.dayOfMonth));
      String lastDateLast = logGroupList.last.listDetail.last
          .getDayOfMonthDate(context, langSaved);
      String lastDateFirst = logGroupList.last.listDetail.first
          .getDayOfMonthDate(context, langSaved);
      logGroupList.last.weekRange = "$lastDateLast - $lastDateFirst";
    }
    attendanceGroupResult.logGroupList = logGroupList;
    attendanceGroupResult.totalNotEnough = totalNotEnough;
    attendanceGroupResult.totalNotCheckout = totalNotCheckout;
    attendanceGroupResult.totalWorkingTime = totalWorkingTime;
    attendanceGroupResult.totalLate = totalLate;
    return attendanceGroupResult;
  }

  String roundStringDouble(double myDouble) {
    return myDouble
        .toStringAsFixed(2)
        .replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
  }

  List<T> combineTwoList<T>(List<T> lst1, List<T> lst2) {
    return [...lst1, ...lst2];
  }

//  DateTime convertStringToDate(String str) {
//    DateTime date = DateTime.parse(str);
//    return DateFormat(Constants.FORMAT_STRING_DATE).format(date);
//  }

  String convertDateToString(DateTime source, String format) {
    return DateFormat(format).format(source);
  }

  String formatDate(String str, String format) {
    DateTime date = DateTime.parse(str);
    return DateFormat(format).format(date);
  }

  DateTime createWithDateTime(DateTime date, DateTime time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute, time.second, time.millisecond);
  }

  Future<String> getWelcomeMessage(String fullName, double branchId,
      String type, SharedPreferences preferences, BuildContext context) async {
    var db = Provider.of<Database>(context, listen: false);
    List<WelcomeMessage> list =
        await db.welcomeMessageDAO.getMessageByBranchType(branchId, type);
    if (list.isEmpty) {
      var appLocalizations = AppLocalizations.of(context);
      if (type == WelcomeMessage.TYPE_IN) {
        return "${appLocalizations.welcomeCheckinTitle}\n$fullName\n\n${appLocalizations.checkinEmployeeContent}";
      } else {
        return "${appLocalizations.thankyouCheckoutTitle}\n$fullName\n\n${appLocalizations.checkoutEmployeeContent}";
      }
    }
    int randomIndex = Random().nextInt(list.length);
    var langSaved =
        preferences.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
    var stringLang =
        getStringByLang(list[randomIndex].messageContent, langSaved);
    return stringLang.replaceAll("{{name}}", fullName);
  }

  Future<List<PrinterModel>> findAllPrinter() async {
    List<PrinterModel> list = List();
    var listQL = await QLPrinterModel.init().findPrinter();
    if (Platform.isAndroid) {
      var xPrinter = XPrinterModel.init();
      xPrinter.setListAlready(listQL);
      var listXPrinter = await xPrinter.findPrinter();
      list.addAll(listXPrinter);
    }
    list.addAll(listQL);
    await Future.forEach(list, (element) async {
      if (await element.checkPrinterConnect()) {
        if (element.type == PrinterType.X_PRINTER) {
          await element.connectPrinter();
        }
        element.isConnect = true;
        return;
      }
    });
    return list;
  }

  Future<PrinterModel> getPrinter() async {
    PrinterModel printerModel;
    var preferences = await SharedPreferences.getInstance();
    var saveData = preferences.getString(Constants.KEY_PRINTER);
    if (saveData != null && saveData.isNotEmpty) {
      var map = jsonDecode(saveData);
      switch (map["type"]) {
        case PrinterType.BROTHER:
          {
            printerModel = QLPrinterModel.fromJson(map);
            break;
          }
        case PrinterType.X_PRINTER:
          {
            printerModel = XPrinterModel.fromJson(map);
            break;
          }
      }
    }
    return printerModel;
  }

  Future printJob(PrinterModel printer, RenderRepaintBoundary boundary) async {
    var status;
    while (status != Constants.STATUS_SUCCESS) {
      status = await printer.printTemplate(boundary);
    }
  }

  String noPassError = "";
  String wrongError = "";
  String passwordSaved = "";

  String validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return noPassError;
    }
    if (value != passwordSaved) {
      return wrongError;
    }
    return null;
  }

  void showConfirmPassWord(
      BuildContext context,
      String title,
      String content,
      String hint,
      String textButton,
      GlobalKey<FormState> passwordKey,
      TextEditingController controller,
      RoundedLoadingButtonController btnController,
      Function callBack) async {
    noPassError = AppLocalizations.of(context).noPassword;
    wrongError = AppLocalizations.of(context).wrongPassword;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Random random = new Random();
    int randomNumber = random.nextInt(Constants.MAX_INT);
    passwordSaved =
        prefs.get(Constants.KEY_PASSWORD) ?? randomNumber.toString();
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    SizeConfig().init(context);
    int sizeRenderWidth = isPortrait ? 40 : 30;
    int sizeRenderHeight = isPortrait ? 17 : 22;

    var alert = MyDialog(
      title: title,
      sizeRenderWidth: sizeRenderWidth,
      sizeRenderHeight: sizeRenderHeight,
      controller: controller,
      callBack: callBack,
      hint: hint,
      passwordKey: passwordKey,
      textButton: textButton,
      btnController: btnController,
    );

    // show the dialog
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void playSound({String filePath = "sounds/ding.mp3"}) async {
    _audioCache.play(filePath);
    if (await Vibration.hasVibrator()) {
      if (await Vibration.hasAmplitudeControl()) {
        Vibration.vibrate(amplitude: 128);
        return;
      }
      Vibration.vibrate();
    }
  }

  Future<String> convertDateToStringLongDate(
      String dateString, BuildContext context,
      {bool isWithoutTime = false}) async {
    final appLocalizations = AppLocalizations.of(context);
    if (dateString == null || dateString.isEmpty) {
      return appLocalizations.noData;
    }
    DateTime date = DateTime.parse(dateString);
    String weekOfDay = '';
    String month = '';
    switch (date.weekday) {
      case 1:
        weekOfDay = appLocalizations.mondayTitle;
        break;
      case 2:
        weekOfDay = appLocalizations.tuesdayTitle;
        break;
      case 3:
        weekOfDay = appLocalizations.webnesdayTitle;
        break;
      case 4:
        weekOfDay = appLocalizations.thursdayTitle;
        break;
      case 5:
        weekOfDay = appLocalizations.fridayTitle;
        break;
      case 6:
        weekOfDay = appLocalizations.saturdayTitle;
        break;
      case 7:
        weekOfDay = appLocalizations.sundayTitle;
        break;
      default:
        break;
    }
    switch (date.month) {
      case 1:
        month = appLocalizations.januaryTitle;
        break;
      case 2:
        month = appLocalizations.februaryTitle;
        break;
      case 3:
        month = appLocalizations.marchTitle;
        break;
      case 4:
        month = appLocalizations.aprilTitle;
        break;
      case 5:
        month = appLocalizations.mayTitle;
        break;
      case 6:
        month = appLocalizations.juneTitle;
        break;
      case 7:
        month = appLocalizations.julyTitle;
        break;
      case 8:
        month = appLocalizations.augustTitle;
        break;
      case 9:
        month = appLocalizations.septemberTitle;
        break;
      case 10:
        month = appLocalizations.octoberTitle;
        break;
      case 11:
        month = appLocalizations.novemberTitle;
        break;
      case 12:
        month = appLocalizations.decemberTitle;
        break;
      default:
        break;
    }
    String dateHour = isWithoutTime ? '' : DateFormat('HH:mm').format(date);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var langSaved =
        prefs.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
    if (langSaved == Constants.EN_CODE) {
      return '$weekOfDay, $month ${date.day}, ${date.year} $dateHour';
    } else {
      return '$weekOfDay, ${date.day} $month, ${date.year} $dateHour';
    }
  }

  String convertDateToStringDate(
      String dateString, BuildContext context, SharedPreferences preferences,
      {bool isWithoutTime = false, bool isToday = true}) {
    final appLocalizations = AppLocalizations.of(context);
    if (dateString == null || dateString.isEmpty) {
      return appLocalizations.noData;
    }
    DateTime date = DateTime.parse(dateString);
    DateTime now = DateTime.now();
    if (isToday &&
        date.day == now.day &&
        date.month == now.month &&
        date.year == now.year) {
      return appLocalizations.todayTitle + " ";
    }
    String weekOfDay = '';
    String month = '';
    switch (date.weekday) {
      case 1:
        weekOfDay = appLocalizations.mondayTitle;
        break;
      case 2:
        weekOfDay = appLocalizations.tuesdayTitle;
        break;
      case 3:
        weekOfDay = appLocalizations.webnesdayTitle;
        break;
      case 4:
        weekOfDay = appLocalizations.thursdayTitle;
        break;
      case 5:
        weekOfDay = appLocalizations.fridayTitle;
        break;
      case 6:
        weekOfDay = appLocalizations.saturdayTitle;
        break;
      case 7:
        weekOfDay = appLocalizations.sundayTitle;
        break;
      default:
        break;
    }
    switch (date.month) {
      case 1:
        month = appLocalizations.januaryTitle;
        break;
      case 2:
        month = appLocalizations.februaryTitle;
        break;
      case 3:
        month = appLocalizations.marchTitle;
        break;
      case 4:
        month = appLocalizations.aprilTitle;
        break;
      case 5:
        month = appLocalizations.mayTitle;
        break;
      case 6:
        month = appLocalizations.juneTitle;
        break;
      case 7:
        month = appLocalizations.julyTitle;
        break;
      case 8:
        month = appLocalizations.augustTitle;
        break;
      case 9:
        month = appLocalizations.septemberTitle;
        break;
      case 10:
        month = appLocalizations.octoberTitle;
        break;
      case 11:
        month = appLocalizations.novemberTitle;
        break;
      case 12:
        month = appLocalizations.decemberTitle;
        break;
      default:
        break;
    }
    String dateHour = isWithoutTime ? '' : DateFormat('HH:mm').format(date);
    var langSaved =
        preferences.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
    if (langSaved == Constants.EN_CODE) {
      return '$weekOfDay, $month ${date.day}, ${date.year} $dateHour';
    } else {
      return '$weekOfDay, ${date.day} $month, ${date.year} $dateHour';
    }
  }

  String translateMonth(DateTime datetime, BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    String month = '';
    switch (datetime.month) {
      case 1:
        month = appLocalizations.januaryTitle;
        break;
      case 2:
        month = appLocalizations.februaryTitle;
        break;
      case 3:
        month = appLocalizations.marchTitle;
        break;
      case 4:
        month = appLocalizations.aprilTitle;
        break;
      case 5:
        month = appLocalizations.mayTitle;
        break;
      case 6:
        month = appLocalizations.juneTitle;
        break;
      case 7:
        month = appLocalizations.julyTitle;
        break;
      case 8:
        month = appLocalizations.augustTitle;
        break;
      case 9:
        month = appLocalizations.septemberTitle;
        break;
      case 10:
        month = appLocalizations.octoberTitle;
        break;
      case 11:
        month = appLocalizations.novemberTitle;
        break;
      case 12:
        month = appLocalizations.decemberTitle;
        break;
      default:
        break;
    }
    return '$month';
  }

  Future<SurveyForm> getSurvey() async {
    var preferences = await SharedPreferences.getInstance();
    var surveyString = preferences.getString(Constants.KEY_SURVEY) ?? "";
    if (surveyString.isEmpty) {
      return null;
    }
    var mapSurvey = json.decode(surveyString);
    final survey = SurveyForm.fromJson(mapSurvey);
    return survey;
  }

  String validateJson(String source) {
    try {
      var mapLang = json.decode(source);
      if ((mapLang[Constants.VN_CODE] == null ||
          mapLang[Constants.VN_CODE].isEmpty)) {
        mapLang[Constants.VN_CODE] = mapLang[Constants.EN_CODE] ?? "";
      }
      if ((mapLang[Constants.EN_CODE] == null ||
          mapLang[Constants.EN_CODE].isEmpty)) {
        mapLang[Constants.EN_CODE] = mapLang[Constants.VN_CODE] ?? "";
      }
      return json.encode(mapLang);
    } catch (e) {
      return source;
    }
  }
}

class AutoCapWordsInputFormatter extends TextInputFormatter {
  final RegExp capWordsPattern = new RegExp(r'(\S)(\S*\s*)');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = capWordsPattern
        .allMatches(newValue.text)
        .map((match) => match.group(1).toUpperCase() + match.group(2))
        .join();
    return new TextEditingValue(
      text: newText,
      selection:
          newValue.selection ?? const TextSelection.collapsed(offset: -1),
      composing:
          newText == newValue.text ? newValue.composing : TextRange.empty,
    );
  }
}

class UpperCaseFirstLetterFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: toBeginningOfSentenceCase(newValue.text),
      selection: newValue.selection,
    );
  }
}

class MyDialog extends StatefulWidget {
  final String title;
  final int sizeRenderWidth;
  final int sizeRenderHeight;
  final GlobalKey<FormState> passwordKey;
  final TextEditingController controller;
  final Function callBack;
  final String hint;
  final String textButton;
  final RoundedLoadingButtonController btnController;

  const MyDialog(
      {Key key,
      this.title,
      this.sizeRenderWidth,
      this.sizeRenderHeight,
      this.callBack,
      this.hint,
      this.textButton,
      this.passwordKey,
      this.controller,
      this.btnController})
      : super(key: key);

  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  bool isShowPass = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 24,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      title: Align(
        alignment: Alignment.topCenter,
        child: Text(
          widget.title,
          style: TextStyle(
              fontSize: AppDestination.TEXT_BIG,
              decoration: TextDecoration.none),
        ),
      ),
      content: SingleChildScrollView(child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            width: SizeConfig.blockSizeHorizontal * widget.sizeRenderWidth,
            height: SizeConfig.safeBlockVertical * widget.sizeRenderHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Form(
                  key: widget.passwordKey,
                  child: Container(
                    height: SizeConfig.safeBlockVertical *
                        (widget.sizeRenderHeight / 2),
                    child: TextFormField(
                        validator: Utilities().validateConfirmPassword,
                        obscureText: !isShowPass,
                        controller: widget.controller,
                        onEditingComplete: widget.callBack,
                        textInputAction: TextInputAction.next,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(100),
                        ],
                        decoration: new InputDecoration(
                          hintText: widget.hint,
                          labelText: widget.hint,
                          errorStyle: TextStyle(fontSize: 16),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isShowPass
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                isShowPass = !isShowPass;
                              });
                            },
                          ),
                          hintStyle: TextStyle(
                              fontSize: 15, color: AppColors.HINT_TEXT_COLOR),
                          labelStyle: TextStyle(
                              fontSize: 15, color: context.formBorderColor),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: const BorderSide(
                                color: AppColors.RED_COLOR,
                              )),
                          border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(5.0),
                              ),
                              borderSide: new BorderSide(
                                  color: context.formBorderColor)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                                BorderSide(color: context.formBorderColor),
                          ),
                        ),
                        onChanged: null,
                        style:
                            TextStyle(fontSize: 15, color: context.textColor)),
                  ),
                ),
                RaisedGradientButton(
                    disable: false,
                    isLoading: true,
                    btnController: widget.btnController,
                    btnText: widget.textButton,
                    onPressed: widget.callBack,
                    height: SizeConfig.safeBlockVertical *
                        (widget.sizeRenderHeight / 3.5)),
              ],
            ),
          );
        },
      )),
    );
  }
}

class Dialogpermission extends StatefulWidget {
  final String title;
  final String titlecontent;
  final String titlecontent1;
  final String titlecontent2;
  final String titleallowAccess;
  final String titleor;
  final String titlegoToSetting;
  final String titlefineIcon;
  final String titleEnableLibrary;
  final String titleBntLeft;
  final String titleBntRight;
  final double autoHeight;
  final Function onTapLeft;
  final Function onTapRight;
  final bool onebnt;

  Dialogpermission({
    this.title,
    this.titlecontent,
    this.titlecontent1,
    this.titlecontent2,
    this.titleallowAccess,
    this.titleor,
    this.titlegoToSetting,
    this.titlefineIcon,
    this.titleEnableLibrary,
    this.titleBntLeft,
    this.titleBntRight,
    this.autoHeight,
    this.onTapLeft,
    this.onTapRight,
    this.onebnt: true,
  });

  @override
  _DialogpermissionState createState() => _DialogpermissionState();
}

class _DialogpermissionState extends State<Dialogpermission> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      title: Text(
        widget.title,
        textAlign: TextAlign.start,
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      content: Container(
        height: widget.autoHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.titlecontent != null)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  widget.titlecontent,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            if (widget.titlecontent1 != null)
              Text(
                widget.titlecontent1,
                style: Theme.of(context).textTheme.headline5,
              ),
            if (widget.titlecontent2 != null)
              Text(
                widget.titlecontent2,
                style: Theme.of(context).textTheme.headline5,
              ),
            if (widget.titleallowAccess != null)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  widget.titleallowAccess,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            if (widget.titleor != null)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  widget.titleor,
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.start,
                ),
              ),
            if (widget.titlegoToSetting != null)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        widget.titlegoToSetting,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
            if (widget.titlefineIcon != null)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    AppImage.checkinPro,
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        widget.titlefineIcon,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
            if (widget.titleEnableLibrary != null)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Icon(Icons.art_track_outlined),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        widget.titleEnableLibrary,
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.onebnt == true)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
//                      width: 135,
                      child: RaisedButton(
                        onPressed: widget.onTapLeft,
                        color: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Text(
                          widget.titleBntLeft,
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: AppColors.DARK_BLUE_TEXT),
                        ),
                      ),
                    ),
                  ),
                if (widget.onebnt == true)
                  SizedBox(
                    width: 10,
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
//                    width: 135,
                    child: RaisedButton(
                      onPressed: widget.onTapRight,
                      color: AppColors.DARK_BLUE_TEXT,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        widget.titleBntRight,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
