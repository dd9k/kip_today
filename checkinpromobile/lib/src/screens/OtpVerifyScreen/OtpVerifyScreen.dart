import 'dart:async';
import 'dart:ui';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/screens/OtpVerifyScreen/OtpContainer.dart';
import 'package:checkinpromobile/src/screens/OtpVerifyScreen/OtpVerifyNotifier.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/FooterContent.dart';
import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';

enum E_OtpVerifyScreenType {
  ForgotPass,
  ActiveAccount,
}

class OtpVerifyScreen extends MainScreen {
  static const String route_name = '/otp-verify';
  final int numberOfOtp;

  OtpVerifyScreen({this.numberOfOtp = 6});

  @override
  _OtpVerifyScreenState createState() => _OtpVerifyScreenState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class _OtpVerifyScreenState extends MainScreenState<OtpVerifyNotifier> {
  int indexInputPin = -1;
  List<ValueNotifier<String>> _lstCounter = [];
  double widthScreen;
  double heightScreen;
  final emailController = TextEditingController();
  bool isResend = false;
  String email = '';

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    heightScreen = MediaQuery.of(context).size.height;
    super.build(context);
    email = "";
    if (provider.arguments != null) {
      email = provider.arguments["email"] as String;
      provider.eOtpVerifyScreenType =
          provider.arguments["verifyScreenType"] as E_OtpVerifyScreenType;
    }
    return Container(
      color: context.bgSliverAppBar,
      child: SafeArea(
        bottom: true,
        child: Scaffold(
            body: Center(
                child: Stack(
          children: [
            Container(
                child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    appLocalizations.verificationCode,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        .copyWith(
                                            fontSize: AdaptiveTextSize()
                                                .getadaptiveTextSize(context,
                                                    multiplier: 2.5)),
                                  ),
                                  flex: 1,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Text(
                                      '${appLocalizations.otpVerifyContent}\n$email',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(
                                            fontSize: AdaptiveTextSize()
                                                .getadaptiveTextSize(context,
                                                    multiplier: 1.9),
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                          child: Text(
                                            appLocalizations.questionResend,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5
                                                .copyWith(
                                                  fontSize: AdaptiveTextSize()
                                                      .getadaptiveTextSize(
                                                          context,
                                                          multiplier: 1.9),
                                                ),
                                          ),
                                          flex: 1),
                                      Expanded(
                                        flex: 1,
                                        child: ArgonTimerButton(
                                          elevation: 0,
                                          height: 30,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          minWidth: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          color: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          roundLoadingShape: false,
                                          borderSide: BorderSide(
                                            width: 0,
                                            color: context.bgCard,
                                          ),
                                          child: Text(
                                            '${appLocalizations.resendOPT}' +
                                                "     ",
                                            textAlign: TextAlign.start,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1,
                                          ),
                                          loader: (timeLeft) {
                                            return Text(
                                              '${appLocalizations.resendOPT} ($timeLeft)',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: AdaptiveTextSize()
                                                    .getadaptiveTextSize(
                                                        context,
                                                        multiplier: 1.85),
                                                fontFamily: AppTextStyles
                                                    .helveticaFontLight,
                                              ),
                                            );
                                          },
                                          onTap: (startTimer, btnState) {
                                            if (provider.eOtpVerifyScreenType ==
                                                E_OtpVerifyScreenType
                                                    .ForgotPass) {
                                              provider.doResendOTPForForgotPass(
                                                  context, email);
                                              if (btnState ==
                                                  ButtonState.Idle) {
                                                startTimer(5);
                                              }
                                            } else {
                                              provider
                                                  .doResendOTPForActiveEmail(
                                                      context, email);
                                              if (btnState ==
                                                  ButtonState.Idle) {
                                                startTimer(5);
                                              }
                                            }
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  flex: 2,
                                ),
                                // SizedBox(
                                //   height: 30,
                                // ),
                                Expanded(flex: 3, child: _buildOTPInputRow()),
                                Expanded(
                                  flex: 0,
                                  child: _buildMessageError(),
                                ),
                                Expanded(
                                  child: NumericKeyboard(
                                    onKeyboardTap: _onKeyboardTap,
                                    textColor: context.bgSwapColor,
                                    rightButtonFn: () {
                                      if (indexInputPin <= -1) {
                                        return;
                                      }
                                      _lstCounter[indexInputPin].value = '';
                                      indexInputPin--;
                                    },
                                    rightIcon: Icon(
                                      Icons.backspace,
                                      color: context.bgSwapColor,
                                    ),
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                  ),
                                  flex: 10,
                                )
                              ],
                            ),
                            flex: 10),
                        Expanded(
                          child: FooterContent(),
                          flex: 0,
                        )
                      ],
                    ))),
            _buildLoading()
          ],
        ))),
      ),
    );
  }

  _onKeyboardTap(String value) async {
    if (indexInputPin >= (widget as OtpVerifyScreen).numberOfOtp - 1) {
      return;
    }
    indexInputPin++;
    _lstCounter[indexInputPin].value = value;
    // Verify code
    if (indexInputPin >= (widget as OtpVerifyScreen).numberOfOtp - 1) {
      final otp = await provider.getOTPString(_lstCounter);
      provider.doVerifyOTP(context, email, otp);
      _clearOTPCode();
    }
  }

  Widget _buildMessageError() {
    return Selector<OtpVerifyNotifier, String>(
      builder: (cx, data, child) {
        return Padding(
          padding: EdgeInsets.only(top: 0, bottom: 0),
          child: Text(
            data,
            style: TextStyle(
                color: Colors.red,
                fontFamily: AppTextStyles.tahomaFont,
                fontSize: AdaptiveTextSize()
                    .getadaptiveTextSize(context, multiplier: 1.85)),
          ),
        );
      },
      selector: (cx, provider) => provider.messageError,
    );
  }

  Widget _buildLoading() {
    return Selector<OtpVerifyNotifier, bool>(
      builder: (cx, data, child) {
        return Visibility(
          visible: provider.isLoading ? true : false,
          child: AnimatedOpacity(
            opacity: provider.isLoading ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: ClipRect(
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: new Container(
                  width: widthScreen,
                  height: heightScreen,
                  decoration:
                      new BoxDecoration(color: Colors.black.withOpacity(0.5)),
                  child: new Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      selector: (cx, provider) => provider.isLoading,
    );
  }

  final _lstNumpadKeyBoard = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'none',
    '0',
    'clear'
  ];

  Widget _numpadKeyBoard(String email, BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.end,
      direction: Axis.horizontal,
      runSpacing: 20,
      spacing: 40,
      children: <Widget>[
        for (var index = 0; index <= _lstNumpadKeyBoard.length - 1; index++)
          GestureDetector(
              onTap: () async {
                if (indexInputPin >=
                    (widget as OtpVerifyScreen).numberOfOtp - 1) {
                  return;
                }
                if (_lstNumpadKeyBoard[index] != 'none' &&
                    _lstNumpadKeyBoard[index] != 'clear') {
                  indexInputPin++;
                  _lstCounter[indexInputPin].value = _lstNumpadKeyBoard[index];
                }
                // Verify code
                if (indexInputPin >=
                    (widget as OtpVerifyScreen).numberOfOtp - 1) {
                  final otp = await provider.getOTPString(_lstCounter);
                  provider.doVerifyOTP(context, email, otp);
                  _clearOTPCode();
                }
              },
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.only(left: 30, right: 30),
                child: _lstNumpadKeyBoard[index] == "clear"
                    ? GestureDetector(
                        onTap: () {
                          if (indexInputPin <= -1) {
                            return;
                          }
                          _lstCounter[indexInputPin].value = '';
                          indexInputPin--;
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.only(top: 5),
                          child: AppImage.icClearKeyBoard,
                        ),
                      )
                    : Text(
                        _lstNumpadKeyBoard[index] == "none"
                            ? "  "
                            : _lstNumpadKeyBoard[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: SizeConfig.safeBlockHorizontal * 10,
                          fontFamily: AppTextStyles.tahomaFont,
                        ),
                      ),
              ))
      ],
    );
  }

  Widget _buildOTPInputRow() {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < (widget as OtpVerifyScreen).numberOfOtp; i++) {
      // Add spacer left
      if (i <= 0) {
        list.add(Spacer(
          flex: 3,
        ));
      }
      // Add OTP object
      ValueNotifier<String> _counter = ValueNotifier<String>('');
      _lstCounter.add(_counter);
      var otp = OtpContainer(value: '', counter: _counter);
      list.add(otp);
      // Add spacer right
      if (i >= (widget as OtpVerifyScreen).numberOfOtp - 1) {
        list.add(Spacer(
          flex: 3,
        ));
      } else {
        list.add(Spacer());
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: list,
    );
  }

  void _clearOTPCode() {
    for (var item in _lstCounter) {
      item.value = '';
    }
    indexInputPin = -1;
  }
}
