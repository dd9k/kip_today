import 'dart:convert';

import 'package:async/async.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/screens/AppBarNotifier.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/model/Authenticate.dart';

class ItemJobInfo {
  String title;
  String data;
  IconData icon;

  ItemJobInfo({this.title, this.data, this.icon});
}

class JobInfoNotifier extends AppBarNotifier {
  List<TextEditingController> listController = List();
  List<FocusNode> listFocus = List();
  List<ItemJobInfo> items = List();
  List<GlobalKey<FormState>> listKey = List();
  AsyncMemoizer<List<ItemJobInfo>> memCacheList = AsyncMemoizer();
  bool isEdit = false;
  bool isLoading = false;
  Authenticate authenJobInfo;

  Future<List<String>> getList(BuildContext context) {}

  @override
  String getTitle(BuildContext context) {
    return appLocalizations.jobInfoTitle;
  }

  @override
  String getSubTitle(BuildContext context) {
    return null;
  }

  @override
  void onClickLeft(BuildContext context) {}

  @override
  void onClickRight(BuildContext context) {
    if (isEdit) {
      utilities.hideKeyBoard(context);
      isEdit = false;
    } else {
      isEdit = true;
    }
    notifyListeners();
  }

  Future<Authenticate> getEmployeeInfo(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    final data = parent.preferences.getString(Constants.KEY_AUTHENTICATE) ?? "";
    authenJobInfo = Authenticate.fromJson(JsonDecoder().convert(data));
    listFocus.clear();
    listController.clear();
    Map<String, dynamic> phoneJson;
    if (authenJobInfo.employeeInfo.jobInfo.workPhoneJson != null) {
      phoneJson = jsonDecode(authenJobInfo.employeeInfo.jobInfo.workPhoneJson);
    }

    ;
    String dateFormate = Utilities()
        .getFormat(context, authenJobInfo.employeeInfo.jobInfo.joinDate);
    items = <ItemJobInfo>[
      ItemJobInfo(
          title: appLocalizations.jobInfoTitle,
          data: authenJobInfo.employeeInfo.jobInfo.jobtitleName == null
              ? appLocalizations.noneContent
              : authenJobInfo.employeeInfo.jobInfo.jobtitleName,
          icon: Icons.all_inbox_rounded),
      ItemJobInfo(
          title: appLocalizations.department,
          data: authenJobInfo.employeeInfo.jobInfo.departmentName == null
              ? appLocalizations.noneContent
              : authenJobInfo.employeeInfo.jobInfo.departmentName,
          icon: Icons.home_work),
      ItemJobInfo(
          title: appLocalizations.employmentType,
          data: authenJobInfo.employeeInfo.jobInfo.employmentType == null
              ? appLocalizations.noneContent
              : getEmploymentType(
                  authenJobInfo.employeeInfo.jobInfo.employmentType),
          icon: Icons.work),
      authenJobInfo.employeeInfo.jobInfo.workPhoneExt != null
          ? ItemJobInfo(
              title: appLocalizations.workPhoneNumber,
              data: phoneJson != null
                  ? phoneJson['internationalNumber'] +
                          ' (${authenJobInfo.employeeInfo.jobInfo.workPhoneExt})' ??
                      appLocalizations.noneContent
                  : appLocalizations.noneContent,
              icon: Icons.phone)
          : ItemJobInfo(
              title: appLocalizations.workPhoneNumber,
              data: phoneJson != null
                  ? phoneJson['internationalNumber'] ??
                      appLocalizations.noneContent
                  : appLocalizations.noneContent,
              icon: Icons.phone),
      ItemJobInfo(
          title: appLocalizations.joinDate,
          data: authenJobInfo.employeeInfo.jobInfo.joinDate == null
              ? appLocalizations.noneContent
              : dateFormate,
          icon: Icons.date_range),
    ];

    items.forEach((element) {
      listController.add(TextEditingController());
      listFocus.add(FocusNode());
      listKey.add(GlobalKey());
    });

    isLoading = false;
    notifyListeners();

    return authenJobInfo;
  }

  String getEmploymentType(String type) {
    switch (type) {
      case "1":
        return 'Contractor';
      case "2":
        return 'Freelancer';
      case "3":
        return 'Full-time';
      case "4":
        return 'Intern';
      case "5":
        return 'Part-time';
      default:
        return "";
    }
  }
}
