import 'package:checkinpromobile/src/screens/MainNotifier.dart';
import 'package:flutter/material.dart';

abstract class AppBarNotifier extends MainNotifier {
  String getTitle(BuildContext context);

  String getSubTitle(BuildContext context);

  void onClickRight(BuildContext context);

  void onClickLeft(BuildContext context);

}
