import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:flutter/cupertino.dart';
import '../../AppBarNotifier.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/screens/homeScreen/HomeScreen.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';

class ChangUiSettingsNotifier extends AppBarNotifier {
  int index = 0;
  int localIndex;
  String stringIndex;
  bool isLoading = false;
  @override
  String getSubTitle(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  String getTitle(BuildContext context) {
    return appLocalizations.changeUiContentTitle;
  }

  @override
  void onClickLeft(BuildContext context) {}

  @override
  void onClickRight(BuildContext context) {
    Utilities().showTwoButtonDialog(
      context,
      DialogType.QUESTION,
      null,
      appLocalizations.confirmNotifyTitle,
      appLocalizations.changeUiDialogTitle,
      appLocalizations.noTitle,
      appLocalizations.yesTitle,
      () {},
      () {
        AppRouter.pushTo(context, HomeScreen.route_name, isRemoveUntil: true);
        saveIndexChangeUI();
      },
    );
  }

  void saveIndexChangeUI() async {
    var preferences = await SharedPreferences.getInstance();
    stringIndex = index.toString();
    preferences.setString(Constants.KEY_CHANGE_UI, stringIndex);
  }

  Future<void> getIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading = true;
    String value = prefs.getString(Constants.KEY_CHANGE_UI) ?? "0";
    localIndex = int.parse(value);
    index = localIndex;
    isLoading = false;
    notifyListeners();
  }
}
