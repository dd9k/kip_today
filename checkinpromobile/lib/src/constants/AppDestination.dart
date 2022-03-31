import 'package:flutter/material.dart';

import 'SizeConfig.dart';

class AppDestination {
  static const TEXT_SMALL = 13.0;
  static const TEXT_NORMAL = 16.0;
  static const TEXT_BIG = 20.0;
  static const TEXT_MORE_BIG = 25.0;
  static const TEXT_BIG_WEL = 30.0;

  double getSizeByScreen(
      BuildContext context, double percentPortrait, double percentLandscape) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    SizeConfig().init(context);
    return isPortrait
        ? SizeConfig.safeBlockVertical * percentPortrait
        : SizeConfig.safeBlockHorizontal * percentLandscape;
  }

  static const TEXT_SMALL_16 = 16.0;
  static const TEXT_SMALL_15 = 15.0;
  static const TEXT_SMALL_14 = 14.0;
  static const TEXT_SMALL_13 = 13.0;
  static const TEXT_SMALL_12 = 12.0;
  static const TEXT_SMALL_10 = 10.0;

  static const RADIUS_TEXT_INPUT = 70.0;
  static const RADIUS_SQUARED_TEXT_INPUT = 5.0;
  static const RADIUS_TEXT_INPUT_BIG = 70.0;
  static const PADDING_WAITING = 50.0;

  static const PADDING_MAIN_HORIZONTAL = 15.0;

  static const PADDING_TOP_LIST = 20.0;
  static const PADDING_BOTTOM_LIST = 40.0;
  static const PADDING_HORIZONTAL_LIST = 25.0;
  static const PADDING_BOTTOM_ITEM = 20.0;

  static const SIZE_HEADER_LIST = 17.0;
  static const SIZE_TITLE_ITEM = 14.0;
  static const SIZE_SUB_TITLE_ITEM = 13.0;
  static const SIZE_TIME_ITEM = 12.0;

  static const CARD_HEIGHT = 167.25;
  static const CARD_WIGHT = 231.25;

  static const CARD_HEIGHT_ESC = 250.0;
  static const CARD_WIGHT_ESC = 234.25;
}
