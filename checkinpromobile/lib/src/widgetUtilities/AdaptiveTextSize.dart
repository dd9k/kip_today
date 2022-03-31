import 'package:flutter/cupertino.dart';

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, {double multiplier = 1.85}) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    return unitHeightValue * multiplier;
  }
}
