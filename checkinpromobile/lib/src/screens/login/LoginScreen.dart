import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/screens/VerifyEmailForgotPass/VerifyEmailForgotPassScreen.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/FancyFab.dart';
import 'package:checkinpromobile/src/widgetUtilities/FooterContent.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:checkinpromobile/src/widgetUtilities/TextFieldCommon.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'LoginNotifier.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:checkinpromobile/src/screens/DomainPage/DomainScreen.dart';

class LoginScreen extends MainScreen {
  static const String route_name = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class _LoginScreenState extends MainScreenState<LoginNotifier>
    with WidgetsBindingObserver {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();
  GlobalKey<FormState> emailKey = GlobalKey();
  GlobalKey<FormState> passwordKey = GlobalKey();

  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics = false;
  List<BiometricType> _availableBiometrics = <BiometricType>[];
  // ignore: unused_field
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;
  String emailData = '';
  String fullName = '';
  int loginType = 1; // 1: Login mới - 2: Login đã lưu lại
  bool isInit = false;
  bool isShowPassword = false;

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    final isSettingBio =
        await provider.checkSettingKeyBiometricsInPreference() ?? false;
    if (!isSettingBio) {
      Utilities().showNoButtonDialog(
          context,
          DialogType.WARNING,
          3,
          appLocalizations.notifyTitle,
          appLocalizations.notYetConfigureBioContent,
          () {});
      return;
    }
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      var message = '';
      if (_availableBiometrics.length > 0) {
        switch (_availableBiometrics[0]) {
          case BiometricType.face:
            message = appLocalizations.messageFaceIDAlert;
            break;
          case BiometricType.fingerprint:
            message = appLocalizations.messageFingerprintAlert;
            break;
          case BiometricType.iris:
            message = appLocalizations.messageFaceIDAlert;
            break;
          default:
        }
      }
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: message, useErrorDialogs: true, stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      _isAuthenticating = false;
      _authorized = 'Authenticating';
      locator<Utilities>().printLog('$e');
      if (e.code == auth_error.lockedOut) {
        locator<Utilities>().showNoButtonDialog(context, DialogType.WARNING, 5,
            appLocalizations.notifyTitle, e.message, () {});
      }
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
    if (authenticated) {
      provider.authenticateLogin(context, emailController, passwordController);
    }
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  Widget _getIconBiometric() {
    if (_availableBiometrics.length <= 0) {
      return null;
    }
    switch (_availableBiometrics[0]) {
      case BiometricType.face:
        return Padding(
            padding: EdgeInsets.only(left: 10),
            child: Image.asset(
              'assets/images/ic_face_biometric.png',
              width: 50,
              height: 50,
              color: AppColors.DARK_BLUE_TEXT,
            ));
      case BiometricType.fingerprint:
        return Icon(
          Icons.fingerprint_outlined,
          size: 50,
        );
      case BiometricType.iris:
        return Icon(
          Icons.fingerprint_outlined,
          size: 50,
        );
      default:
        return null;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _checkBiometrics();
    _getAvailableBiometrics();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        provider.isShowFAB = !visible;
      },
    );
    provider.initURL();
    provider.utilities.timeoutToResetApp?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Map<String, Object> receivedData =
        ModalRoute.of(context).settings.arguments;
    if (receivedData != null) {
      emailData = receivedData['email'] ?? '';
      fullName = receivedData['fullName'] ?? '';
      loginType = receivedData['loginType'] ?? 1;
      if (emailData.isNotEmpty && !isInit) {
        isInit = true;
        emailController.value = TextEditingValue(text: emailData);
      }
    }
    int sizeRender = 70;
    return Selector<LoginNotifier, bool>(
        builder: (context, data, child) {
          return AbsorbPointer(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Selector<LoginNotifier, bool>(
                    builder: (context, data, child) {
                      return GestureDetector(
                        onTap: () {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        },
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                SingleChildScrollView(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    _buildHeader(),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    if (loginType == 1)
                                      _buildTextFiledRow(
                                          appLocalizations.email,
                                          appLocalizations.hintLoginEmail,
                                          (provider.errorEmail == null ||
                                                  provider.errorEmail.isEmpty)
                                              ? null
                                              : provider.errorEmail,
                                          emailController,
                                          false,
                                          false,
                                          emailFocusNode,
                                          sizeRender,
                                          emailKey, () {
                                        emailFocusNode.unfocus();
                                        FocusScope.of(context)
                                            .requestFocus(passFocusNode);
                                      })
                                    else
                                      _builderWelcomeAccount(),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    _buildTextFiledRow(
                                        appLocalizations.password,
                                        appLocalizations.hintLoginPassword,
                                        (provider.errorPass == null ||
                                                provider.errorPass.isEmpty)
                                            ? null
                                            : provider.errorPass,
                                        passwordController,
                                        isShowPassword,
                                        true,
                                        passFocusNode,
                                        sizeRender,
                                        passwordKey, () {
                                      passFocusNode.unfocus();
                                    }),
                                    if (loginType == 1)
                                      Container(
                                        padding: EdgeInsets.only(right: 30),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: _forgotPasswordRow(),
                                        ),
                                      ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    _buildButtonLogin(),
                                    if (loginType == 1)
                                      _activeEmailRow()
                                    else
                                      _buildClearAccountButton()
                                  ],
                                )),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: FooterContent(),
                                )
                              ],
                            ),
                            if (loginType == 1)
                              GestureDetector(
                                onTap: () => AppRouter.pushTo(
                                    context, DomainScreen.route_name),
                                child: Container(
                                  width: 70,
                                  padding: EdgeInsets.only(
                                      left: 0, top: 40, bottom: 40),
                                  child: AppImage.backBtn,
                                ),
                              ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Align(
                                child: FancyFab(
                                  provider: provider,
                                ),
                                alignment: Alignment.bottomRight,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    selector: (buildContext, provider) =>
                        provider.isUpdateLang),
              ),
              absorbing: data);
        },
        selector: (buildContext, provider) => provider.isLoading);
  }

  Widget _buildHeader() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          top: 100,
        ),
        child: Theme.of(context).brightness == Brightness.light
            ? AppImage.checkinProBlue
            : AppImage.checkinProWhite,
      ),
    );
  }

  Widget _builderWelcomeAccount() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            appLocalizations.welcomeLoginTitle,
            style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            (fullName != null && fullName.isNotEmpty) ? fullName : "Unit Corp",
            style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            (emailData != null && emailData.isNotEmpty)
                ? emailData
                : "email-demo-test@abc.com.vn",
            style: TextStyle(
              color: Colors.grey,
              fontFamily: AppTextStyles.tahomaFont,
              fontSize: AdaptiveTextSize()
                  .getadaptiveTextSize(context, multiplier: 1.85),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClearAccountButton() {
    return GestureDetector(
      onTap: () {
        provider.doClearAccountData(context);
      },
      child: RichText(
        text: new TextSpan(
          children: [
            new TextSpan(
              text: appLocalizations.clearAccountTitle,
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontStyle: FontStyle.italic, color: AppColors.DARK_BLUE_TEXT),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonLogin() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _buildBtnNext(),
                ),
              ],
            ),
          ),
          Visibility(
            visible: _canCheckBiometrics,
            child: GestureDetector(
              onTap: () {
                _isAuthenticating ? _cancelAuthentication() : _authenticate();
              },
              child: Padding(
                padding: EdgeInsets.only(right: 30),
                child: Container(
                  width: _availableBiometrics.length <= 0 ? 0 : 50,
                  height: 50,
                  child: _getIconBiometric(),
                ),
              ),
            ),
          )
        ]);
  }

  Widget _forgotPasswordRow() {
    return GestureDetector(
      onTap: () {
        AppRouter.pushTo(context, VerifyEmailForgotPassScreen.route_name);
      },
      child: Text(
        appLocalizations.buttonForgotPasswordText,
        style: Theme.of(context).textTheme.headline3.copyWith(
              fontStyle: FontStyle.italic,
              fontSize: 12,
              color: AppColors.DARK_BLUE_TEXT,
            ),
      ),
    );
  }

  Widget _activeEmailRow() {
    return GestureDetector(
      onTap: () {
        provider.gotoActiveEmailScreen(context);
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '${appLocalizations.notYetActiveAccount} ',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            TextSpan(
              text: appLocalizations.activeAccountPostfix,
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: AppColors.DARK_BLUE_TEXT,
                  ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  provider.gotoActiveEmailScreen(context);
                },
            ),
          ],
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
      bool isPasswordType,
      FocusNode focusNode,
      int sizeRender,
      Key key,
      Function onComplete) {
    return Container(
      child: Form(
          key: key,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextFieldCommon(
                inputlength: 100,
                hint: hint,
                isPassword: !isPasswordType || isPassword ? false : true,
                controller: controller,
                errorText: errorText,
                focusNode: focusNode,
                onComplete: onComplete,
                suffixIcon: isPasswordType
                    ? IconButton(
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
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                      )
                    : null),
          )),
    );
  }

  Widget _buildBtnNext() {
    return Container(
      padding: EdgeInsets.only(
          top: 20, left: 30, right: !_canCheckBiometrics ? 30 : 0),
      child: RaisedGradientButton(
        isLoading: true,
        btnController: provider.btnController,
        height: 40,
        disable: provider.isLoading,
        btnText: appLocalizations.signIn,
        btnTextSize:
            AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
        onPressed: () {
          provider.utilities.hideKeyBoard(context);
          if (!provider.isLoginByBio) {
            provider.doLogin(
                context, emailController.text, passwordController.text);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
