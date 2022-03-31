import 'BlueDark.dart';
import 'BlueLight.dart';
import 'GreenDark.dart';
import 'GreenLight.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';

enum AppTheme {
  GreenLight,
  GreenDark,
  BlueLight,
  BlueDark,
}

final appThemeData = {
  AppTheme.GreenLight: greenLightTheme,
  AppTheme.GreenDark: greenDarkTheme,
  AppTheme.BlueLight: blueLightTheme,
  AppTheme.BlueDark: blueDarkTheme,
};

class ThemeChanger with ChangeNotifier {
  var _themeMode =
      Utilities().localIndexThemes == 0 ? ThemeMode.light : ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;
  void setTheme(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
