import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:async/async.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/Authenticate.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/screens/homeScreen/ChangePassWord/ChangePassWordScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/SettingNotification/NotificationSettingScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/dashBoard/DashBoardNotifier.dart';
import 'package:checkinpromobile/src/screens/jobInfo/JobInfoScreen.dart';
import 'package:checkinpromobile/src/screens/login/LoginScreen.dart';
import 'package:checkinpromobile/src/screens/personalInfor/InforPersonScreen.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/ConnectionStatusSingleton.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:ntp/ntp.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_settings/app_settings.dart';
import 'package:checkinpromobile/src/screens/homeScreen/SettingChangeUI/ChangeUiSettingsScreen.dart';
import 'package:checkinpromobile/src/screens/homeScreen/SettingChangeThemes/ChangeThemesSettingsScreen.dart';
import '../../AppBarNotifier.dart';
import 'package:checkinpromobile/src/utilities/PermissionCallBack.dart';
import 'package:permission_handler/permission_handler.dart';

enum SettingType { INFORMATION, JOB_INFORMATION, CHANGE_PASSWORD, LOGOUT }
enum SwitchType { NOTIFICATION, SETTINGS, BIO_DETECT, THEMES }

class ItemSetting {
  String title;
  SettingType settingType;
  IconData icon;
  String subTitle;

  ItemSetting({this.title, this.settingType, this.icon, this.subTitle});
}

class ItemAboutApp {
  String title;
  String info;

  ItemAboutApp({this.title, this.info});
}

class SettingNotifier extends AppBarNotifier {
  //EmployeeInfo employee;
  Authenticate authenProfile;
  File image;
  String valueImage;
  final picker = ImagePicker();
  double top = 300.0;
  List<int> bytes;
  List<ItemAboutApp> itemAbouts = List();
  int countJoinDate = 0;
  Color colorJoinDate = AppColors.DARK_BLUE_TEXT;
  bool reloadLang = false;
  bool mounted = true;
  bool isConnection = true;
  bool isLoading = false;
  List<BiometricType> listOfBiometrics;
  Uint8List savedAvatar;


  List<ItemSwitch> itemSwitchs = List();

  AsyncMemoizer<bool> memCache = AsyncMemoizer();
  AsyncMemoizer<Uint8List> memCacheAvatar = AsyncMemoizer();

  List<ItemSetting> itemAccounts = <ItemSetting>[
    ItemSetting(
        title: "personal_information_title",
        settingType: SettingType.INFORMATION,
        icon: Icons.person,
        subTitle: "Xem / Chỉnh sửa thông tin"),
    ItemSetting(
        title: "job_information_title",
        settingType: SettingType.JOB_INFORMATION,
        icon: Icons.my_library_books_rounded,
        subTitle: "Xem thông tin"),
    ItemSetting(
        title: "change_password_title",
        settingType: SettingType.CHANGE_PASSWORD,
        icon: Icons.lock,
        subTitle: "Xem / Thay đổi mật khẩu"),
    // ItemSetting(
    //     title: "button_logout_text",
    //     settingType: SettingType.LOGOUT,
    //     icon: Icons.logout,
    //     subTitle: ""),
  ];

  Future<Uint8List> getAvatar() {
    return memCacheAvatar.runOnce(() async {
      savedAvatar = await Utilities().getSavedNetworkImage(valueImage, Constants.FOLDER_FACE_OFFLINE, db);
      return savedAvatar;
    });
  }

  Future<void> itemClick(BuildContext context, ItemSetting item) async {
    switch (item.settingType) {
      case SettingType.INFORMATION:
        {
          AppRouter.pushTo(context, InforPersonScreen.route_name).then((value) {
            if (value != null &&
                (value as Map<String, dynamic>)["reloadLang"] == true) {
              getSaveItems();
              reloadLang = !reloadLang;
              notifyListeners();
            }
          });
          break;
        }
      case SettingType.JOB_INFORMATION:
        {
          AppRouter.pushTo(context, JobInfoScreen.route_name);
          break;
        }
      case SettingType.CHANGE_PASSWORD:
        {
          AppRouter.pushTo(context, ChangePasswordScreen.route_name);
          break;
        }
      case SettingType.LOGOUT:
        {
          doSignout(context);
          break;
        }
      default:
        {}
    }
  }

