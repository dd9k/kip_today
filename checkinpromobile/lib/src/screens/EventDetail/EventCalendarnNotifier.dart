import 'package:flutter/material.dart';
import '../AppBarNotifier.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/model/AttendanceDetailResponse.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/BaseListResponse.dart';
import 'package:intl/intl.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';

class EventCalendarPageNotifier extends AppBarNotifier {
  String itemDateSelected = '';
  bool isLoading = true;
  RoundedLoadingButtonController btnTryAgainController =
      RoundedLoadingButtonController();

  final Map<DateTime, List> events = {};

  AttendanceDetail item;
  List<AttendanceDetail> items = List();

  @override
  String getSubTitle(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  String getTitle(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClickLeft(BuildContext context) {}

  @override
  void onClickRight(BuildContext context) {}

  Future postAttendanceDetail(BuildContext context, String dateString,
      {Function callback}) async {
    isLoading = true;
    notifyListeners();
    DateTime dateTime = DateTime.parse(dateString);

    ApiCallBack callBack =
        ApiCallBack((BaseListResponse baseListResponse) async {
      final lst = baseListResponse.data
          .map((Map model) => AttendanceDetail.fromJson(model))
          .toList();
      items = lst;
      events.clear();
      if (items.length <= 0) {
        isLoading = false;
        notifyListeners();
        return;
      }
      for (int i = 0; i < items.length; i++) {
        if (i + 1 <= DateTime.now().day ||
            dateTime.month < DateTime.now().month) {
          AttendanceDetail item = items[i];
          if (item.checkin != null &&
              item.checkin != '' &&
              item.checkout == null) {
            DateTime tempDate = DateFormat("yyyy-MM-dd").parse(item.checkin);
            events[tempDate] = [];
          }
        }
      }
      isLoading = false;
      notifyListeners();
      if (callback != null) {
        callback();
      }
    }, (Errors message) async {
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        final lst = await db.attendanceDetailDAO.getAlls(dateTime) ?? [];
        items = lst;
        events.clear();
        if (items.length <= 0) {
          isLoading = false;
          notifyListeners();
          return;
        }
        for (int i = 0; i < items.length; i++) {
          if (i + 1 <= DateTime.now().day ||
              dateTime.month < DateTime.now().month) {
            AttendanceDetail item = items[i];
            if (item.checkin != null &&
                item.checkin != '' &&
                item.checkout == null) {
              DateTime tempDate = DateFormat("yyyy-MM-dd").parse(item.checkin);
              events[tempDate] = [];
            }
          }
        }
        if (callback != null) {
          callback();
        }
      }
      isLoading = false;
      notifyListeners();
    });
    await ApiRequest().requestPostAttendanceDetail(context, dateTime, callBack);
  }

  void loadData(BuildContext context, {Function callback}) async {
    int t = DateTime.now().month;
    String i = '';
    if (t < 10) {
      i = '0';
    }
    itemDateSelected = '${DateTime.now().year}-$i${DateTime.now().month}-01';
    postAttendanceDetail(context, itemDateSelected, callback: callback);
  }
}
