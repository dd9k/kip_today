import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/DeviceInfo.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/screens/MainNotifier.dart';
import 'package:checkinpromobile/src/screens/OtpVerifyScreen/OtpVerifyScreen.dart';
import 'package:checkinpromobile/src/screens/ResetPassword/ResetPasswordScreen.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVerifyNotifier extends MainNotifier {
  bool isLoading = false;
  String messageError = '';
  E_OtpVerifyScreenType eOtpVerifyScreenType =
      E_OtpVerifyScreenType.ActiveAccount;

  Future doVerifyOTP(
      BuildContext context, String email, String passCode) async {
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      var code = baseResponse.data;
      // Save to preferences device
      preferences.setString(
          Constants.KEY_INFO_STEP, Constants.KEY_IS_CHANGE_PASS_FIRST);
      preferences.setString(Constants.KEY_DATA_CODEOTP, code['value']);
      // Move to next screen
      AppRouter.pushTo(context, ResetPasswordScreen.route_name,
          isRemoveUntil: true);
    }, (Errors message) {
      isLoading = false;
      messageError = '';
      if ("EA_PasscodeInvalid" == message.description) {
        messageError = appLocalizations.passCodeInValid;
      }
      if ("EA_PasscodeExpired" == message.description) {
        messageError = appLocalizations.passCodeExpired;
      }
      if (message.code != -2) {}
      notifyListeners();
    });

    DeviceEmployee deviceEmployee = await utilities.getInfoDeviceForEmployee();
    var domain = preferences.getString(Constants.KEY_DOMAIN_STRING) ?? "";
    await ApiRequest().requestValidatePassCode(
        context,
        email,
        passCode,
        deviceEmployee.deviceId,
        deviceEmployee.os,
        deviceEmployee.deviceName,
        domain,
        callBack);
  }

  Future<String> getOTPString(List<ValueNotifier<String>> lst) async {
    await Future.delayed(Duration(milliseconds: 100));
    isLoading = true;
    notifyListeners();
    if (lst.length <= 0) {
      return '';
    }
    var concatenate = StringBuffer();
    lst.forEach((item) {
      concatenate.write(item.value);
    });
    return concatenate.toString();
  }

  Future doResendOTPForForgotPass(BuildContext context, String email) async {
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      preferences.setBool(Constants.KEY_FLOW_ACTIVE_EMAIL,
          false); // đi theo flow forgot password
    }, (Errors message) {
      if (message.code != -2) {}
      notifyListeners();
    });
    final deviceEmployee = await utilities.getInfoDeviceForEmployee();
    var domain = preferences.getString(Constants.KEY_DOMAIN_STRING) ?? "";
    await ApiRequest()
        .requestForgotPassword(context, email, deviceEmployee, domain, callBack);
  }

  Future doResendOTPForActiveEmail(BuildContext context, String email) async {
    var preferences = await SharedPreferences.getInstance();
    final domain = preferences.getString(Constants.KEY_DOMAIN_STRING) ?? "";
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {},
        (Errors message) async {
      if (message.code != -2) {
        if (message.description == appLocalizations.accountDeactivated) {
          preferences.setBool(Constants.KEY_FLOW_ACTIVE_EMAIL, true);
          return;
        }
      }
      notifyListeners();
    });
    var deviceEmployee = await utilities.getInfoDeviceForEmployee();
    await ApiRequest()
        .requestValidateEmail(context, email, domain, deviceEmployee, callBack);
  }
}
