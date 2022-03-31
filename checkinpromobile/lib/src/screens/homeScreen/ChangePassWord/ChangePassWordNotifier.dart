import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/screens/AppBarNotifier.dart';
import 'package:checkinpromobile/src/screens/DomainPage/DomainScreen.dart';
import 'package:checkinpromobile/src/screens/MainNotifier.dart';
import 'package:checkinpromobile/src/screens/guildLine/GuildLineScreen.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:checkinpromobile/src/screens/login/LoginScreen.dart';

class ChangePasswordNotifier extends AppBarNotifier {
  RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();

  Future doChangePassword(
      BuildContext context, String oldPassword, String newPassword) async {
    var preferences = await SharedPreferences.getInstance();
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      preferences.setBool(Constants.KEY_IS_LOGGED, false);
      preferences.setString(Constants.KEY_AUTHENTICATE, "");
      preferences.setString(Constants.KEY_EMPLOYEE_DATA, "");
      preferences.setBool(Constants.KEY_IS_LOGGED, false);
      // Save to preferences device
      preferences.setString(Constants.KEY_INFO_STEP, Constants.KEY_IS_DOMAIN);
      preferences.setString(Constants.KEY_PASSWORD, newPassword);
      isLoading = false;
      notifyListeners();
      moveToLogin(context);
    }, (Errors message) {
      isLoading = false;
      errorText = message.description;
      if (message.description == "ACC_WrongPwd") {
        errorText = appLocalizations.wrongPassword;
      }
      btnController.stop();
      notifyListeners();
    });

    await ApiRequest()
        .requestChangePw(context, oldPassword, newPassword, callBack);
  }

  void moveToLogin(BuildContext context) async {
    AppRouter.pushTo(context, LoginScreen.route_name);
  }

  String validateComparePassword(
      BuildContext context, String password, String confirmPassword) {
    if (password.toLowerCase() == confirmPassword.toLowerCase()) {
      return null;
    }
    errorTextForConfirmPass = appLocalizations.comparePassword;
    return errorTextForConfirmPass;
  }

  bool isLoading = false;
  bool isDevMode = false;
  bool updateToggle = false;
  bool isShowFAB = true;
  bool isUpdateLang = false;
  String errorTextForConfirmPass;
  bool isFabOpen = false;
  bool isTouchOutSide = false;
  int clickNumber = 0;
  bool isShowPass = false;
  String errorText;

  @override
  String getSubTitle(BuildContext context) {
    // TODO: implement getSubTitle
    throw UnimplementedError();
  }

  @override
  String getTitle(BuildContext context) {
    // TODO: implement getTitle
    return appLocalizations.changePasswordTitle;
  }

  @override
  void onClickLeft(BuildContext context) {
    // TODO: implement onClickLeft
  }

  @override
  void onClickRight(BuildContext context) {
    // TODO: implement onClickRight
  }
}
