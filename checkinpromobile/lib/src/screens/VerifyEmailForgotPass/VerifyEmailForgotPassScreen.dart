import 'package:auto_size_text/auto_size_text.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/screens/VerifyEmailForgotPass/VerifyEmailForgotPassNotifier.dart';
import 'package:checkinpromobile/src/utilities/Validator.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
import 'package:checkinpromobile/src/widgetUtilities/FooterContent.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:checkinpromobile/src/widgetUtilities/TextFieldCommon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';

class VerifyEmailForgotPassScreen extends MainScreen {
  static const String route_name = '/verify-email-forgot-pass';

  @override
  _VerifyEmailForgotPassScreenState createState() =>
      _VerifyEmailForgotPassScreenState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class _VerifyEmailForgotPassScreenState
    extends MainScreenState<VerifyEmailForgotPassNotifier>
    with TickerProviderStateMixin {
  int indexInputPin = -1;
  final emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  GlobalKey<FormState> _emailKey;
  String errMessage;

  @override
  void initState() {
    super.initState();
    _emailKey = new GlobalKey();
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
          body: Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Selector<VerifyEmailForgotPassNotifier, String>(
                            builder: (cx, data, child) {
                              return _buildTextFiledRow(
                                  appLocalizations.email,
                                  appLocalizations.hintLoginEmail,
                                  (data == null || data.length < 2)
                                      ? null
                                      : data,
                                  emailController,
                                  false,
                                  Icons.email,
                                  emailFocusNode,
                                  sizeRender, () {
                                provider.utilities.hideKeyBoard(context);
                                if (_emailKey.currentState.validate()) {
                                  provider.btnController.start();
                                } else {
                                  provider.btnController.stop();
                                }
                              });
                            },
                            selector: (cx, provider) => provider.errorMesage,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: SizeConfig.safeBlockHorizontal * 80,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              appLocalizations.otpCodeSendContent,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: AppTextStyles.tahomaFont,
                                  fontSize: AdaptiveTextSize()
                                      .getadaptiveTextSize(context,
                                          multiplier: 1.85),
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          _buildBtnNext(provider),
                        ],
                      ),
                      FooterContent()
                    ],
                  ))),
        ),
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
      Function onComplete) {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 80,
      child: Form(
        key: _emailKey,
        child: TextFieldCommon(
          inputlength: 200,
          hint: hint,
          validator: Validator(context).validateEmail,
          isPassword: isPassword,
          controller: controller,
          errorText: errorText,
          focusNode: focusNode,
          onComplete: onComplete,
        ),
      ),
    );
  }

  // Widget _buildTextFiledRow(
  //     String title,
  //     String hint,
  //     String errorText,
  //     TextEditingController controller,
  //     bool isPassword,
  //     IconData prefixIcon,
  //     FocusNode focusNode,
  //     int sizeRender,
  //     Function onComplete) {
  //   return Container(
  //     width: SizeConfig.safeBlockHorizontal * 80,
  //     child: Form(
  //         key: _emailKey,
  //         child: TextFormField(
  //           validator: Validator(context).validateEmail,
  //           decoration: new InputDecoration(
  //               errorText: errorText,
  //               contentPadding:
  //                   const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
  //               fillColor: Colors.transparent,
  //               labelText: hint,
  //               labelStyle: TextStyle(
  //                   fontFamily: AppTextStyles.helveticaFont,
  //                   color: Color(0xff9d9d9d),
  //                   fontSize: SizeConfig.safeBlockHorizontal * 4,
  //                   fontWeight: FontWeight.w300),
  //               prefixIcon: Padding(
  //                   padding: const EdgeInsetsDirectional.only(end: 20.0),
  //                   child: Icon(
  //                     prefixIcon,
  //                     size: 20,
  //                     color: Theme.of(context).accentColor,
  //                   )),
  //               enabledBorder: UnderlineInputBorder(
  //                 borderSide: BorderSide(color: Colors.grey),
  //               ),
  //               focusedBorder: UnderlineInputBorder(
  //                 borderSide: BorderSide(color: Colors.blue),
  //               ),
  //               focusedErrorBorder: UnderlineInputBorder(
  //                   borderSide: BorderSide(color: Colors.red)),
  //               errorBorder: UnderlineInputBorder(
  //                   borderSide: BorderSide(color: Colors.red)),
  //               border: UnderlineInputBorder()),
  //           onChanged: null,
  //           controller: controller,
  //           focusNode: focusNode,
  //           onEditingComplete: onComplete,
  //           keyboardType:
  //               isPassword ? TextInputType.text : TextInputType.emailAddress,
  //           inputFormatters: <TextInputFormatter>[
  //             LengthLimitingTextInputFormatter(100),
  //           ],
  //         )),
  //   );
  // }

  Widget _buildBtnNext(VerifyEmailForgotPassNotifier provider) {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 80,
      height: 50,
      child: RaisedGradientButton(
        isLoading: true,
        btnController: provider.btnController,
        disable: provider.isLoading,
        btnText: appLocalizations.activeButton,
        btnTextSize:
            AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
        isEnable: true,
        onPressed: () {
          provider.utilities.hideKeyBoard(context);
          if (_emailKey.currentState.validate()) {
            provider.doForgotPassword(context, emailController.text);
          } else {
            provider.btnController.stop();
          }
        },
      ),
    );
  }
}
