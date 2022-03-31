import 'package:checkinpromobile/src/model/DetailVisitorLog.dart';
import 'package:flutter/cupertino.dart';

class DetailInviteVisitorLogNotifier extends ChangeNotifier {
  bool isLoading = false;
  bool isDevMode = false;
  bool updateToggle = false;
  bool isShowFAB = true;
  bool isUpdateLang = false;
  List<String> errorText;
  bool isFabOpen = false;
  bool isTouchOutSide = false;
  int clickNumber = 0;
  bool isShowPass = false;
  DetailVisitorLog model = DetailVisitorLog();
}
