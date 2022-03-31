import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/screens/AppBarNotifier.dart';
import 'package:checkinpromobile/src/screens/login/LoginScreen.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordNotifier extends AppBarNotifier {
  RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();

  Future doChangePassword(BuildContext context, String newPassword) async {
    var preferences = await SharedPreferences.getInstance();
    final code = preferences.getString(Constants.KEY_DATA_CODEOTP) ?? '';
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      // Clear data code OTP
      preferences.setString(Constants.KEY_DATA_CODEOTP, '');
      if (preferences.getBool(Constants.KEY_FLOW_ACTIVE_EMAIL) ?? false) {
        // Save to preferences device
        preferences.setString(Constants.KEY_INFO_STEP, Constants.KEY_IS_LOGIN);
        // Move to next screen
        // navigationService.pushNamed(GuildLineScreen.route_name);
        AppRouter.pushTo(context, LoginScreen.route_name);
      } else {
        // Save to preferences device
        preferences.setString(Constants.KEY_INFO_STEP, Constants.KEY_IS_DOMAIN);
        // Move to next screen
        AppRouter.pushTo(context, LoginScreen.route_name);
      }
    }, (Errors message) {
      isLoading = false;
      btnController.stop();
      if (message.code != -2) {
        if (message.description == "ACC_Action_Expire") {
          errorText = appLocalizations.changePasswordExpired;
          notifyListeners();
        }
      }
    });

    await ApiRequest()
        .requestChangePassword(context, newPassword, code, callBack);
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
    return appLocalizations.settingPasswordTitle;
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
