import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/screens/MainScreen.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/FooterContent.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SplashNotifier.dart';

class SplashScreen extends MainScreen {
  static const String route_name = '/';
  @override
  SplashScreenState createState() => SplashScreenState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class SplashScreenState extends MainScreenState<SplashNotifier> {
  bool isInit = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (!isInit) {
      isInit = true;
      provider.initURL();
      provider.countDownToNext(context);
      provider.refreshToken(this.context);
    }
    return Container(
        color: context.bgSliverAppBar,
        child: SafeArea(
          bottom: true,
          top: false,
          child: Scaffold(
            body: Container(
              //color: AppColors.BACKGROUND_MAIN,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Positioned(
                      child: Align(
                    alignment: Alignment.center,
                    child: Theme.of(context).brightness == Brightness.light
                        ? AppImage.logoCompany
                        : AppImage.checkinProWhite,
                  )),
                  Center(
                    child: Padding(
                        padding: EdgeInsets.only(top: 150),
                        child: Selector<SplashNotifier, bool>(
                          builder: (_, data, __) {
                            if (data) {
                              return CircularProgressIndicator();
                            } else {
                              return Container();
                            }
                          },
                          selector: (_, provider) => provider.isWaitingRequest,
                        )),
                  ),
                  FooterContent()
                ],
              ),
            ),
          ),
        ));
  }
}
