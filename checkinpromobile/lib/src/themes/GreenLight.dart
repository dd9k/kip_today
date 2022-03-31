import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:flutter/material.dart';

import 'BaseTheme.dart';

final ThemeData greenLightTheme = _greenLightTheme().copyWith(
    inputDecorationTheme: BaseTheme().baseDecoration,
);

ThemeData _greenLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
      fontFamily: AppTextStyles.helveticaFont,
  );
}