  @override
  String getTitle(BuildContext context) {
    return "";
  }

  @override
  String getSubTitle(BuildContext context) {
    // TODO: implement getSubTitle
    throw UnimplementedError();
  }

  @override
  void onClickLeft(BuildContext context) {
    // TODO: implement onClickLeft
  }

  @override
  void onClickRight(BuildContext context) {
    // TODO: implement onClickRight
  }

  Future<bool> getData(BuildContext context, bool mounted) async {
    return memCache.runOnce(() async {
      isConnection = parent.isConnection;
      ConnectionStatusSingleton.getInstance().connectionChange.listen((dynamic result) async {
        if (result && !isConnection) {
          isConnection = true;
          await countJoinDay();
        } else {
          isConnection = false;
        }
      });
      final data = parent.preferences.getString(Constants.KEY_AUTHENTICATE);
      authenProfile = Authenticate.fromJson(JsonDecoder().convert(data));
      await countJoinDay();
      valueImage = authenProfile.employeeInfo.personalInfo.mobileAvatar;
      var packageInfo = await PackageInfo.fromPlatform();
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;
      itemAbouts.clear();
      itemAbouts.add(ItemAboutApp(title: "Version app", info: version));
      itemAbouts.add(ItemAboutApp(title: "Build version", info: buildNumber));
      try {
        listOfBiometrics = await _localAuthentication.getAvailableBiometrics();
      } on PlatformException catch (e) {
        print(e);
      }
      this.mounted = mounted;
      getSaveItems();
      return true;
    });
  }

  Future countJoinDay() async {
    try {
      DateTime joinDate = DateTime.parse(authenProfile.employeeInfo.jobInfo.joinDate);
      DateTime nowTemp;
      if (isConnection) {
        nowTemp = await NTP.now();
      } else {
        nowTemp = DateTime.now();
      }
      DateTime now = utilities.createWithDateTime(nowTemp, joinDate);
      var yearJoined = now.year - joinDate.year;
      if (yearJoined >= 5 && yearJoined < 10) {
        colorJoinDate = AppColors.TIME_COLOR;
      } else if (yearJoined >= 10) {
        colorJoinDate = AppColors.ROYAL_YELLOW;
      }
      countJoinDate =
          (now.millisecondsSinceEpoch - joinDate.millisecondsSinceEpoch) ~/
              86400000;
      notifyListeners();
    } catch (_) {}
  }

