import 'dart:convert';

import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/model/InviteNewVisitor.dart';
import 'package:checkinpromobile/src/model/Office.dart';
import 'package:checkinpromobile/src/model/ReminderInvitation.dart';
import 'package:checkinpromobile/src/screens/homeScreen/visitorLog/createInvitation/DetailEventsCalendar.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import '../../../AppBarNotifier.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/model/BaseListResponse.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/VisitorType.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/Authenticate.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/NewVisitor.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';
import 'package:intl/intl.dart';

enum VISITOR_ERROR_TYPE {
  IS_EMPTY_TITLE,
  IS_EMPTY_SITES,
  IS_EMPTY_VISITOR_TYPE,
}

class InviteVisitorField<T> {
  GlobalKey<FormState> key;
  T value;
  String title;
  String type;
  FormFieldValidator<String> validator;

  InviteVisitorField(GlobalKey<FormState> key, String title,
      FormFieldValidator<String> validator,
      {T value, String type = ''}) {
    this.key = key;
    this.title = title;
    this.validator = validator;
    this.value = value;
    this.type = type;
  }
}

class DetailEventCalendarNotifier extends AppBarNotifier {
  @override
  List<String> lstBrancheValues = List();
  List<NewVisitor> lstNewVisitor = List();
  List<double> lstBrancheId = List();
  List<String> lstVisitorValues = List();
  List<VisitorType> lstVisitorTypes = List();
  VisitorType visitorTypeSelected;
  List<Office> lstOffice = List();
  Authenticate authenProfile;
  List<VisitorModel> lstVisitorlocation = List();
  Office officeSelected;
  String startDateValue;
  String startTimeValue;
  String endTimeValue;
  String errorTime;
  bool validator = true;
  bool validatorEndTime = true;
  bool validatorType = true;
  bool updateExpand = false;
  bool isViewMode = false;
  bool isLoading = false;
  String expandedText;
  VISITOR_ERROR_TYPE visitorErrorType;
  String stringColor;
  String titleColor;
  var langSaved = Constants.LANG_DEFAULT;
  int valueReminder;
  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController visitorTypeController = TextEditingController();
  TextEditingController visitorController = TextEditingController();
  TextEditingController descriptions = TextEditingController();
  TextEditingController reminderController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  double branchId;

  GlobalKey<FormState> titleKey = GlobalKey();
  GlobalKey<FormState> sitesKey = GlobalKey();
  GlobalKey<FormState> visitorTypeKey = GlobalKey();
  List<InviteVisitorField> itemsStep1 = List();
  int timeZoneOffsetHourForBranch = 7;
  List keyList = List();

