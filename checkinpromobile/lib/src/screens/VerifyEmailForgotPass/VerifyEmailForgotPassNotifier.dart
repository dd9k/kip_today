import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/screens/AppBarNotifier.dart';
import 'package:checkinpromobile/src/screens/OtpVerifyScreen/OtpVerifyScreen.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyEmailForgotPassNotifier extends AppBarNotifier {
  String errorMesage;
  bool isLoading = false;
  RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();

  Future doForgotPassword(BuildContext context, String email) async {
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      btnController.stop();
      preferences.setBool(Constants.KEY_FLOW_ACTIVE_EMAIL,
          false); // đi theo flow forgot password
      AppRouter.pushToWithArguments(context, OtpVerifyScreen.route_name,
          isRemoveUntil: true,
          arguments: {
            'email': email,
            'verifyScreenType': E_OtpVerifyScreenType.ForgotPass
          });
    }, (Errors message) {
      if (message.code != -2) {}
      errorMesage = message.description;
      if (message.description == "DE_RuleOneAccOneDevice") {
        errorMesage = appLocalizations.ruleOneAccOneDeviceForActive;
      }
      btnController.stop();
      notifyListeners();
    });
    final deviceEmployee = await utilities.getInfoDeviceForEmployee();
    var domain = preferences.getString(Constants.KEY_DOMAIN_STRING) ?? "";
    await ApiRequest()
        .requestForgotPassword(context, email, deviceEmployee, domain, callBack);
  }

  @override
  String getSubTitle(BuildContext context) {
    // TODO: implement getSubTitle
    throw UnimplementedError();
  }

  @override
  String getTitle(BuildContext context) {
    // TODO: implement getTitle
    return appLocalizations.resetPassword;
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
