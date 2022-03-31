import 'package:async/async.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/ListLog.dart';
import 'package:checkinpromobile/src/model/VisitorLog.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:flutter/material.dart';

import '../../AppBarNotifier.dart';

class HistoryNotifier extends AppBarNotifier {
  List<VisitorLog> listExpected = List();
  AsyncMemoizer memCacheExpected = AsyncMemoizer();

  Future getExpected(BuildContext context, String timezone, int pageIndex,
      int pageSize) async {
    return memCacheExpected.runOnce(() async {
      List<VisitorLog> list = [
        VisitorLog.hard("Nguyễn Hồng Ngọc", "Công ty TNHH Prudental"),
        VisitorLog.hard("Nguyễn Hồng Ngọc", "Công ty TNHH Prudental")
      ];
      listExpected = list;
      ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
        var listLog = ListLog.fromJson(baseResponse.data);
      }, (Errors message) async {
        if (message.code != -2) {}
      });
//      return await ApiRequest()
//          .requestGetExpected(context, timezone, pageIndex, pageSize, callBack);
      return listExpected;
    });
  }

  @override
  String getTitle(BuildContext context) {
    return "History";
  }

  @override
  String getSubTitle(BuildContext context) {
    // TODO: implement getSubTitle
    throw UnimplementedError();
  }

  @override
  void onClickLeft(BuildContext context) {}

  @override
  void onClickRight(BuildContext context) {}
}
