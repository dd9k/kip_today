import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/screens/DomainPage/DomainNotifier.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:checkinpromobile/src/widgetUtilities/FancyFab.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DomainScreen extends MainScreen {
  static const String route_name = '/domain-screen';

  @override
  DomainScreenHomePage createState() => DomainScreenHomePage();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class DomainScreenHomePage extends MainScreenState<DomainNotifier> {
  TextEditingController tfDomain = new TextEditingController();
  bool isFlagChanged = false;
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey();
  String domain = '';
  bool _isFirstInit = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isFirstInit = true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider.initURL();
  }

  void hideLangTitle() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      isFlagChanged = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tfDomain.dispose();
  }

  void getDomain() async {
    var preferences = await SharedPreferences.getInstance();
    tfDomain.value = TextEditingValue(
        text: preferences.getString(Constants.KEY_DOMAIN_STRING) ?? "");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_isFirstInit) {
      _isFirstInit = false;
      getDomain();
    }
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        key: scaffoldkey,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Selector<DomainNotifier, bool>(
            builder: (widget, data, child) {
              return Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Selector<DomainNotifier, bool>(
                          builder: (context, data, child) => Visibility(
                                visible: provider.isDevMode,
                                child: ToggleButtons(
                                  children: <Widget>[
                                    Text(
                                      "PRO",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AdaptiveTextSize()
                                              .getadaptiveTextSize(context)),
                                    ),
                                    Text(
                                      "VNG",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AdaptiveTextSize()
                                              .getadaptiveTextSize(context)),
                                    ),
                                    Text(
                                      "FPT",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AdaptiveTextSize()
                                              .getadaptiveTextSize(context)),
                                    ),
                                  ],
                                  isSelected: provider.selections,
                                  onPressed: (index) {
                                    provider.onToggleSelected(index);
                                  },
                                ),
                              ),
                          selector: (buildContext, provider) =>
                              provider.updateToggle),
                      GestureDetector(
                        onDoubleTap: () {
                          provider.onTapLogo();
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              0, 0, 0, MediaQuery.of(context).size.height / 20),
                          width: MediaQuery.of(context).size.width / 2,
                          height: 100,
                          child: Image(
                            image: Theme.of(context).brightness ==
                                    Brightness.light
                                ? AssetImage(
                                    "assets/images/2.0x/logo_company.png")
                                : AssetImage(
                                    "assets/images/checkinPro_blue_dark_mode.png"),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width / 12,
                                10,
                                MediaQuery.of(context).size.width / 12,
                                20),
                            child: Container(
                                child: Selector<DomainNotifier, String>(
                              builder: (context, data, child) {
                                return Form(
                                  key: _formKey,
                                  child: TextFormField(
                                    textAlign: TextAlign.end,
                                    textCapitalization: TextCapitalization.none,
                                    controller: tfDomain,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                    decoration: InputDecoration(
                                      errorText: data != null ? '' : data,
                                      errorMaxLines: 2,
                                      contentPadding: EdgeInsets.only(left: 20),
                                      border: OutlineInputBorder(),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: AppColors.RED_COLOR,
                                      )),
                                      labelStyle:
                                          Theme.of(context).textTheme.caption,
                                      errorStyle: TextStyle(
                                        fontFamily: AppTextStyles.tahomaFont,
                                        fontSize: AdaptiveTextSize()
                                            .getadaptiveTextSize(context,
                                                multiplier: 1.6),
                                      ),
                                      labelText: appLocalizations.domainTitle,
                                      suffixIcon: Container(
                                        alignment: Alignment.centerLeft,
                                        color: AppColors.DARK_BLUE_TEXT,
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          Constants.POSTFIX_DOMAIN,
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white),
                                        ),
                                      ),
                                      suffixIconConstraints: BoxConstraints(
                                          maxWidth: 150, minHeight: 60),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.DARK_BLUE_TEXT,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.DARK_BLUE_TEXT,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              selector: (context, provider) {
                                return provider.error;
                              },
                            )),
                          ),
                          Positioned(
                            top: 70,
                            left: MediaQuery.of(context).size.width / 12,
                            child: Selector<DomainNotifier, String>(
                              builder: (context, data, child) => Text(
                                data ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.RED_COLOR,
                                  fontFamily: AppTextStyles.tahomaFont,
                                  fontSize: AdaptiveTextSize()
                                      .getadaptiveTextSize(context,
                                          multiplier: 1.6),
                                ),
                              ),
                              selector: (context, provider) => provider.error,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                            color: context.bgColorButton,
                          ),
                        ),
                        minWidth: MediaQuery.of(context).size.width * 3 / 3.6,
                        height: 44,
                        color: AppColors.DARK_BLUE_TEXT,
                        onPressed: () {
                          if (!provider.isLoading) {
                            provider.validateDomain(context, tfDomain.text);
                          }
                        },
                        child: Text(
                          appLocalizations.activeButton,
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 130,
                      ),
                    ],
                  ),
                  Align(
                    child: FancyFab(
                      provider: provider,
                    ),
                    alignment: Alignment.bottomRight,
                  ),
                  Selector<DomainNotifier, bool>(
                    builder: (cx, data, child) {
                      return Visibility(
                        visible: data,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                    selector: (cx, provider) => provider.isLoading,
                  ),
                ],
              );
            },
            selector: (cx, provider) => provider.isUpdateLang,
          ),
        ),
      ),
    );
  }
}
