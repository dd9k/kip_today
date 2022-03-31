import 'dart:convert';
import 'dart:ui';

import 'package:checkinpromobile/src/constants/AppImage.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/IdEmployeeInfo.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:checkinpromobile/src/model/EmployeeInfo.dart';
import 'package:checkinpromobile/src/model/IntegrationSettingInfo.dart';
import '../../AppBarNotifier.dart';
import 'package:checkinpromobile/src/model/Authenticate.dart';

enum SwitchType {
  EMAIL,
  NOTIFICATION,
  SMS,
  VIBER,
  ZALO,
}

class ItemNotificationSwitch {
  String title;
  final String subtitle;
  final IconData icon;
  bool isSelect;
  SwitchType switchType;
  Image image;

  ItemNotificationSwitch({
    this.title,
    this.subtitle,
    this.icon,
    this.isSelect,
    this.switchType,
    this.image,
  });
}

class NotificationSettingNotifier extends AppBarNotifier {
  bool isNoInternet = false;
  bool isLoading = true;
  bool reloadSwitch = false;
  IdEmployeeInfo employeeInfoById;
  Authenticate authenProfileNotification;

  EmployeeInfo employee;
  List<ItemNotificationSwitch> items = List();
  RoundedLoadingButtonController btnTryAgainController =
      new RoundedLoadingButtonController();
  int email;
  int pushNotification;
  int viber;
  int zalo;
  String seviceName;
  int status;
  @override
  String getSubTitle(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  String getTitle(BuildContext context) {
    return appLocalizations.notificationSettingTitle;
  }

  @override
  void onClickLeft(BuildContext context) {}

  @override
  void onClickRight(BuildContext context) {}

  void doTryAgain(BuildContext cx) {}
  Future getSaveItems(BuildContext context) async {
    final data = parent.preferences.getString(Constants.KEY_AUTHENTICATE);
    authenProfileNotification =
        Authenticate.fromJson(JsonDecoder().convert(data));

    ///===========Email==================
    email = authenProfileNotification.employeeInfo.notificationInfo.pushEmail;

    ///===========Noti==================
    pushNotification = authenProfileNotification
        .employeeInfo.notificationInfo.pushNotification;

    ///===========Viber==================
    viber = authenProfileNotification.employeeInfo.notificationInfo.viber;

    ///===========Zalo==================
    zalo = authenProfileNotification.employeeInfo.notificationInfo.zalo;

    items = <ItemNotificationSwitch>[
      ItemNotificationSwitch(
        title: appLocalizations.email,
        subtitle: '',
        icon: Icons.mail_outline,
        isSelect:
            authenProfileNotification.employeeInfo.notificationInfo.pushEmail ==
                    1
                ? true
                : false,
        switchType: SwitchType.EMAIL,
      ),
      ItemNotificationSwitch(
        title: appLocalizations.hostNotification,
        subtitle: '',
        icon: Icons.notifications_active_outlined,
        isSelect: authenProfileNotification
                    .employeeInfo.notificationInfo.pushNotification ==
                1
            ? true
            : false,
        switchType: SwitchType.NOTIFICATION,
      ),
      ItemNotificationSwitch(
        title: 'SMS',
        subtitle: '',
        icon: Icons.comment_outlined,
        isSelect: false,
        switchType: SwitchType.SMS,
      ),
    ];
    // check add zalo and viber

    var itemViber = addItemViber(
        context,
        authenProfileNotification.employeeInfo.integrationSettingInfo.viber,
        authenProfileNotification.employeeInfo.notificationInfo.viber);
    if (itemViber != null) items.add(itemViber);

    var itemZalo = addItemZalo(
        context,
        authenProfileNotification.employeeInfo.integrationSettingInfo.zalo,
        authenProfileNotification.employeeInfo.notificationInfo.zalo);
    if (itemZalo != null) items.add(itemZalo);
    isLoading = false;
    notifyListeners();
  }

  Future<void> switchItem(
    BuildContext context,
    ItemNotificationSwitch item,
  ) async {
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      var authenticationString =
          JsonEncoder().convert(authenProfileNotification.toJson());
      isLoading = false;
      parent.preferences
          .setString(Constants.KEY_AUTHENTICATE, authenticationString);
      notifyListeners();
    }, (Errors message) {});
    switch (item.switchType) {
      case SwitchType.EMAIL:
        {
          item.isSelect = !item.isSelect;
          //preferences.setBool(Constants.KEY_NOTIFICATION_CONFIG, item.isSelect);
          authenProfileNotification.employeeInfo.notificationInfo.pushEmail =
              item.isSelect ? 1 : 0;
          break;
        }
      case SwitchType.NOTIFICATION:
        {
          //preferences.setBool(Constants.KEY_NOTIFICATION_CONFIG, item.isSelect);
          item.isSelect = !item.isSelect;
          authenProfileNotification.employeeInfo.notificationInfo
              .pushNotification = item.isSelect ? 1 : 0;
          break;
        }
      case SwitchType.VIBER:
        {
          //preferences.setBool(Constants.KEY_NOTIFICATION_CONFIG, item.isSelect);
          item.isSelect = !item.isSelect;
          authenProfileNotification.employeeInfo.notificationInfo.viber =
              item.isSelect ? 1 : 0;
          break;
        }
      case SwitchType.ZALO:
        {
          //preferences.setBool(Constants.KEY_NOTIFICATION_CONFIG, item.isSelect);
          item.isSelect = !item.isSelect;
          authenProfileNotification.employeeInfo.notificationInfo.zalo =
              item.isSelect ? 1 : 0;
          break;
        }
      default:
        {}
    }

