import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/screens/ResetPassword/ResetPasswordNotifier.dart';
import 'package:checkinpromobile/src/utilities/Validator.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
import 'package:checkinpromobile/src/widgetUtilities/FooterContent.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:checkinpromobile/src/widgetUtilities/TextFieldCommon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';

class ResetPasswordScreen extends MainScreen {
  static const String route_name = '/reset-pass';

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class _ResetPasswordScreenState extends MainScreenState<ResetPasswordNotifier> {
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();
  GlobalKey<FormState> _passKey;
  GlobalKey<FormState> _confirmPassKey;
  String errorConfirmPassword;
  bool isShowPassword = false;
  bool isShowConfirmPassword = false;

  @override
  void initState() {
    super.initState();
    _passKey = new GlobalKey();
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
            backgroundColor: AppColors.BACKGROUND_MAIN,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
              context: context,
              provider: provider,
              index: 3,
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
                        _buildHeaderLogo(provider),
                        SizedBox(
                          height: 30,
                        ),
                        Selector<ResetPasswordNotifier, String>(
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
                                  data,
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
                          FocusScope.of(context)
                              .requestFocus(confirmPasswordFocusNode);
                        }, () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        }),
                        SizedBox(
                          height: 25,
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

  Widget _buildHeaderLogo(ResetPasswordNotifier provider) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          top: 30,
        ),
        child: Theme.of(context).brightness == Brightness.light
            ? AppImage.checkinProBlue
            : AppImage.checkinProWhite,
      ),
    );
  }

  Widget _buildBtnNext(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
      child: RaisedGradientButton(
        isLoading: true,
        btnController: provider.btnController,
        disable: provider.isLoading,
        btnText: appLocalizations.saveContentButton,
        btnTextSize:
            AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
        onPressed: () {
          provider.utilities.hideKeyBoard(context);
          if (_passKey.currentState.validate() &&
              _confirmPassKey.currentState.validate()) {
            setState(() {
              errorConfirmPassword = provider.validateComparePassword(context,
                  passwordController.text, confirmPasswordController.text);
              if (errorConfirmPassword == null) {
                provider.doChangePassword(context, passwordController.text);
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
        },
      ),
    );
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
                inputlength: 100,
                hint: hint,
                isPassword: isPassword ? false : true,
                controller: controller,
                validator: validator,
                errorText: errorText,
                focusNode: focusNode,
                onComplete: onComplete,
                suffixIcon: IconButton(
                  icon: !isPassword
                      ? Icon(
                          Icons.visibility_off_rounded,
                          color: AppColors.DARK_BLUE_TEXT,
                        )
                      : Icon(
                          Icons.visibility_outlined,
                          color: AppColors.DARK_BLUE_TEXT,
                        ),
                  onPressed: () {
                    suffixIconOnTap();
                  },
                )),
          )),
    );
  }
}
