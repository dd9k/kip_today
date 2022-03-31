import 'dart:convert';
import 'dart:isolate';
import 'package:async/async.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/UserInfor.dart';
import 'package:checkinpromobile/src/screens/AppBarNotifier.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/services/printService/PrinterModel.dart';
import 'package:checkinpromobile/src/services/printService/QLPrinterModel.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrinterNotifier extends AppBarNotifier {
  List<PrinterModel> devices = [];
  bool isLoading = true;

  //loading animation
  bool isReload = false;
  AsyncMemoizer<List<PrinterModel>> memCache = AsyncMemoizer();
  Isolate isolate;

  void reload() {
    isLoading = true;
    notifyListeners();
  }

  //call native printer
  Future<List<PrinterModel>> findAllPrinter(BuildContext context) async {
    return memCache.runOnce(() async {
      try {
        var listPrinter = await locator<Utilities>().findAllPrinter();
        devices.addAll(listPrinter);
        // dataTest();
      } catch (e) {
        Utilities().printLog("catch catch catch ${e.toString()}");
      }
      isLoading = false;
      notifyListeners();
      return devices;
    });
  }

  Future<void> printTest(
      BuildContext context, PrinterModel printerModel) async {
    var status = await printerModel.printTest();
    if (status != Constants.STATUS_SUCCESS) {
      Utilities().showErrorPop(context,
          printerModel.getErrorCodePrinter(context, status), null, null);
    }
  }

  Future<void> connectPrinter(BuildContext context, PrinterModel item) async {
    if (!item.isConnect) {
      await item.connectPrinter();
    } else {
      var preferences = await SharedPreferences.getInstance();
      preferences.setString(Constants.KEY_PRINTER, "");
    }
    devices.forEach((element) {
      if (element.ipAddress == item.ipAddress) {
        element.isConnect = !item.isConnect;
      } else {
        element.isConnect = false;
      }
    });
    isReload = !isReload;
    notifyListeners();
  }

  Future getUserInfor(BuildContext context, String type) async {
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      var preferences = await SharedPreferences.getInstance();
      var userInforString = JsonEncoder().convert(baseResponse.data);
      preferences.setString(Constants.KEY_USER_INFOR, userInforString);
      var userInfor = UserInfor.fromJson(baseResponse.data);
      var lang = userInfor?.companyLanguage?.elementAt(0)?.languageCode ??
          Constants.LANG_DEFAULT;
      if (!Constants.LIST_LANG.contains(lang)) {
        lang = Constants.EN_CODE;
      }
      preferences.setString(Constants.KEY_LANGUAGE, lang);
      await AppLocalizations.of(context).load(Locale(lang));
    }, (Errors message) {});

    var deviceInfor = await Utilities().getDeviceInfo();
    await ApiRequest()
        .requestUserInfor(context, deviceInfor.identifier, callBack);
  }

  @override
  String getSubTitle(BuildContext context) {
    // TODO: implement getSubTitle
    throw UnimplementedError();
  }

  @override
  String getTitle(BuildContext context) {
    return appLocalizations.printerTitle;
  }

  @override
  void onClickLeft(BuildContext context) {
    // TODO: implement onClickLeft
  }

  @override
  void onClickRight(BuildContext context) {
    if (isLoading) {
      return;
    }
    devices.clear();
    memCache = AsyncMemoizer();
    reload();
  }

  void dataTest() {
    QLPrinterModel model1 =
        QLPrinterModel('', '192.168.1.201', 'Brother QL-810W', true);
    QLPrinterModel model2 =
        QLPrinterModel('', '192.168.1.123', 'Brother QL-810W', true);
    QLPrinterModel model3 =
        QLPrinterModel('', '192.168.1.431', 'Brother QL-810W', true);
    QLPrinterModel model4 =
        QLPrinterModel('', '192.168.1.111', 'Brother QL-810W Wong', true);
    QLPrinterModel model5 =
        QLPrinterModel('', '192.168.1.333', 'Brother QL-810W', true);
    QLPrinterModel model6 =
        QLPrinterModel('', '192.168.1.241', 'Brother QL-810W', true);
    QLPrinterModel model7 =
        QLPrinterModel('', '192.168.1.642', 'Brother QL-810W', true);
    QLPrinterModel model8 =
        QLPrinterModel('', '192.168.1.12', 'Brother QL-810W', true);
    QLPrinterModel model9 =
        QLPrinterModel('', '192.168.1.34', 'Brother QL-810W', true);
    QLPrinterModel model10 =
        QLPrinterModel('', '192.168.1.17', 'Brother QL-810W', true);
    QLPrinterModel model11 =
        QLPrinterModel('', '192.168.1.54', 'Brother QL-810W', true);
    devices.addAll([
      model1,
      model2,
      model3,
      model4,
      model5,
      model6,
      model7,
      model8,
      model9,
      model10,
      model11
    ]);
  }
}
