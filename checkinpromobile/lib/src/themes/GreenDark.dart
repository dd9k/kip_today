import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:flutter/material.dart';

import 'BaseTheme.dart';

final ThemeData greenDarkTheme = _greenDarkTheme().copyWith(
  inputDecorationTheme: BaseTheme().baseDecoration
);

ThemeData _greenDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green[700],
      fontFamily: AppTextStyles.helveticaFont
  );
}