import 'package:checkinpromobile/src/widgetUtilities/AdaptiveTextSize.dart';
import 'package:flutter/material.dart';

import 'AppColors.dart';

abstract class AppTextStyles {
  static const montserratFont = "Montserrat";
  static const helveticaFont = "Helvetica";
  static const helveticaFontLight = "HelveticaLight";
  static const tahomaFont = "Tahoma";

  static TextStyle labelAppBar(BuildContext context) => TextStyle(
      fontSize:
          AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
      // color: Colors.white,
      color: AppColors.MAIN_TEXT_COLOR,
      fontFamily: tahomaFont,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);

  static const labelAppBarTahoma = TextStyle(
      fontSize: 16.0,
      // color: Colors.white,
      color: AppColors.MAIN_TEXT_COLOR,
      fontFamily: tahomaFont,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);

  static const subLabelAppBar = TextStyle(
      fontSize: 13.0,
      color: Colors.black,
      fontFamily: tahomaFont,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);

  static const subLabelAppBarTahoma = TextStyle(
      fontSize: 13.0,
      color: Colors.black,
      fontFamily: tahomaFont,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);

  static const textBottomBarSelected = TextStyle(
      fontSize: 15.0,
      color: Colors.black,
      fontFamily: tahomaFont,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static const textBottomBarNone = TextStyle(
      fontSize: 15.0,
      color: Colors.black54,
      fontFamily: tahomaFont,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static const textItemList = TextStyle(
      fontSize: 15.0,
      fontFamily: tahomaFont,
      color: Colors.black,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static const textItemBoldList = TextStyle(
      fontSize: 18.0,
      fontFamily: tahomaFont,
      color: Colors.black,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static const textItalicItemList = TextStyle(
      fontSize: 14.0,
      fontFamily: tahomaFont,
      color: Colors.black54,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.none);

  static const textSmallItemList = TextStyle(
      fontSize: 14.0,
      fontFamily: tahomaFont,
      color: Colors.black54,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static const textItemListGray = TextStyle(
      fontSize: 15.0,
      fontFamily: tahomaFont,
      color: Colors.black54,
      decoration: TextDecoration.none);

  static TextStyle headerListNone(BuildContext context) => TextStyle(
      fontSize:
          AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.9),
      fontFamily: tahomaFont,
      color: AppColors.COLOR_HEAD_LIST,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static TextStyle headerListTop(BuildContext context) => TextStyle(
      fontSize:
          AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.9),
      fontFamily: tahomaFont,
      color: AppColors.TAB_SELECTED,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static TextStyle textListSub(BuildContext context) => TextStyle(
      fontSize:
          AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
      fontFamily: AppTextStyles.tahomaFont,
      color: Colors.black87,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static TextStyle textListTime(BuildContext context) => TextStyle(
      fontSize:
          AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
      fontFamily: AppTextStyles.tahomaFont,
      color: Colors.black87,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  static TextStyle textListTitle(BuildContext context) => TextStyle(
      fontSize:
          AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.9),
      fontFamily: AppTextStyles.tahomaFont,
      color: Colors.black,
      fontWeight: FontWeight.w300,
      decoration: TextDecoration.none);

  static TextStyle textDashTitle(BuildContext context) => TextStyle(
      fontSize:
          AdaptiveTextSize().getadaptiveTextSize(context, multiplier: 1.85),
      fontFamily: AppTextStyles.tahomaFont,
      color: Colors.black,
      fontWeight: FontWeight.w300,
      decoration: TextDecoration.none);
}
