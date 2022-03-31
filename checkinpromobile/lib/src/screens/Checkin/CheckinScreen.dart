import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/screens/Checkin/CheckinNotifier.dart';
import 'package:checkinpromobile/src/widgetUtilities/FooterContent.dart';
import 'package:checkinpromobile/src/widgetUtilities/RaisedGradientButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../MainScreen.dart';

class Checkinsreen extends MainScreen {
  static const String route_name = '/checkin';
  @override
  _CheckinsreenState createState() => _CheckinsreenState();

  @override
  String getNameScreen() {
    return route_name;
  }
}

class _CheckinsreenState extends MainScreenState<CheckinNotifier> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.BACKGROUND_MAIN,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: AppImage.icSuccess,
              ),
              Wrap(
                direction: Axis.vertical,
                spacing: 15,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    'Success!',
                    style: TextStyle(color: Colors.black, fontSize: 36),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Checkin successful.',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
          _buildBtnNext(provider),
          FooterContent()
        ],
      ),
    );
  }

  Widget _buildBtnNext(CheckinNotifier provider) {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 80,
      height: 50,
      child: RaisedGradientButton(
        isLoading: true,
        btnController: provider.btnController,
        disable: provider.isLoading,
        btnText: appLocalizations.activeButton,
        btnTextSize: SizeConfig.safeBlockHorizontal * 4,
        isEnable: true,
        onPressed: () {
          provider.utilities.hideKeyBoard(context);
          provider.btnController.stop();
        },
      ),
    );
  }
}
