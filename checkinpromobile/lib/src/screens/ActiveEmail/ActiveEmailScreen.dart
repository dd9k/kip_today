import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/screens/ActiveEmail/ActiveEmailNotifier.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/utilities/Validator.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/CustomAppBar.dart';
import 'package:checkinpromobile/src/widgetUtilities/FooterContent.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:checkinpromobile/src/widgetUtilities/TextFieldCommon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:checkinpromobile/src/widgetUtilities/LabelCheckbox.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class ActiveEmailScreen extends MainScreen {
  static const String route_name = '/active-email';

  @override
  _ActiveEmailScreenState createState() => _ActiveEmailScreenState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class _ActiveEmailScreenState extends MainScreenState<ActiveEmailNotifier>
    with TickerProviderStateMixin {
  int indexInputPin = -1;
  bool _isSelected = false;
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
          index: -1,
          provider: provider,
          context: context,
        ),
        body: Center(
          child: Container(
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
                          Selector<ActiveEmailNotifier, String>(
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
                                if (_emailKey.currentState.validate() &&
                                    _isSelected) {
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
                          _buildTermsAndConditions(),
                          SizedBox(
                            height: 10,
                          ),
                          _buildBtnNext(provider),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              provider.gotoLoginScreen(context);
                            },
                            child: Container(
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              width: SizeConfig.safeBlockHorizontal * 80,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '${appLocalizations.haveBeenActiveAnAccountContent} ',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    TextSpan(
                                      text: appLocalizations
                                          .haveBeenActiveAnAccountContentPostfix,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(
                                              color: AppColors.DARK_BLUE_TEXT),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          provider.gotoLoginScreen(context);
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      FooterContent()
                    ],
                  ))),
        ),
      )),
    );
  }

  Widget _buildTermsAndConditions() {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 80,
      child: LabeledCheckbox(
        titleText: RichText(
          text: new TextSpan(
            children: [
              TextSpan(
                  text: '${appLocalizations.termConditionPrefix} ',
                  style: Theme.of(context).textTheme.headline3),
              TextSpan(
                text: appLocalizations.termConditionPostfix,
                style: Theme.of(context).textTheme.headline3.copyWith(
                      fontStyle: FontStyle.italic,
                      color: AppColors.DARK_BLUE_TEXT,
                    ),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () {
                    launch('https://checkinpro.vn/dieu-khoan-su-dung/');
                  },
              ),
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        value: _isSelected,
        onChanged: (bool newValue) {
          setState(() {
            _isSelected = newValue;
          });
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

  Widget _buildBtnNext(ActiveEmailNotifier provider) {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 80,
      height: 50,
      child: RaisedGradientButton(
        isLoading: true,
        btnController: provider.btnController,
        disable: provider.isLoading,
        btnText: appLocalizations.activeButton,
        color: _isSelected == true ? null : Color(0xFFB4B4B4),
        btnTextSize:
            AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
        isEnable: _isSelected,
        onPressed: () {
          provider.utilities.hideKeyBoard(context);
          if (_emailKey.currentState.validate()) {
            provider.doValidateEmail(context, emailController.text);
          } else {
            provider.btnController.stop();
          }
        },
      ),
    );
  }
}
