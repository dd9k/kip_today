import 'package:async/async.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/screens/MainNotifier.dart';
import '../../../model/Chart.dart';

import 'package:checkinpromobile/src/model/BaseListResponse.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/model/AttendanceChart.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';

class ChartNotifier extends MainNotifier {
  bool isLoading = false;
  List<AttendanceChart> attendanceChart = List();
  List<ChartData> chartData = List();

  void getRandomChartData() {
    chartData.clear();
    if (attendanceChart.isNotEmpty) {
      for (int j = (DateTime.now().month - 6 < 0) ? 0 : DateTime.now().month - 6; j < DateTime.now().month; j++) {
        if (j < 4) {
          chartData.add(
            ChartData(
              x: attendanceChart[j].month == 1
                  ? appLocalizations.january
                  : attendanceChart[j].month == 2
                  ? appLocalizations.february
                  : attendanceChart[j].month == 3
                  ? appLocalizations.march
                  : appLocalizations.april,
              y: attendanceChart[j].workingTime,
            ),
          );
        } else if (j > 3 && j < 8) {
          chartData.add(
            ChartData(
              x: attendanceChart[j].month == 5
                  ? appLocalizations.may
                  : attendanceChart[j].month == 6
                  ? appLocalizations.june
                  : attendanceChart[j].month == 7
                  ? appLocalizations.july
                  : appLocalizations.august,
              y: attendanceChart[j].workingTime,
            ),
          );
        } else if (j > 7) {
          chartData.add(
            ChartData(
              x: attendanceChart[j].month == 9
                  ? appLocalizations.september
                  : attendanceChart[j].month == 10
                  ? appLocalizations.october
                  : attendanceChart[j].month == 11
                  ? appLocalizations.november
                  : appLocalizations.december,
              y: attendanceChart[j].workingTime,
            ),
          );
        }
      }
    }
  }

  Future getAttendanceChart(BuildContext context, AsyncMemoizer memCache) async {
    return memCache.runOnce(() async {
      isLoading = true;
      ApiCallBack callBack =
      ApiCallBack((BaseListResponse baseListResponse) async {
        final lst = baseListResponse.data
            .map((Map model) => AttendanceChart.fromJson(model))
            .toList();
        db.attendanceStatisticDAO.deleteAlls().then((_) {
          db.attendanceStatisticDAO.insertAlls(lst ?? []);
        });
        attendanceChart = lst;
        getRandomChartData();
        isLoading = false;
        notifyListeners();
      }, (Errors message) async {
        // No internet connection
        if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
          final lst = await db.attendanceStatisticDAO.getAlls();
          attendanceChart = lst;
          getRandomChartData();
        }
        isLoading = false;
        notifyListeners();
      });
      await ApiRequest().requestPostAttendanceChart(context, callBack);
      return 1;
    });
  }
}
