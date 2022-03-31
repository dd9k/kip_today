import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/CompanyLanguage.dart';
import 'package:checkinpromobile/src/screens/MainNotifier.dart';
import 'package:flutter/cupertino.dart';

class UtilityNotifier  extends MainNotifier {
  bool isFabOpen = false;
  bool isTouchOutSide = false;
  List<CompanyLanguage> listLang;
  var currentLang = Constants.EN_CODE;

  Future<void> updateLang(BuildContext context, String lang){
    return null;
  }
}