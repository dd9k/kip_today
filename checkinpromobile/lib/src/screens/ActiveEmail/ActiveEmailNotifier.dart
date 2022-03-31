import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/screens/AppBarNotifier.dart';
import 'package:checkinpromobile/src/screens/MainNotifier.dart';
import 'package:checkinpromobile/src/screens/OtpVerifyScreen/OtpVerifyScreen.dart';
import 'package:checkinpromobile/src/screens/login/LoginScreen.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActiveEmailNotifier extends AppBarNotifier {
  String errorMesage;
  bool isLoading = false;
  RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();

  Future doValidateEmail(BuildContext context, String email) async {
    errorMesage = null;
    var preferences = await SharedPreferences.getInstance();
    final domain = preferences.getString(Constants.KEY_DOMAIN_STRING) ?? "";
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      // Move to login screen
      AppRouter.pushToWithArguments(context, LoginScreen.route_name,
          arguments: {'email': email});
      btnController.stop();
    }, (Errors message) async {
      isLoading = false;
      btnController.stop();
      if (message.code != -2) {
        if (message.description == appLocalizations.accountDeactivated) {
          preferences.setBool(Constants.KEY_FLOW_ACTIVE_EMAIL,
              true); // đi theo flow forgot password
          // Move to OTP verify screen
          AppRouter.pushToWithArguments(context, OtpVerifyScreen.route_name,
              arguments: {
                'email': email,
                'verifyScreenType': E_OtpVerifyScreenType.ActiveAccount
              },
              isRemoveUntil: true);
          return;
        }
        errorMesage = message.description;
        if (message.description == "DE_RuleOneAccOneDevice") {
          errorMesage = appLocalizations.ruleOneAccOneDeviceForActive;
        }
      } else {
        errorMesage = message.description;
      }
      notifyListeners();
    });
    var deviceEmployee = await locator<Utilities>().getInfoDeviceForEmployee();
    await ApiRequest()
        .requestValidateEmail(context, email, domain, deviceEmployee, callBack);
  }

  void gotoLoginScreen(BuildContext context) {
    // Move to login screen
    AppRouter.pushTo(context, LoginScreen.route_name);
  }

  @override
  String getSubTitle(BuildContext context) {
    // TODO: implement getSubTitle
    throw UnimplementedError();
  }

  @override
  String getTitle(BuildContext context) {
    // TODO: implement getTitle
    return appLocalizations.activeAccount;
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
