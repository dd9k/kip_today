import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:flutter/material.dart';
import '../constants/AppColors.dart';
import 'package:checkinpromobile/src/themes/TextTheme.dart';
import 'package:checkinpromobile/src/themes/TextSize.dart';

import 'BaseTheme.dart';

final ThemeData blueDarkTheme = _blueDarkTheme().copyWith(
  inputDecorationTheme: BaseTheme().baseDecoration,
);

ThemeData _blueDarkTheme() {
  return ThemeData(
    backgroundColor: AppColors.BG_COLOR_DARK,
    brightness: Brightness.dark,
    primaryColor: AppColors.MAIN_TEXT_COLOR,
    fontFamily: AppTextStyles.helveticaFont,
    scaffoldBackgroundColor: AppColors.BG_COLOR_DARK,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.RED_COLOR,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.APPBAR_BG_COLOR_DARK,
      iconTheme: IconThemeData(color: AppColors.BACKGROUND_MAIN),
      textTheme: AppTextTheme.getBlueDarkTextTheme(),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      elevation: 10,
      shape: CircularNotchedRectangle(),
      color: AppColors.TEXT_GRAY,
    ),
    //cardColor: AppColors.TEXT_GRAY,
    cardTheme: CardTheme(
      color: AppColors.CONTAIENR_COLOR_DARK,
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: AppColors.CARD_COLOR_DARK,
      ),
      unselectedLabelColor: AppColors.BLACK_TEXT_COLOR,
    ),
    iconTheme: IconThemeData(
      color: AppColors.BACKGROUND_MAIN, //_darkIconColor,
    ),
    textTheme: AppTextTheme.getBlueDarkTextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.BACKGROUND_MAIN,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.BACKGROUND_MAIN,
        ),
      ),
    ),
  );
}
