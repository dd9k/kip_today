import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/utilities/Validator.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
import 'package:checkinpromobile/src/widgetUtilities/FooterContent.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:checkinpromobile/src/widgetUtilities/TextFieldCommon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'ChangePassWordNotifier.dart';
import 'package:flutter/services.dart';

class ChangePasswordScreen extends MainScreen {
  static const String route_name = '/change-pass';

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class _ChangePasswordScreenState
    extends MainScreenState<ChangePasswordNotifier> {
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final oldPasswordController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();
  FocusNode oldPassFocusNode = FocusNode();
  GlobalKey<FormState> _passKey;
  GlobalKey<FormState> _confirmPassKey;
  GlobalKey<FormState> _oldPassKey;
  String errorConfirmPassword;

  bool isShowOldPassword = false;
  bool isShowPassword = false;
  bool isShowConfirmPassword = false;

  @override
  void initState() {
    super.initState();
    _passKey = new GlobalKey();
    _oldPassKey = new GlobalKey();
    _confirmPassKey = new GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    int sizeRender = 70;
    return Container(
      color: context.bgSliverAppBar,
      child: SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
              context: context,
              provider: provider,
              index: -1,
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                        SizedBox(
                          height: 0,
                        ),
                        Selector<ChangePasswordNotifier, String>(
                          builder: (widget, data, child) {
                            if (data == null) {
                              return SizedBox(
                                height: 20,
                                width: 0,
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 40),
                                child: Text(
                                  appLocalizations.oldPwInCorrect,
                                  style: TextStyle(
                                      fontFamily: AppTextStyles.tahomaFont,
                                      color: Colors.red[400],
                                      fontSize: widthScreen * 3,
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            }
                          },
                          selector: (buildContext, provider) =>
                              provider.errorText,
                        ),
                        _buildTextFiledRow(
                            appLocalizations.oldPw,
                            appLocalizations.oldPw,
                            null,
                            oldPasswordController,
                            isShowOldPassword,
                            Icons.lock,
                            oldPassFocusNode,
                            sizeRender,
                            _oldPassKey,
                            Validator(context).validatePassword, () {
                          oldPassFocusNode.unfocus();
                          FocusScope.of(context).requestFocus(oldPassFocusNode);
                        }, () {
                          setState(() {
                            isShowOldPassword = !isShowOldPassword;
                          });
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        _buildTextFiledRow(
                            appLocalizations.password,
                            appLocalizations.hintLoginPassword,
                            null,
                            passwordController,
                            isShowPassword,
                            Icons.lock,
                            passFocusNode,
                            sizeRender,
                            _passKey,
                            Validator(context).validatePasswordVer2, () {
                          passFocusNode.unfocus();
                          FocusScope.of(context).requestFocus(passFocusNode);
                        }, () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        _buildTextFiledRow(
                            appLocalizations.confirmPassword,
                            appLocalizations.confirmPassword,
                            errorConfirmPassword,
                            confirmPasswordController,
                            isShowConfirmPassword,
                            Icons.confirmation_number,
                            confirmPasswordFocusNode,
                            sizeRender,
                            _confirmPassKey,
                            Validator(context).validatePassword, () {
                          confirmPasswordFocusNode.unfocus();
                        }, () {
                          setState(() {
                            isShowConfirmPassword = !isShowConfirmPassword;
                          });
                        }),
                        _buildBtnNext(context)
                      ])),
                  FooterContent()
                ])),
      ),
    );
  }

  Widget _buildBtnNext(BuildContext context) {
    return FutureBuilder<Object>(
        future: locator<Utilities>().isConnectInternet(),
        builder: (context, snapshot) {
          return Container(
            padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
            child: RaisedGradientButton(
              isLoading: true,
              btnController: provider.btnController,
              disable: provider.isLoading,
              btnText: appLocalizations.saveContentButton,
              btnTextSize: widthScreen * 4,
              onPressed: () {
                if (snapshot.data == false) {
                  locator<Utilities>().showOneButtonDialog(
                      context,
                      DialogType.ERROR,
                      null,
                      appLocalizations.titleError,
                      appLocalizations.noInternet,
                      appLocalizations.buttonClose, () {
                    provider.btnController.stop();
                  });
                } else {
                  provider.utilities.hideKeyBoard(context);
                  if (_passKey.currentState.validate() &&
                      _confirmPassKey.currentState.validate() &&
                      _oldPassKey.currentState.validate()) {
                    setState(() {
                      errorConfirmPassword = provider.validateComparePassword(
                          context,
                          passwordController.text,
                          confirmPasswordController.text);
                      if (errorConfirmPassword == null) {
                        provider.doChangePassword(
                            context,
                            oldPasswordController.text,
                            passwordController.text);
                      } else {
                        provider.errorText = null;
                        provider.btnController.stop();
                      }
                    });
                  } else {
                    setState(() {
                      provider.errorText = null;
                      errorConfirmPassword = null;
                    });
                    provider.btnController.stop();
                  }
                }
              },
            ),
          );
        });
  }

  Widget _buildTextFiledRow(
      String title,
      String hint,
      String errorText,
      TextEditingController controller,
      bool isPassword,
      IconData prefixIcon,
      FocusNode focusNode,
      int sizeRender,
      Key keyTextField,
      FormFieldValidator<String> validator,
      Function onComplete,
      Function suffixIconOnTap) {
    return Container(
        child: Form(
      key: keyTextField,
      child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: TextFieldCommon(
            validator: validator,
            hint: hint,
            isPassword: !isPassword ? true : false,
            controller: controller,
            focusNode: focusNode,
            onComplete: onComplete,
            errorText: errorText,
            suffixIcon: IconButton(
              icon: !isPassword
                  ? Icon(
                      Icons.visibility_outlined,
                      color: AppColors.DARK_BLUE_TEXT,
                    )
                  : Icon(
                      Icons.visibility_off_rounded,
                      color: AppColors.DARK_BLUE_TEXT,
                    ),
              onPressed: () {
                suffixIconOnTap();
              },
            ),
          )),
    ));
  }
}
