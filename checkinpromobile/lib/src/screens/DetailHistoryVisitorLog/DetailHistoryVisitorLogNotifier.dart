import 'dart:typed_data';

import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/DetailVisitorLog.dart';
import 'package:checkinpromobile/src/screens/AppBarNotifier.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:flutter/cupertino.dart';

class DetailHistoryVisitorLogNotifier extends ChangeNotifier {
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
  Uint8List coverPic;

  Future<void> loadCoverPic(String coverAvatarPath) async {
    if (coverAvatarPath == null || coverAvatarPath.isEmpty) {
      coverPic = null;
      return;
    }
    final file = await Utilities()
        .getLocalFile(Constants.FOLDER_TEMP_VISITOR_LOG, coverAvatarPath, null);
    coverPic = file?.readAsBytesSync();
    notifyListeners();
  }
}
