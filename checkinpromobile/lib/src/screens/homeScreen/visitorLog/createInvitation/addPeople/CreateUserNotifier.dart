import 'dart:async';

import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/EmployeeSearch.dart';
import 'package:checkinpromobile/src/model/IdEmployeeInfo.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/screens/AppBarNotifier.dart';
import 'package:checkinpromobile/src/model/NewVisitor.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'CreateUserScreen.dart';

enum CREATE_USER_ERROR_TYPE {
  IS_EMPTY_EMAIL,
  IS_EMPTY_NAME,
  WRONG_EMAIL_FORMAT,
}

class CreateUserNotifier extends AppBarNotifier {
  String itemDateSelected = '';
  bool isLoading = true;
  List<IdEmployeeInfo> listEmployee = List();
  List<NewVisitor> listHint = List();
  int PAGE_SIZE = 10;
  int pageIndex = 1;
  int totalItem = Constants.MAX_INT;
  String errorName;
  bool duplicate = false;
  var completer = Completer<List<NewVisitor>>();
  CREATE_USER_ERROR_TYPE createUserErrorType;
  RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  @override
  String getSubTitle(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  String getTitle(BuildContext context) {
    return appLocalizations.addNewVisitorType.toUpperCase();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClickLeft(BuildContext context) {}

  @override
  void onClickRight(BuildContext context) {
    Navigator.pop(context);
  }

  bool addItemToList(
      String visitorName,
      String visitorEmail,
      String visitorAvatarFileName,
      String visitorPhoneNumber,
      String visitorCompanyName,
      List<NewVisitor> lstNewVisitor,
      GlobalKey<FormState> emailkey,
      GlobalKey<FormState> phonekey) {
    isLoading = true;
    var isFail = false;
    isFail = validateName(visitorName);
    if (!emailkey.currentState.validate()) {
      isFail = true;
    }
    if (visitorPhoneNumber?.isNotEmpty == true) {
      if (!phonekey.currentState.validate()) {
        isFail = true;
      }
    }
    if (!isFail) {
      duplicate = false;
      final visitorModel = NewVisitor(visitorName, visitorEmail,
          visitorPhoneNumber, visitorCompanyName, visitorAvatarFileName, 0);
      bool contains = false;
      for (var visitor in lstNewVisitor) {
        if (visitor.visitorName == visitorName &&
            visitor.visitorEmail == visitorEmail) {
          contains = true;
          break;
        }
      }
      if (!contains) {
        duplicate = false;
        lstNewVisitor.add(visitorModel);
        notifyListeners();
        return true;
      } else {
        duplicate = !duplicate;
      }
    }
    return false;
  }

  bool validateName(String visitorName) {
    if (visitorName.isEmpty) {
      errorName = appLocalizations.pleaseEnterFullnameInviteValidator;
    } else {
      errorName = null;
    }
    notifyListeners();
    return errorName == null ? false : true;
  }

  void removePeople(List<NewVisitor> lstNewVisitor, int index) {
    lstNewVisitor.removeAt(index);
    notifyListeners();
  }

  void resetInviteData() {
    completer = Completer<List<NewVisitor>>();
    pageIndex = 1;
    totalItem = Constants.MAX_INT;
    listEmployee.clear();
    listHint.clear();
  }

  Future<List<NewVisitor>> getEmployeeOnline(String keyword) async {
    if (totalItem <= listEmployee.length) {
      return listHint;
    }
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      if (baseResponse.data != null) {
        final employeeSearch = EmployeeSearch.fromJson(baseResponse.data);
        if (employeeSearch != null) {
          totalItem = employeeSearch.totalCount;
          listEmployee.addAll(employeeSearch.employees);
          for (int i = 0; i < employeeSearch.employees.length; i++) {
            var newVisitor =
                NewVisitor.withEmployee(employeeSearch.employees[i]);
            if (!listHint.contains(newVisitor)) {
              listHint.add(newVisitor);
            }
          }
        }
      }
      completer.complete(listHint);
    }, (Errors message) async {
      completer.complete(listHint);
    });
    ApiRequest()
        .requestEmployee(context, keyword, pageIndex, PAGE_SIZE, callBack);
    return completer.future;
  }

  Future<List<NewVisitor>> getSavedContact(String keyword) async {
    List<NewVisitor> listSaved =
        await db.visitorInvitationDAO.searchVisitor(keyword);
    listHint.addAll(listSaved);
    return listHint;
  }

  Future<List<NewVisitor>> getHint(String keyword) async {
    var isSizeHave = (await getSavedContact(keyword))?.length ?? 0;
    if (isSizeHave > PAGE_SIZE) {
      return listHint;
    }
    return getEmployeeOnline(keyword);
  }
}
