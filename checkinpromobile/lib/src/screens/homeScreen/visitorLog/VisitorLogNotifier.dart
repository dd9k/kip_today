import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/BaseListResponse.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/LogGroup.dart';
import 'package:checkinpromobile/src/model/VisitorLog.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/VisitorInviteNotifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../AppBarNotifier.dart';

class VisitorLogNotifier extends AppBarNotifier {
  static const String CHECK_IN_STATUS = "CheckedIn";
  static const String CHECK_OUT_STATUS = "CheckedOut";
  int selectedBarIndex = 0;

  List<VisitorLog> listVisitorLogIn = List();
  List<VisitorLog> listVisitorLogOut = List();
  List<LogGroup> logGroupIn = List();
  List<LogGroup> logGroupOut = List();

  int totalItemVisitorLogIn = Constants.MAX_INT;
  int pageIndexVisitorLogIn = 1;

  int totalItemVisitorLogOut = Constants.MAX_INT;
  int pageIndexVisitorLogOut = 1;
  var langSaved;

  RoundedLoadingButtonController btnTryAgainController =
      new RoundedLoadingButtonController();
  bool isLoadingIn = true;
  bool isGettingDataIn = false;

  bool isLoadingOut = true;
  bool isGettingDataOut = false;

  bool isFirstGetDataIn = true;
  bool isFirstGetDataOut = true;

  void updateTabBar(int index) {
    selectedBarIndex = index;
    notifyListeners();
  }

  void resetVisitorLogIn() {
    totalItemVisitorLogIn = Constants.MAX_INT;
    pageIndexVisitorLogIn = 1;
    isFirstGetDataIn = true;
    listVisitorLogIn.clear();
    logGroupIn.clear();
  }

  void resetVisitorLogOut() {
    totalItemVisitorLogOut = Constants.MAX_INT;
    pageIndexVisitorLogOut = 1;
    isFirstGetDataOut = true;
    listVisitorLogOut.clear();
    logGroupOut.clear();
  }

  void doTryAgainIn(BuildContext cx) {
    isLoadingIn = true;
    notifyListeners();
    resetVisitorLogIn();
    getAPIVisitorLogIn(callbackFn: () {
      btnTryAgainController.stop();
    });
  }

  void doTryAgainOut(BuildContext cx) {
    isLoadingOut = true;
    notifyListeners();
    resetVisitorLogOut();
    getAPIVisitorLogOut(callbackFn: () {
      btnTryAgainController.stop();
    });
  }

  Future getAPIVisitorLogIn({Function callbackFn}) async {
    if (isGettingDataIn) {
      return;
    }
    isGettingDataIn = true;
    // If full list
    if (totalItemVisitorLogIn <= listVisitorLogIn.length) {
      isLoadingIn = false;
      isGettingDataIn = false;
      notifyListeners();
      // Callback
      if (callbackFn != null) {
        callbackFn();
      }
      return;
    }
    ApiCallBack callBack =
        ApiCallBack((BaseListResponse baseListResponse) async {
      totalItemVisitorLogIn = baseListResponse.totalCount; // Get total
      final lst = (baseListResponse.data ?? [])
          .map((Map model) => VisitorLog.fromJson(model))
          .toList();
      if (isFirstGetDataIn) {
        isFirstGetDataIn = false;
        await db.myVisitorLogDAO.deleteAllsSignIn();
      }
      if (lst.length > 0) {
        pageIndexVisitorLogIn = pageIndexVisitorLogIn + 1;
        // Save list to local DB
        _saveVisitorLogToDBLocal(lst);
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      langSaved =
          prefs.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
      var listTemp = locator<Utilities>()
          .createGroupLogWithLog(context, langSaved, logGroupIn, lst, false);
      logGroupIn = listTemp;
      // Combine two list
      listVisitorLogIn =
          locator<Utilities>().combineTwoList(listVisitorLogIn, lst);
      isLoadingIn = false;
      isGettingDataIn = false;
      notifyListeners();
      // Callback
      if (callbackFn != null) {
        callbackFn();
      }
    }, (Errors message) async {
      if (message.code != -2) {}
      // No internet connect
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        final lst =
            await db.myVisitorLogDAO.getAlls(pageIndexVisitorLogIn - 1, true) ??
                [];
        if (lst.length > 0) {
          pageIndexVisitorLogIn = pageIndexVisitorLogIn + 1;
        }
        SharedPreferences prefs = await SharedPreferences.getInstance();
        langSaved =
            prefs.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
        var listTemp = locator<Utilities>()
            .createGroupLogWithLog(context, langSaved, logGroupIn, lst, false);
        logGroupIn = listTemp;
        listVisitorLogIn =
            locator<Utilities>().combineTwoList(listVisitorLogIn, lst);
        isLoadingIn = false;
        isGettingDataIn = false;
        notifyListeners();
        // Callback
        if (callbackFn != null) {
          callbackFn();
        }
      } else {
        isLoadingIn = false;
        isGettingDataIn = false;
        notifyListeners();
      }
    });
    // Request API
    await ApiRequest().requestSearchVisitorLog(context, pageIndexVisitorLogIn,
        Constants.PAGE_MAX_SIZE, true, callBack);
  }