    if (item.switchType == SwitchType.EMAIL) {
      email = (item.isSelect == false || item.isSelect == null) ? 0 : 1;
    } else if (item.switchType == SwitchType.NOTIFICATION) {
      pushNotification =
          (item.isSelect == false || item.isSelect == null) ? 0 : 1;
    } else if (item.switchType == SwitchType.VIBER) {
      seviceName = 'VIBER';
      viber = (item.isSelect == false || item.isSelect == null) ? 0 : 1;
      status = viber;
    } else if (item.switchType == SwitchType.ZALO) {
      seviceName = 'ZALO';
      zalo = (item.isSelect == false || item.isSelect == null) ? 0 : 1;
      status = zalo;
    } else {
      return;
    }

    await ApiRequest().requestUpdateNotification(
        context, email, pushNotification, viber, zalo, callBack);
    if (item.switchType == SwitchType.VIBER ||
        item.switchType == SwitchType.ZALO) {
      await ApiRequest()
          .requestUpdateNotiIntegration(context, seviceName, status, callBack);
    }
    reloadSwitch = !reloadSwitch;
    notifyListeners();
  }

  Future<void> switchItemZaLoViber(
    BuildContext context,
    ItemNotificationSwitch item,
  ) async {
    ApiCallBack callBack =
        ApiCallBack((BaseResponse baseResponse) async {}, (Errors message) {});
    switch (item.switchType) {
      case SwitchType.VIBER:
        {
          employeeInfoById.notificationInfo.viber = item.isSelect ? 1 : 0;
          break;
        }
      case SwitchType.ZALO:
        {
          employeeInfoById.notificationInfo.zalo = item.isSelect ? 1 : 0;
          break;
        }
      default:
        {}
    }

    if (item.switchType == SwitchType.VIBER) {
      seviceName = 'VIBER';
      status = 2;
    } else if (item.switchType == SwitchType.ZALO) {
      seviceName = 'ZALO';
      status = 2;
    } else {}
    await ApiRequest()
        .requestUpdateNotiIntegration(context, seviceName, status, callBack);
    reloadSwitch = !reloadSwitch;
    notifyListeners();
  }

  ItemNotificationSwitch addItemViber(
      BuildContext context, int viber, int select) {
    if (viber == 0) {
      return null;
    }
    return ItemNotificationSwitch(
      title: 'Viber',
      subtitle: 'viber',
      icon: Icons.notifications_active,
      isSelect: select == 1 ? true : false,
      switchType: SwitchType.VIBER,
      image: AppImage.viber,
    );
  }

  ItemNotificationSwitch addItemZalo(
      BuildContext context, int zalo, int select) {
    if (zalo == 0) {
      return null;
    }
    return ItemNotificationSwitch(
        title: 'Zalo',
        subtitle: 'zalo',
        icon: Icons.notifications_active,
        isSelect: select == 1 ? true : false,
        switchType: SwitchType.ZALO,
        image: AppImage.zalo);
  }

  Future launchURL() async {
    const url = Constants.URL_CONTACT;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
