import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class AppColors {
  static const BASE_LOADING = Color(0xFFC7CAD1);
  static const HIGHLIGHT_LOADING = Color(0xFFAFB2BB);
  static const BACKGROUND_LOADING = Color(0xFFEDEEF0);
  static const TAB_SELECTED = Color(0xFF0359D4);
  static const LINE_COLOR = Color(0xFFdbdbdb);
  static const BACKGROUND_MAIN = Color(0xFFFFFFFF);
  static const BACKGROUND_MAIN2 = Color(0xFFF6F4FA);
  static const COLOR_HEAD_LIST = Color(0xFF444348);
  static const COLOR_ARROW = Color(0xFFdadada);
  static const ROYAL_YELLOW = Color(0xFFECAD00);
  static const MAIN_TEXT_COLOR = Color(0xFF1F48A0);
  static const WHITE_LESS = Color(0xFFF9FDFF);
  static const TEXT_GRAY = Color(0xFFB8B8B8);
  static const GRAY_BOLD = Color(0xFFD8D8D8);
  static const GRAY = Color(0xFFEEEEEE);
  static const RED_COLOR = Color(0xFFC32B2B);
  static const RED_SUB_COLOR = Color(0xFFFAE6E7);
  static const BLACK_TEXT_COLOR = Color(0xFF000000);
  static const HINT_TEXT_COLOR = Color(0xFFB3B1B1);
  static const BLUE_COLOR = Color(0xFF1F48A0);
  //static const ICON_COLOR = Color(0XFF1F48A0);
  static const CHECKIN_BUTTON_BG_COLOR = Color(0xFF0B642E);
  static const CHECKOUT_BUTTON_BG_COLOR = Color(0xFFE7970D);
  static const NOCHECKIN_BUTTON_BG_COLOR = Color(0xFFD7D7D7);
  static const TEXT_FOOTER = Color(0xFF2c2c2c);
  static const APPBAR_BG_COLOR_DARK = Color(0xFF000000);
  static const APPBAR_BG_COLOR_LIGHT = Color(0xFFFFFFFF);
  static const BG_COLOR_LIGHT = Color(0xFFFFFFFF);
  static const BG_COLOR_DARK = Color(0xFF000000);
  static const CARD_COLOR_DARK = Color(0xFF121212);
  static const CONTAIENR_COLOR_DARK = Color(0xFF121212);
  static const CARD_COLOR_LIGHT = Color(0xFFf7fbff);
  static const MAIN_TEXT_COLOR_LIGHT = Color(0xFF1F48A0);
  static const MAIN_TEXT_COLOR_DARK = Color(0xFFFFFFFF);
  static const CHECKIN_BUTTON_BG_COLOR_DARK = Color(0xFFBFF5FF);
  static const CHECKOUT_BUTTON_BG_COLOR_DARK = Color(0xFFE7970D);
  static const NOCHECKIN_BUTTON_BG_COLOR_DARK = Color(0xFFD7D7D7);
  static const TIME_COLOR = Color(0xFF0ddb36);
  static const TEXT_COLOR_DARK = Color(0xFF666666);

  static const TITLE_APPBAR_COLOR = Color(0xFF006de2);

  static const LIGHT_GREY_TEXT = Color(0xFF828282);
  static const DARK_BLUE_TEXT = Color(0xFF0080f3);
  static const DARK_GREY_TEXT = Color(0xFFbababa);
  static const DISABLE_COLOR = Color(0xFFB4B4B4);
  static const DISABLE_COLOR_LESS = Color(0xFFF6F6F6);
  static const EMERGENCY_COLOR = Color(0xFFC32B2B);
  static const NORMAL_COLOR = Color(0xFF0080f3);
  static const PRIORITIZE_COLOR = Color(0xFFE7970D);

  static const linearGradient = LinearGradient(
    colors: const [Color(0xff046FDA), Color(0xff0359D4)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const linearGradientDisabled = LinearGradient(
    colors: const [Color(0xFFB4B4B4), Color(0xFF999999)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static ui.Gradient colorSelect = ui.Gradient.linear(
    Offset(4.0, 24.0),
    Offset(24.0, 4.0),
    [Colors.lightBlue[300], AppColors.MAIN_TEXT_COLOR],
  );

  static ui.Gradient colorUnselected = ui.Gradient.linear(
    Offset(4.0, 24.0),
    Offset(24.0, 4.0),
    [
      Colors.grey[200],
      Colors.grey,
    ],
  );

  static ui.Gradient colorIcon = ui.Gradient.linear(
    Offset(4.0, 24.0),
    Offset(24.0, 4.0),
    [Colors.greenAccent[200], Colors.blueAccent[200]],
  );

  static const linearGradientAppMain = LinearGradient(
    colors: const [Color(0xFF56CCF2), Color(0xFF2F80ED)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const linearHeaderSettingLight = LinearGradient(
      colors: [
        const Color(0xFF3366FF),
        const Color(0xFF00CCFF),
      ],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp);
  static const linearHeaderSettingDark = LinearGradient(
      colors: [
        const Color(0xFF000000),
        const Color(0xFF000000),
      ],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp);

  static const linearGradientBacktoFuture = LinearGradient(
      colors: [
        const Color(0xFF2193b0),
        const Color(0xFF6dd5ed),
      ],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp);

  static const linearHeaderSetting = LinearGradient(
      colors: [
        const Color(0xFF3366FF),
        const Color(0xFF00CCFF),
      ],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp);
}

extension MYContext on BuildContext {
  Color dynamicColor({int light, int dark}) {
    return (Theme.of(this).brightness == Brightness.light)
        ? Color(light)
        : Color(dark);
  }

  Color dynamicColour({Color light, Color dark}) {
    return (Theme.of(this).brightness == Brightness.light) ? light : dark;
  }

  /// the white background
  Color get bgMain => dynamicColor(light: 0xFFFFFFFF, dark: 0xFF000000);
  Color get bgIcon => dynamicColor(light: 0xff959595, dark: 0xFFFFFFFF);
  Color get bgSwapColor => dynamicColor(light: 0xFF000000, dark: 0xFFFFFFFF);
  Color get bgTemp => dynamicColor(light: 0xFF424242, dark: 0xFFFFFFFF);
  // termConditionPostfix AcctiEmail
  Color get termConditionPostfix =>
      dynamicColor(light: 0xFF1F48A0, dark: 0xFFF0BC92);
  Color get bgSliverAppBar => dynamicColor(light: 0xFFFFFFFF, dark: 0xFF000000);
  Color get bgTabBar => dynamicColor(light: 0xFF1F48A0, dark: 0xFF000000);
  Color get bgCard => dynamicColor(light: 0xFFf7fbff, dark: 0xFF121212);
  Color get bgQR => dynamicColor(light: 0xFFf7fbff, dark: 0xFFFFFFFF);
  Color get bgCardAttendance =>
      dynamicColor(light: 0xFFEDFAF4, dark: 0xFF202020);
  Color get bgTabbarBottom => dynamicColor(light: 0xFFFFFFFF, dark: 0xFF121212);
  Color get bgColorAppBarSetting =>
      dynamicColor(light: 0xFFf7fbff, dark: 0xFF121212);
  Color get bgColorEvent => dynamicColor(light: 0xFFC9DEF3, dark: 0xFF242424);
  Color get bgColorEventDetail =>
      dynamicColor(light: 0xFFE8E8E8, dark: 0xFF646464);
  Color get bgColorButton => dynamicColor(light: 0xFF1976d2, dark: 0xFF2B2C33);
  Color get bgColorlabelStyle =>
      dynamicColor(light: 0xFF1F48A0, dark: 0xFF828282);
  Color get bgColorNoCheckin =>
      dynamicColor(light: 0xFFFFF9F5, dark: 0xFF1D1C1C);
  Color get bgColorTextFieldPersonal =>
      dynamicColor(light: 0xFF1976d2, dark: 0xFFFFFFFF);
  Color get bgColorTextFieldPersonallabelColor =>
      dynamicColor(light: 0xFF575555, dark: 0xFF6D6A6A);
  Color get textColor => dynamicColor(light: 0xFF000000, dark: 0xFFFFFFFF);
  Color get formBorderColor =>
      dynamicColor(light: 0xFF006de2, dark: 0xFFFFFFFF);
  Color get isModeView => dynamicColor(light: 0xFFF6F6F6, dark: 0xFF1D1C1C);
  Color get isModeViewText => dynamicColor(light: 0xFF006de2, dark: 0xFFFFFFFF);
  Color get isModeViewDisable =>
      dynamicColor(light: 0xFFF6F6F6, dark: 0xFF121212);
  Color get bgDialog => dynamicColor(light: 0xFFF5F5F5, dark: 0xFF121212);
}
