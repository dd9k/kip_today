import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'AppColors.dart';

class AppStyles {
  static TextStyles textStyles;
  static AppColors colorStyles;
}

class TextStyles {
  static const montserratFont = "Montserrat";
  static const helveticaFont = "Helvetica";
  static const tahomaFont = "Tahoma";
  static const formFieldText = TextStyle(fontSize: 20, height: 1.25);
  TextStyle boldTextStyle(double size, Color color, {double height}) =>
      TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
        height: height,
      );

  TextStyle semiBoldTextStyle(double size, Color color, {double height}) =>
      TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: color,
        height: height,
      );

  TextStyle mediumTextStyle(double size, Color color, {double height}) =>
      TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w500,
        color: color,
        height: height,
      );

  TextStyle normalTextStyle(double size, Color color, {double height = 1.1}) =>
      TextStyle(
        fontSize: size,
        fontWeight: FontWeight.normal,
        color: color,
        height: height,
      );

  TextStyle lightTextStyle(double size, Color color, {double height}) =>
      TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w300,
        color: color,
        height: height,
      );

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
}
