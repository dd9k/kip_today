import 'package:flutter/material.dart';

import '../constants/AppColors.dart';
import '../constants/AppDestination.dart';

class BaseTheme {
  static final BaseTheme _singleton = BaseTheme._internal();

  factory BaseTheme() {
    return _singleton;
  }

  BaseTheme._internal();

  var baseDecoration = InputDecorationTheme(
      isDense: true,
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      fillColor: Colors.transparent,
      errorBorder: UnderlineInputBorder(
      ),
      border: UnderlineInputBorder());
}
