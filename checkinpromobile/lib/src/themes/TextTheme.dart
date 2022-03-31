import 'package:checkinpromobile/src/themes/TextSize.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';

class AppTextTheme {
  static const montserratFont = "Montserrat";
  static const helveticaFont = "Helvetica";
  static const tahomaFont = "Tahoma";
  static const helveticaFontLight = "HelveticaLight";
  static const helveticaFontTraLight = "HelveticaTraLight";

  static TextTheme getBlueLightTextTheme() => TextTheme(
        ///Appbar style
        headline1: TextStyle(
            fontSize: TextSize.size16,
            fontWeight: FontWeight.w400,
            color: AppColors.TITLE_APPBAR_COLOR,
            fontFamily: helveticaFontLight,
            letterSpacing: 1,
            decoration: TextDecoration.none),

        /// labelAppBar Tahoma
        headline2: TextStyle(
          fontSize: TextSize.size16,
          color: AppColors.MAIN_TEXT_COLOR,
          fontFamily: helveticaFont,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
        ),

        /// title Dashboard
        headline3: TextStyle(
          fontSize: TextSize.size14,
          color: AppColors.LIGHT_GREY_TEXT,
          fontFamily: helveticaFontLight,
          fontWeight: FontWeight.w300,
          decoration: TextDecoration.none,
        ),

        /// title time
        headline4: TextStyle(
          fontFamily: helveticaFontLight,
          fontSize: TextSize.size14,
          color: AppColors.BG_COLOR_DARK,
        ),

        /// subtitle ItemSetting
        headline5: TextStyle(
          fontSize: TextSize.size16,
          fontFamily: helveticaFontLight,
          color: AppColors.BLACK_TEXT_COLOR,
          decoration: TextDecoration.none,
        ),

        ///Subtitle Card
        headline6: TextStyle(
          fontFamily: helveticaFontLight,
          fontSize: TextSize.size14,
          color: AppColors.MAIN_TEXT_COLOR,
        ),

        ///Time Card

        subtitle1: TextStyle(
          color: AppColors.NOCHECKIN_BUTTON_BG_COLOR,
          fontFamily: helveticaFontLight,
          fontWeight: FontWeight.w100,
          fontStyle: FontStyle.normal,
          fontSize: TextSize.size34,
        ),

        /// title day attendance
        subtitle2: TextStyle(
          fontSize: TextSize.size16,
          fontFamily: helveticaFontLight,
          color: AppColors.COLOR_HEAD_LIST,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none,
        ),

        ///time check in - out
        bodyText1: TextStyle(
          fontSize: TextSize.size15,
          color: AppColors.BLACK_TEXT_COLOR,
          fontFamily: helveticaFontLight,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
        ),

        ///Acctive accout
        bodyText2: TextStyle(
          color: AppColors.BLACK_TEXT_COLOR,
          fontFamily: helveticaFontLight,
          fontSize: TextSize.size15,
        ),

        ///item day Calendar
        button: TextStyle(
          color: AppColors.BLACK_TEXT_COLOR,
          fontSize: TextSize.size18,
        ),

        ///TextField Domain
        caption: TextStyle(
          fontFamily: helveticaFontLight,
          fontSize: TextSize.size16,
          color: AppColors.BLUE_COLOR,
        ),

        overline: TextStyle(
          fontSize: TextSize.size14,
          color: AppColors.BLUE_COLOR,
          fontFamily: helveticaFontLight,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.none,
        ),
      );
  static TextTheme getBlueDarkTextTheme() => TextTheme(
        ///Appbar style
        headline1: TextStyle(
          fontSize: TextSize.size16,
          fontWeight: FontWeight.w400,
          color: AppColors.TITLE_APPBAR_COLOR,
          letterSpacing: 1,
          fontFamily: helveticaFontLight,
          decoration: TextDecoration.none,
        ),

        /// labelAppBar Tahoma
        headline2: TextStyle(
          fontSize: TextSize.size16,
          color: AppColors.MAIN_TEXT_COLOR_DARK,
          fontFamily: helveticaFontLight,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
        ),

        /// title DashBoard
        headline3: TextStyle(
          fontSize: TextSize.size14,
          color: AppColors.TEXT_COLOR_DARK,
          fontWeight: FontWeight.w300,
          fontFamily: helveticaFontLight,
          decoration: TextDecoration.none,
        ),

        /// title time
        headline4: TextStyle(
          fontFamily: helveticaFontLight,
          fontSize: TextSize.size14,
          color: AppColors.BG_COLOR_LIGHT,
        ),

        ///Subtitle Setting
        headline5: TextStyle(
          fontSize: TextSize.size16,
          fontFamily: helveticaFontLight,
          color: AppColors.MAIN_TEXT_COLOR_DARK,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.none,
        ),

        ///Subtitle Card
        headline6: TextStyle(
          fontFamily: helveticaFontLight,
          fontSize: TextSize.size14,
          color: AppColors.MAIN_TEXT_COLOR_DARK,
        ),

        ///Time Card
        subtitle1: TextStyle(
          color: AppColors.NOCHECKIN_BUTTON_BG_COLOR_DARK,
          fontFamily: helveticaFontLight,
          //fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: TextSize.size28,
        ),

        /// title day attendance
        subtitle2: TextStyle(
          fontSize: TextSize.size16,
          fontFamily: helveticaFontLight,
          color: AppColors.BACKGROUND_MAIN,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none,
        ),

        ///time check in - out
        bodyText1: TextStyle(
          fontSize: TextSize.size15,
          color: AppColors.BACKGROUND_MAIN,
          fontFamily: helveticaFontLight,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
        ),

        /// Acctive account
        bodyText2: TextStyle(
          color: Colors.white,
          fontFamily: helveticaFontLight,
          fontSize: TextSize.size15,
        ),

        ///item day Calendar
        button: TextStyle(
          color: Colors.white,
          fontSize: TextSize.size18,
        ),

        ///TextField Domain
        caption: TextStyle(
          fontFamily: helveticaFontLight,
          fontSize: TextSize.size16,
          color: AppColors.BACKGROUND_MAIN,
        ),
        overline: TextStyle(
          fontSize: TextSize.size14,
          color: AppColors.BACKGROUND_MAIN,
          fontFamily: helveticaFontLight,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.none,
        ),
      );
}