  String getSubTitle(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  String getTitle(BuildContext context) {
    return 'Thư mời'.toUpperCase();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClickLeft(BuildContext context) {}

  @override
  void onClickRight(BuildContext context) {
//    sendInvitation();
  }

  void sendInvitation(String status) {
    db.visitorInvitationDAO.insertAlls(lstNewVisitor, null);
    addNewInvite(status);
  }

  void updateExpandedText(bool isExpanded) {
    isExpanded == true
        ? expandedText =
            appLocalizations.viewMoreTitle + '(${lstNewVisitor.length - 1})'
        : expandedText = 'Rút gọn(${lstNewVisitor.length - 1})';
    notifyListeners();
  }

  void updateColor(String newStringColor, String newTitleColor) {
    stringColor = newStringColor;
    titleColor = newTitleColor;
    notifyListeners();
  }

  void getAuthenProfile() {
    final data = parent.preferences.getString(Constants.KEY_AUTHENTICATE);
    keyList.add(titleKey);
    keyList.add(sitesKey);
    keyList.add(visitorTypeKey);
    DetailEventsPage detailEventsPage = context.widget as DetailEventsPage;
    stringColor = detailEventsPage.inviteOld.color == null
        ? utilities.convertColorToString(AppColors.NORMAL_COLOR)
        : detailEventsPage.inviteOld.color;
    titleColor = detailEventsPage.inviteOld.color == utilities.convertColorToString(AppColors.EMERGENCY_COLOR)
        ? appLocalizations.redTitle
        : detailEventsPage.inviteOld.color == utilities.convertColorToString(AppColors.PRIORITIZE_COLOR)
            ? appLocalizations.yellowTitle
            : appLocalizations.blueTitle;
    colorController.text = titleColor;
    authenProfile = Authenticate.fromJson(JsonDecoder().convert(data));
    lstOffice = authenProfile.employeeInfo.jobInfo.office;
    for (int i = 0; i < lstOffice.length; i++) {
      lstBrancheValues.add(lstOffice[i].name);
      lstBrancheId.add(lstOffice[i].id);
    }
  }

  void reloadExpand(bool isExpanded) {
    updateExpand = !updateExpand;
    updateExpandedText(isExpanded);
    notifyListeners();
  }

  Future<void> addNewInvite(String status) async {
    var isFail = false;
    for (int i = 0; i < keyList.length; i++) {
      if (!keyList[i].currentState.validate()) {
        isFail = true;
      }
    }
    DateTime date = DateTime.parse(startDateValue);
    DateTime startTime =
        DateFormat(Constants.TIME_FORMAT_24).parse(startTimeValue);
    DateTime endTime = DateFormat(Constants.TIME_FORMAT_24).parse(endTimeValue);
    DateTime startWithTime =
        Utilities().createWithDateTime(date, startTime).toUtc();
    DateTime endWithTime =
        Utilities().createWithDateTime(date, endTime).toUtc();
    if (startWithTime.compareTo(endWithTime) >= 0) {
      isFail = true;
      errorTime = "";
    } else {
      errorTime = null;
    }
    if (startWithTime.isBefore(endWithTime)) {
      validatorEndTime = true;
    } else {
      validatorEndTime = false;
    }
    notifyListeners();

    if (lstNewVisitor.length > 0) {
      validator = true;
    } else {
      validator = false;
    }
    notifyListeners(); // Stop loading
    if (!isFail && validator) {
      isLoading = true;
      notifyListeners();
      // Get data in controller
      final invitationName = titleController.text; // Title
      if (officeSelected != null) {
        branchId = officeSelected.id; // Branch Id
      }
      String dateTimeStart = utilities.convertDateToString(
          startWithTime, Constants.FORMAT_DATE_BASIC);
      String dateTimeEnd = utilities.convertDateToString(
          endWithTime, Constants.FORMAT_DATE_BASIC);
      final notes = descriptions.text; // Descriptions
      DetailEventsPage detailEventsPage = context.widget as DetailEventsPage;
      if (detailEventsPage.inviteOld.id == null) {
        detailEventsPage.inviteOld.id = 0;
      }
      detailEventsPage.inviteOld.invitationName = invitationName;
      detailEventsPage.inviteOld.branchId = branchId;
      detailEventsPage.inviteOld.branchName = locationController.text;
      if (visitorTypeSelected != null) {
        detailEventsPage.inviteOld.visitorType = visitorTypeSelected.settingKey;
        detailEventsPage.inviteOld.visitorTypeValue = visitorTypeSelected.description;
      }
      detailEventsPage.inviteOld.startDate = dateTimeStart;
      detailEventsPage.inviteOld.description = notes;
      detailEventsPage.inviteOld.guests = lstNewVisitor;
      detailEventsPage.inviteOld.endDate = dateTimeEnd;
      detailEventsPage.inviteOld.color = stringColor;
      detailEventsPage.inviteOld.status = status;
      // Call back for API
      ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
        InviteNewVisitor inviteResponse =
            InviteNewVisitor.fromJson(baseResponse.data);
        List<InviteNewVisitor> listTemp = []..add(inviteResponse);
        db.myInvitationDAO.insertAlls(listTemp);
        detailEventsPage.inviteOld.isSent = true;
        detailEventsPage.inviteOld.startDate = inviteResponse.startDate;
        detailEventsPage.inviteOld.endDate = inviteResponse.endDate;
        detailEventsPage.inviteOld.valueReminder = valueReminder;
        detailEventsPage.inviteOld.visitorTypeValue = inviteResponse.visitorTypeValue;
        detailEventsPage.inviteOld.branchAddress = inviteResponse.branchAddress;
        detailEventsPage.inviteOld.id = inviteResponse.id;
        detailEventsPage.inviteOld.status = status;
        detailEventsPage.inviteOld.guests = inviteResponse.guests;
        if (valueReminder != null && status != InvitationStatus.DRAFT) {
          int startDuration =
              Utilities().createWithDateTime(date, startTime).millisecond -
                  DateTime.now().millisecond;
          ReminderInvitation reminderInvitation = ReminderInvitation(
              inviteResponse.invitationName,
              createContentNoti(inviteResponse),
              valueReminder + startDuration,
              valueReminder,
              inviteResponse.id,
              inviteResponse);
          this.db.reminderInvitationDAO.insert(reminderInvitation);
          await Constants.REMINDER_CHANNEL.invokeMethod(
              Constants.ACTION_REMINDER_CREATE, JsonEncoder().convert(reminderInvitation.toJson()));
        }
        Navigator.pop(context);
        var content = (status != InvitationStatus.DRAFT)
            ? appLocalizations.inviteSuccessContentNotify
            : appLocalizations.successSaveContent;
        Utilities().showNoButtonDialog(
            context, DialogType.SUCCES, 3, appLocalizations.inviteSuccessTitleNotify, content, () {});
        isLoading = false;
        notifyListeners();
      }, (Errors message) async {});
      // Request API
      await ApiRequest().requestInviteNewVisitor(
          context, detailEventsPage.inviteOld, callBack);
    }
  }

  String createContentNoti(InviteNewVisitor inviteResponse) =>
      "${appLocalizations.upcomingMeeting} ${inviteResponse.invitationName} ${appLocalizations.at} ${utilities.convertDateToString(DateTime.parse(inviteResponse.startDate), Constants.TIME_FORMAT_24)}";

  Future doGetVisitorTypeByBranchId(BuildContext cx, String branchId) async {
    ApiCallBack callBack =
        ApiCallBack((BaseListResponse baseListResponse) async {
      if (baseListResponse.data != null) {
        lstVisitorTypes = baseListResponse.data
            .map((Map model) => VisitorType.fromJson(model))
            .toList();
        lstVisitorValues.clear();
        for (int i = 0; i < lstVisitorTypes.length; i++) {
          lstVisitorValues.add(utilities.getStringByLang(
              lstVisitorTypes[i].description, langSaved));
        }
        notifyListeners();
      }
    }, (Errors message) async {});

    await ApiRequest().requestVisitorType(cx, callBack, branchId);
  }

  ItemReminder getByValue(int reminderValue) {
    switch (reminderValue) {
      case 300000:
        {
          return ItemReminder(appLocalizations.reminder5, 300000);
        }
      case 900000:
        {
          return ItemReminder(appLocalizations.reminder15, 900000);
        }
      case 1800000:
        {
          return ItemReminder(appLocalizations.reminder30, 1800000);
        }
      default:
        {
          return ItemReminder(appLocalizations.noTitle, null);
        }
    }
  }
}

class VisitorModel {
  int id;
  String name;
  String email;
  String avatar;

  VisitorModel({this.id, this.name, this.email, this.avatar});

  VisitorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    return data;
  }
}