  Future getAPIVisitorLogOut(
      {Function callbackFn}) async {
    if (isGettingDataOut) {
      return;
    }
    isGettingDataOut = true;
    // If full list
    if (totalItemVisitorLogOut <= listVisitorLogOut.length) {
      isLoadingOut = false;
      isGettingDataOut = false;
      notifyListeners();
      // Callback
      if (callbackFn != null) {
        callbackFn();
      }
      return;
    }
    ApiCallBack callBack =
        ApiCallBack((BaseListResponse baseListResponse) async {
      totalItemVisitorLogOut = baseListResponse.totalCount; // Get total
      final lst = (baseListResponse.data ?? [])
          .map((Map model) => VisitorLog.fromJson(model))
          .toList();
      if (isFirstGetDataOut) {
        isFirstGetDataOut = false;
        await db.myVisitorLogDAO.deleteAllsSignOut();
      }
      if (lst.length > 0) {
        pageIndexVisitorLogOut = pageIndexVisitorLogOut + 1;
        _saveVisitorLogToDBLocal(lst);
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      langSaved =
          prefs.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
      var listTemp = locator<Utilities>()
          .createGroupLogWithLog(context, langSaved, logGroupOut, lst, false);
      logGroupOut = listTemp;
      // Combine two list
      listVisitorLogOut =
          locator<Utilities>().combineTwoList(listVisitorLogOut, lst);
      isLoadingOut = false;
      isGettingDataOut = false;
      notifyListeners();
      // Callback
      if (callbackFn != null) {
        callbackFn();
      }
    }, (Errors message) async {
      if (message.code != -2) {}
      // No internet connect
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        final lst = await db.myVisitorLogDAO
                .getAlls(pageIndexVisitorLogOut - 1, false) ??
            [];
        if (lst.length > 0) {
          pageIndexVisitorLogOut = pageIndexVisitorLogOut + 1;
        }
        SharedPreferences prefs = await SharedPreferences.getInstance();
        langSaved =
            prefs.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
        var listTemp = locator<Utilities>()
            .createGroupLogWithLog(context, langSaved, logGroupOut, lst, false);
        logGroupOut = listTemp;
        // Combine two list
        listVisitorLogOut =
            locator<Utilities>().combineTwoList(listVisitorLogOut, lst);
        isLoadingOut = false;
        isGettingDataOut = false;
        notifyListeners();
        // Callback
        if (callbackFn != null) {
          callbackFn();
        }
      } else {
        isLoadingOut = false;
        isGettingDataOut = false;
        notifyListeners();
      }
    });
    // Request API
    await ApiRequest().requestSearchVisitorLog(context, pageIndexVisitorLogOut,
        Constants.PAGE_MAX_SIZE, false, callBack);
  }

  Future<void> _saveVisitorLogToDBLocal(List<VisitorLog> lstItem) async {
    lstItem.forEach((item) {
      locator<Utilities>()
          .downloadFileImageByUrl(item.faceCaptureFile)
          .then((bytes) {
        // Save file image cover to local storge
        item.nameImgLocal =
        bytes == null ? '' : 'face_${item.id.toInt().toString()}.png';
        if (bytes != null) {
          locator<Utilities>().saveLocalFile(Constants.FOLDER_TEMP_VISITOR_LOG,
              item.nameImgLocal, null, bytes);
        }
        // Insert to db
        db.myVisitorLogDAO.insert(item);
      });
    });
  }

  @override
  String getTitle(BuildContext context) {
    return AppLocalizations.of(context).visitorLogTitle.toUpperCase();
  }

  @override
  String getSubTitle(BuildContext context) {
    // TODO: implement getSubTitle
    throw UnimplementedError();
  }

  @override
  void onClickLeft(BuildContext context) {
    Provider.of<VisitorInviteNotifier>(context, listen: false).onClickLeft(context);
  }

  @override
  void onClickRight(BuildContext context) {}
}
