import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/themes/TextTheme.dart';
import '../constants/AppColors.dart';
import 'BaseTheme.dart';

final ThemeData blueLightTheme = _blueLightTheme()
    .copyWith(inputDecorationTheme: BaseTheme().baseDecoration);

ThemeData _blueLightTheme() {
  return ThemeData(
    backgroundColor: AppColors.BG_COLOR_LIGHT,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    fontFamily: AppTextStyles.helveticaFont,
    scaffoldBackgroundColor: AppColors.BG_COLOR_LIGHT,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.RED_COLOR,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.APPBAR_BG_COLOR_LIGHT,
      iconTheme: IconThemeData(color: AppColors.MAIN_TEXT_COLOR),
      textTheme: AppTextTheme.getBlueLightTextTheme(),
    ),
    iconTheme: IconThemeData(
      color: AppColors.DARK_BLUE_TEXT, //_darkIconColor,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      elevation: 10,
      shape: CircularNotchedRectangle(),
      color: AppColors.BACKGROUND_MAIN,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.BLACK_TEXT_COLOR,
      unselectedLabelColor: AppColors.MAIN_TEXT_COLOR,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: AppColors.BACKGROUND_MAIN,
      ),
    ),
    textTheme: AppTextTheme.getBlueLightTextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.BLUE_COLOR,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.BLUE_COLOR,
        ),
      ),
      disabledBorder: InputBorder.none,
      border: OutlineInputBorder(),
    ),
  );
}