  /// function signout
  ///
  Future doSignout(BuildContext context) async {
    var firebaseToken =
        parent.preferences.getString(Constants.KEY_FIREBASE_TOKEN) ?? "";
    var authorization =
        locator<Utilities>().getAuthorization(parent.preferences);
    var token = authorization.refreshToken;

    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      parent.preferences.setBool(Constants.KEY_IS_LOGGED, false);
      parent.preferences.setString(Constants.KEY_AUTHENTICATE, "");
      parent.preferences.setString(Constants.KEY_EMPLOYEE_DATA, "");
      // Save to preferences device
      parent.preferences
          .setString(Constants.KEY_INFO_STEP, Constants.KEY_IS_DOMAIN);
      final fullName =
          parent.preferences.getString(Constants.KEY_FULLNAME) ?? '';
      final email = parent.preferences.getString(Constants.KEY_EMAIL) ?? '';
      AppRouter.pushToWithArguments(context, LoginScreen.route_name,
          arguments: {'email': email, 'fullName': fullName, 'loginType': 2},
          isRemoveUntil: true);
    }, (Errors message) {
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
          doSignout(context);
        }, () {});
        return;
      }
      parent.preferences.setBool(Constants.KEY_IS_LOGGED, false);
      parent.preferences.setString(Constants.KEY_AUTHENTICATE, "");
      parent.preferences.setString(Constants.KEY_EMPLOYEE_DATA, "");
      // Save to preferences device
      parent.preferences
          .setString(Constants.KEY_INFO_STEP, Constants.KEY_IS_DOMAIN);
      final fullName =
          parent.preferences.getString(Constants.KEY_FULLNAME) ?? '';
      final email = parent.preferences.getString(Constants.KEY_EMAIL) ?? '';
      AppRouter.pushToWithArguments(context, LoginScreen.route_name,
          arguments: {'email': email, 'fullName': fullName, 'loginType': 2},
          isRemoveUntil: true);
    });
    // Call API signout
    await ApiRequest()
        .requestSignOutApi(context, firebaseToken, token, callBack);
  }

  //move screen

  final LocalAuthentication _localAuthentication = LocalAuthentication();

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

  Future<bool> _authenticateUser(BuildContext context, bool mounted) async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason: appLocalizations.pleaseAuthenContinue,
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return false;

    isAuthenticated
        ? print('User is authenticated!')
        : print('User is not authenticated.');

    return isAuthenticated;
  }

  void getSaveItems() {
    var notification =
        (parent.preferences.getBool(Constants.KEY_NOTIFICATION_CONFIG) ?? true);
    var settings =
        (parent.preferences.getBool(Constants.KEY_SETTINGS_CONFIG) ?? true);
    var bio = (parent.preferences.getBool(Constants.KEY_BIO_CONFIG) ?? false);
    var isAttendanceMode =
        parent.preferences.getBool(Constants.KEY_IS_ATTENDANCE_MODE);
    itemSwitchs = <ItemSwitch>[];
    itemSwitchs.add(
      ItemSwitch(
        title: appLocalizations.notificationsTitle,
        subtitle: appLocalizations.notificationContentSetting,
        icon: Icon(
          Icons.notifications_active,
        ),
        isSelect: notification,
        switchType: SwitchType.NOTIFICATION,
      ),
    );
    itemSwitchs.add(
      ItemSwitch(
        title: _getTitleBiometric(listOfBiometrics, mounted).isEmpty
            ? appLocalizations.loginByBiometricsTitleSetting
            : _getTitleBiometric(listOfBiometrics, mounted),
        subtitle: appLocalizations.bioContentSetting,
        icon: _getIconBiometric(listOfBiometrics, mounted) ??
            Icon(
              Icons.fingerprint_outlined,
            ),
        isSelect: bio,
        switchType: SwitchType.BIO_DETECT,
      ),
    );
    if (isAttendanceMode == true) {
      itemSwitchs.add(
        ItemSwitch(
          title: appLocalizations.changeUiContentTitle,
          subtitle: appLocalizations.changeUiContentSetting,
          icon: Icon(
            Icons.settings,
          ),
          isSelect: settings,
          switchType: SwitchType.SETTINGS,
        ),
      );
    }
    itemSwitchs.add(
      ItemSwitch(
        title: appLocalizations.changeThemesContentTitle,
        subtitle: appLocalizations.changeThemesContentSetting,
        icon: Icon(
          Icons.wb_sunny_rounded,
        ),
        isSelect: settings,
        switchType: SwitchType.THEMES,
      ),
    );
  }

  String _getTitleBiometric(
      List<BiometricType> listOfBiometrics, bool mounted) {
    if (!mounted) return '';

    if (listOfBiometrics.length <= 0) {
      return '';
    }
    if (listOfBiometrics.length >= 2) {
      return appLocalizations.loginByBiometricsTitleSetting;
    }
    switch (listOfBiometrics[0]) {
      case BiometricType.face:
        return appLocalizations.loginByFaceIDTitleSetting;
      case BiometricType.fingerprint:
        return appLocalizations.loginByTouchIDTitleSetting;
      case BiometricType.iris:
        return appLocalizations.loginByIrisTitleSetting;
      default:
        return '';
    }
  }

  Widget _getIconBiometric(List<BiometricType> listOfBiometrics, bool mounted) {
    if (!mounted) return null;

    if (listOfBiometrics.length <= 0) {
      return null;
    }
    if (listOfBiometrics.length >= 2) {
      return Icon(
        Icons.fingerprint_outlined,
      );
    }
    switch (listOfBiometrics[0]) {
      case BiometricType.face:
        return Icon(
          Icons.face_outlined,
        );
      case BiometricType.fingerprint:
        return Icon(
          Icons.fingerprint_outlined,
        );
      case BiometricType.iris:
        return Icon(
          Icons.fingerprint_outlined,
        );
      default:
        return null;
    }
  }

  Future<void> switchNonAmiItem(
      BuildContext context, bool mounted, ItemSwitch item,
      {Function callback}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    switch (item.switchType) {
      case SwitchType.NOTIFICATION:
        {
          AppRouter.pushToWithArguments(
              context, NotificationSettingScreen.route_name,
              arguments: {
                'id': authenProfile.employeeInfo.id,
              });
          break;
        }
      case SwitchType.BIO_DETECT:
        {
          if (await _isBiometricAvailable(mounted)) {
            bool isAuthenSuccess = await _authenticateUser(context, mounted);
            if (isAuthenSuccess) {
              prefs.setBool(Constants.KEY_BIO_CONFIG, item.isSelect);
            } else {
              item.isSelect = !item.isSelect;
            }
          } else {
            if (Platform.isIOS) {
              Utilities().showTwoButtonDialog(
                context,
                DialogType.QUESTION,
                null,
                '',
                appLocalizations.bioNotAvailableEnable,
                appLocalizations.gotoSettingApp,
                appLocalizations.btnOk,
                () {
                  AppSettings.openAppSettings();
                  // locator<NavigationService>().navigatePop();
                },
                () {},
              );
            }
          }
          break;
        }
      case SwitchType.SETTINGS:
        {
          AppRouter.pushTo(context, ChangeUIScreen.route_name);
          break;
        }
      case SwitchType.THEMES:
        {
          AppRouter.pushTo(context, ChangeThemesScreen.route_name);
          break;
        }

      default:
        {}
    }
    if (callback != null) {
      callback();
    }
    notifyListeners();
  }

  Future getImage() async {
    print('getImage.');
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<bool> requestPermission(Function callback, bool isJustCheck) async {
    var permissionCallBack = PermissionCallBack(() async {
      await callback();
    }, () {}, () {});
    List<PermissionGroup> permissions = List();
    permissions = Platform.isAndroid == true
        ? [PermissionGroup.storage]
        : [PermissionGroup.photos];
    return await Utilities.requestPermission(
        context, permissions, permissionCallBack, isJustCheck, true);
  }

  void showHideLoading(bool isShow) {
    isLoading = isShow;
    notifyListeners();
  }

  /// Get from gallery
  Future getFromGallery(
      BuildContext context, Widget alert, Widget alertGotoSetting) async {
    try {
      PickedFile pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        image = File(pickedFile.path);
        doUploadAvatar(context, pickedFile.path);
      } else {
        print('No image selected.');
      }
    } on PlatformException catch (e) {
      var permissionCallBack = PermissionCallBack(() async {
        getFromGallery(context, alert, alertGotoSetting);
      }, () async {
        await showDialog(
          context: context,
          child: alert,
        );
      }, () async {
        await showDialog(
          context: context,
          child: alertGotoSetting,
        );
      });
      List<PermissionGroup> permissions = List();
      permissions = Platform.isAndroid == true
          ? [PermissionGroup.storage]
          : [PermissionGroup.photos];
      return await Utilities.requestPermission(
          context, permissions, permissionCallBack, true, true);
    }
  }

  Future doUploadAvatar(BuildContext context, String image) async {
    showHideLoading(true);
    ApiCallBack callBack =
        ApiCallBack((BaseResponse baseResponse) async {
          authenProfile.employeeInfo.personalInfo.mobileAvatar = baseResponse.data["fileName"];
          preferences.setString(Constants.KEY_AUTHENTICATE, JsonEncoder().convert(authenProfile.toJson()));
          getImageAvatarFromLocal(baseResponse.data["fileName"]);
        }, (Errors message) {
          getImageAvatarFromLocal("");
        });
    await ApiRequest().requestUploadAvatar(context, image, callBack);
  }

  void getImageAvatarFromLocal(String imageLink) {
    memCacheAvatar = AsyncMemoizer();
    valueImage = imageLink;
    showHideLoading(false);
    Provider.of<DashBoardNotifier>(context, listen: false)
        .getImageLink(imageLink);
  }

  Future doDeleteAvatar(BuildContext context) async {
    getImageAvatarFromLocal("");
    locator<Utilities>().deleteFile(File('Avatar.jpg'));
    ApiCallBack callBack = ApiCallBack(
        (BaseResponse baseResponse) async {}, (Errors message) async {});
    await ApiRequest().requestDeleteAvatar(context, callBack);
  }

  Future updateTop() async {
    print('update top');
  }

  Future launchURL() async {
    const url = Constants.URL_CHECK_IN_PRO;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
