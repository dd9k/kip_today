import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/BaseListResponse.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/screens/DetailHistoryVisitorLog/DetailHistoryVisitorLogScreen.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/model/Notification.dart' as notify;
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';

import '../AppBarNotifier.dart';

class NotificationNotifier extends AppBarNotifier {
  int selectedBarIndex = 0;

  List<notify.Notification> lstNotifications = List();

  int totalItem = Constants.MAX_INT;
  int pageIndex = 1;

  bool statusAllRead = false;

  bool isLoading = true;
  bool isDelete = false;
  bool isGettingData = false;
  bool isNoInternet = false;
  bool isLoadingNotification = false;

  RoundedLoadingButtonController btnTryAgainController =
      new RoundedLoadingButtonController();

  void updateTabBar(int index) {
    selectedBarIndex = index;
    notifyListeners();
  }

  bool isSelected(int index) => selectedBarIndex == index;

  void resetNotificationsData() {
    totalItem = Constants.MAX_INT;
    pageIndex = 1;
    lstNotifications.clear();
  }

  void doTryAgain(BuildContext cx) {
    isLoading = true;
    isNoInternet = false;
    notifyListeners();
    resetNotificationsData();
    getAPINotifications(cx, callbackFn: () {
      // btnTryAgainController.stop();
    });
  }

  Future getAPINotifications(BuildContext context,
      {Function callbackFn}) async {
    if (isGettingData) {
      return;
    }
    isNoInternet = false;
    isGettingData = true;
    // If full list
    if (totalItem <= lstNotifications.length) {
      isGettingData = false;
      isLoading = false;
      notifyListeners();
      callbackFn();
      return;
    }
    var deviceInfor = await utilities.getDeviceInfo();
    ApiCallBack callBack =
        ApiCallBack((BaseListResponse lstBaseResponse) async {
      pageIndex = pageIndex + 1;
      totalItem = lstBaseResponse.totalCount; // Get total
      final lst = lstBaseResponse.data
          .map((Map model) => notify.Notification.fromJson(model))
          .toList();
      lstNotifications =
          locator<Utilities>().combineTwoList(lstNotifications, lst);
      isLoading = false;
      isGettingData = false;
      notifyListeners();
      if (callbackFn != null) callbackFn();
    }, (Errors message) async {
      if (message.code != -2) {}
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        isNoInternet = true;
      }
      isLoading = false;
      isGettingData = false;
      notifyListeners();
    });
    return await ApiRequest().requestNotifications(context, callBack, pageIndex,
        Constants.PAGE_MAX_SIZE, deviceInfor.identifier);
  }

  Future checkIn(BuildContext context, double preRegisterId) async {
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {},
        (Errors message) async {
      if (message.code != -2) {}
    });
    return await ApiRequest()
        .requestVisitorCheckIn(context, preRegisterId, callBack);
  }

  Future checkOut(BuildContext context, double preRegisterId) async {
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {},
        (Errors message) async {
      if (message.code != -2) {}
    });
    return await ApiRequest()
        .requestVisitorCheckOut(context, preRegisterId, callBack);
  }

  @override
  String getTitle(BuildContext context) {
    return appLocalizations.notificationsTitle;
  }

  @override
  void onClickLeft(BuildContext context) {
    AppRouter.popWithArguments(
      context,
      arguments: {'isReloadNotification': isLoadingNotification},
    );
  }

  @override
  Future<void> onClickRight(BuildContext context) async {
    isLoadingNotification = true;
    var deviceInfor = await utilities.getDeviceInfo();
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      if (baseResponse.success == true) {
        // Update all notifications is read
        lstNotifications.forEach((el) {
          el.isRead = 1;
        });
        statusAllRead = !statusAllRead;
        notifyListeners();
      }
    }, (Errors message) async {
      locator<Utilities>().printLog(
          'Read all notifications message: ${message.code} - ${message.description}');
    });

    ApiRequest()
        .requestReadAllNotification(context, callBack, deviceInfor.identifier);
  }

  Future<void> updateStatusReadById(
      BuildContext cx, notify.Notification item, int status) async {
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      if (baseResponse.success == true) {
        // Update notification item is read
        item.isRead = status;
        statusAllRead = !statusAllRead;
        notifyListeners();
      }
    }, (Errors message) async {
      locator<Utilities>().printLog(
          'Read notification item message: ${message.code} - ${message.description}');
    });

    ApiRequest().requestReadByIdNotification(
        cx, callBack, item.identifierNotification, status);
  }

  Future<void> deleteNotificationById(
      BuildContext cx, notify.Notification item) async {
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      if (baseResponse.success == true) {
        // Update notification item is read
        lstNotifications.remove(item);
        isDelete = !isDelete;
        notifyListeners();
      }
    }, (Errors message) async {
      locator<Utilities>().printLog(
          'Read notification item message: ${message.code} - ${message.description}');
    });

    ApiRequest().requestDeleteByIdNotification(
        cx, callBack, item.identifierNotification);
  }

  @override
  String getSubTitle(BuildContext context) {
    // TODO: implement getSubTitle
    throw UnimplementedError();
  }
}
