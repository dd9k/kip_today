import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/AttendanceGroup.dart';
import 'package:checkinpromobile/src/model/AttendanceGroupResult.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../AppBarNotifier.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/model/AttendanceDetailResponse.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/BaseListResponse.dart';

class TabItemAttendance {
  String title;
  bool isLoaded;
  List<AttendanceGroup> data;

  TabItemAttendance(this.title, this.isLoaded);
}

class AttendanceNotifier extends AppBarNotifier {
  bool isLoading = true;
  bool isLoadingEvent = true;
  bool isLoadingExToday = true;
  bool isLoadingMyVisitor = true;
  TabController tabController;
  List<AttendanceGroupResult> attendanceGroupResult = List();
  RoundedLoadingButtonController btnTryAgainController =
      new RoundedLoadingButtonController();

  List<AttendanceGroup> items = List();
  final List<TabItemAttendance> tabItem = List();

  @override
  String getSubTitle(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  String getTitle(BuildContext context) {
    return AppLocalizations.of(context).attendanceTitle.toUpperCase();
  }

  @override
  void onClickLeft(BuildContext context) {}

  @override
  void onClickRight(BuildContext context) {}

  void resetLoadData(int tabIndex) {
    tabItem[tabIndex].isLoaded = false;
    tabItem[tabIndex].data = null;
  }

  void doTryAgain(BuildContext cx, String itemDateSelect, int tabIndex) {
    resetLoadData(tabIndex);
    postAttendanceDetail(cx, itemDateSelect, tabIndex, callbackFn: () {
      btnTryAgainController.stop();
    });
  }

  Future postAttendanceDetail(BuildContext context, String item, int tabIndex,
      {Function callbackFn}) async {
    if (tabItem[tabIndex].isLoaded && tabItem[tabIndex].data != null) {
      items = tabItem[tabIndex].data;
      notifyListeners();
      return;
    }
    DateTime dateTime = DateTime.parse(item);
    isLoading = true;
    notifyListeners();
    ApiCallBack callBack =
        ApiCallBack((BaseListResponse baseListResponse) async {
      final lst = baseListResponse.data
          .map((Map model) => AttendanceDetail.fromJson(model))
          .toList();
      var langSaved = parent.preferences.getString(Constants.KEY_LANGUAGE) ??
          Constants.LANG_DEFAULT;
      if (tabIndex > attendanceGroupResult.length - 1) {}
      attendanceGroupResult[tabIndex] =
          (utilities.createGroupAttendanceWithLog(this.context, langSaved, lst));
      if (tabIndex > attendanceGroupResult.length - 1) {
        return;
      }
      attendanceGroupResult[tabIndex] =
          (utilities.createGroupAttendanceWithLog(this.context, langSaved, lst));
      items = attendanceGroupResult[tabIndex].logGroupList;
      tabItem[tabIndex].data = items;
      // Update biến để lần sau không load data lại tab đã chọn
      tabItem[tabIndex].isLoaded = true;
      // Insert list data to local DB
      db.attendanceDetailDAO.deleteAllsByDate(dateTime).then((_) {
        db.attendanceDetailDAO.insertAlls(lst);
      });
      isLoading = false;
      notifyListeners();
    }, (Errors message) async {
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        var lst = await db.attendanceDetailDAO.getAlls(dateTime) ?? [];
        var langSaved = parent.preferences.getString(Constants.KEY_LANGUAGE) ??
            Constants.LANG_DEFAULT;
        attendanceGroupResult.add(
            utilities.createGroupAttendanceWithLog(context, langSaved, lst));
        items = attendanceGroupResult[tabIndex].logGroupList;
        tabItem[tabIndex].data = items;
        // Update biến để lần sau không load data lại tab đã chọn
        tabItem[tabIndex].isLoaded = true;
      }
      isLoading = false;
      notifyListeners();
      //handler show error
    });
    await ApiRequest().requestPostAttendanceDetail(context, dateTime, callBack);
  }
}
