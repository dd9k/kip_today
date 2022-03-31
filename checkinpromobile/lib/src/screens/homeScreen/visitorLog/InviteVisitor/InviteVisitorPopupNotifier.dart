import 'package:async/async.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/model/BaseListResponse.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/BranchInfor.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/EventGuest.dart';
import 'package:checkinpromobile/src/model/InviteNewVisitor.dart';
import 'package:checkinpromobile/src/model/NewVisitor.dart';
import 'package:checkinpromobile/src/model/VisitorType.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/utilities/Validator.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

import '../../../AppBarNotifier.dart';

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

class InviteVisitorReviewSection {
  List<TextEditingController> listController;
  List<InviteVisitorField> items;
  String title;

  InviteVisitorReviewSection(this.listController, this.items, this.title);
}

class InviteVisitorPopupNotifier extends AppBarNotifier {
  List<InviteVisitorField> itemsStep1 = List();
  List<TextEditingController> listControllerStep1 = List();
  List<FocusNode> listFocusStep1 = List();
  AsyncMemoizer<List<InviteVisitorField>> memCacheListStep1 = AsyncMemoizer();

  List<InviteVisitorField> itemsStep2 = List();
  List<TextEditingController> listControllerStep2 = List();
  List<FocusNode> listFocusStep2 = List();
  AsyncMemoizer<List<InviteVisitorField>> memCacheListStep2 = AsyncMemoizer();

  List<InviteVisitorReviewSection> lstInviteVisitorReviewSections = List();

  List<BranchInfor> lstBranches;
  List<VisitorType> lstVisitorTypes;

  List<EventGuest> eventGuests = List();

  RoundedLoadingButtonController btnPrevController =
      new RoundedLoadingButtonController();
  RoundedLoadingButtonController btnNextController =
      new RoundedLoadingButtonController();

  bool isLoading = false;
  int stepCount = 1;
  int stepCurrentIndex = 1;
  int timeZoneOffsetHourForbranch = 0;

  Future<List<InviteVisitorField>> getListStep1(BuildContext context) {
    locator<SizeConfig>().init(context);
    final appLocalizations = AppLocalizations.of(context);

    return memCacheListStep1.runOnce(() {
      listFocusStep1.clear();
      listControllerStep1.clear();
      itemsStep1 = <InviteVisitorField>[
        InviteVisitorField(new GlobalKey(), appLocalizations.subjectTitle,
            Validator(context).validateSubject),
        InviteVisitorField(new GlobalKey(), appLocalizations.siteTitle, null,
            type: 'dropdown'),
        InviteVisitorField(new GlobalKey(), appLocalizations.visitorType, null,
            type: 'dropdown'),
        InviteVisitorField(new GlobalKey(), appLocalizations.timeTitle,
            Validator(context).validateTime,
            value: new DateTime.now()),
        InviteVisitorField(new GlobalKey(), appLocalizations.notesTitle, null,
            type: 'notes'),
      ];
      itemsStep1.forEach((element) {
        listControllerStep1.add(TextEditingController());
        listFocusStep1.add(FocusNode());
      });
      return itemsStep1;
    });
  }

  Future<List<InviteVisitorField>> getListStep2(BuildContext context) {
    locator<SizeConfig>().init(context);
    final appLocalizations = AppLocalizations.of(context);

    return memCacheListStep2.runOnce(() {
      listFocusStep2.clear();
      listControllerStep2.clear();
      itemsStep2 = <InviteVisitorField>[
        InviteVisitorField(new GlobalKey(), appLocalizations.visitorNameTitle,
            Validator(context).validateName),
        InviteVisitorField(new GlobalKey(), appLocalizations.email,
            Validator(context).validateEmail),
        InviteVisitorField(new GlobalKey(), appLocalizations.numberphone, null),
        InviteVisitorField(new GlobalKey(), appLocalizations.company, null),
      ];
      itemsStep2.forEach((element) {
        listControllerStep2.add(TextEditingController());
        listFocusStep2.add(FocusNode());
      });
      return itemsStep2;
    });
  }

  void addItemReviewSection(BuildContext context) {
    locator<SizeConfig>().init(context);
    final app = AppLocalizations.of(context);
    lstInviteVisitorReviewSections = <InviteVisitorReviewSection>[
      InviteVisitorReviewSection(
          listControllerStep1, itemsStep1, app.inviteInfoTitile),
      InviteVisitorReviewSection(
          listControllerStep2, itemsStep2, app.visitorInfoTitle),
    ];
  }

  Future doGetBranches(BuildContext cx) async {
    ApiCallBack callBack =
        ApiCallBack((BaseListResponse baseListResponse) async {
      if (baseListResponse.data != null) {
        lstBranches = baseListResponse.data
            .map((Map model) => BranchInfor.fromJson(model))
            .toList();
        notifyListeners();
      }
    }, (Errors message) async {});
    await ApiRequest().requestBranchInfor(cx, callBack);
  }

  Future doGetVisitorTypeByBranchId(BuildContext cx, String branchId) async {
    ApiCallBack callBack =
        ApiCallBack((BaseListResponse baseListResponse) async {
      print('baseListResponse.data: ${baseListResponse.data}');
      if (baseListResponse.data != null) {
        lstVisitorTypes = baseListResponse.data
            .map((Map model) => VisitorType.fromJson(model))
            .toList();
        var preferences = await SharedPreferences.getInstance();
        var langSaved = preferences.getString(Constants.KEY_LANGUAGE) ??
            Constants.LANG_DEFAULT;
        lstVisitorTypes.forEach((item) {
          // Get visitor type by lang
          Map<String, dynamic> visitorTypeDesToJson =
              convert.json.decode(item.description);
          if (langSaved == Constants.EN_CODE) {
            item.settingName = visitorTypeDesToJson['en'];
          } else {
            item.settingName = visitorTypeDesToJson['vi'];
          }
        });
        notifyListeners();
      }
    }, (Errors message) async {});

    await ApiRequest().requestVisitorType(cx, callBack, branchId);
  }

  Future<void> addNewInvistor(BuildContext cx) async {
    // Get data in controller
    final invitationName = listControllerStep1[0].text; // Title
    final branchId = (itemsStep1[1].value as BranchInfor).branchId; // Branch Id
    final visitorType =
        (itemsStep1[2].value as VisitorType).settingKey; // Visitor type
    DateTime dtStartDate = itemsStep1[3].value; // Get start date
    String startDate;
    if (timeZoneOffsetHourForbranch < 0) {
      startDate = DateFormat(Constants.DATE_FORMAT_TO_SQL).format((dtStartDate
          .add(Duration(hours: timeZoneOffsetHourForbranch)))); // Start date
    } else {
      startDate = DateFormat(Constants.DATE_FORMAT_TO_SQL).format(
          (dtStartDate.subtract(
              Duration(hours: timeZoneOffsetHourForbranch)))); // Start date
    }
    final notes = listControllerStep1[4].text; // Descriptions
    final visitorName = listControllerStep2[0].text; // Full name
    final visitorEmail = listControllerStep2[1].text; // Email
    final visitorPhoneNumber = listControllerStep2[2].text; // Phone number
    final visitorCompany = listControllerStep2[3].text; // Company
    // Add model visitor info
    final visitorModel = NewVisitor(
        visitorName, visitorEmail, visitorPhoneNumber, visitorCompany, '', null);
    List<NewVisitor> lstNewVisitor = List();
    lstNewVisitor.add(visitorModel);
    // Add model invite visitor info
    final inviteVisitorModel = InviteNewVisitor.insert(
        invitationName, branchId, visitorType, startDate, notes, lstNewVisitor, "", "", "");
    // Call back for API
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      Navigator.pop(cx);
      Utilities().showNoButtonDialog(
          cx,
          DialogType.SUCCES,
          3,
          appLocalizations.inviteSuccessTitleNotify,
          appLocalizations.inviteSuccessContentNotify,
          () {});
      btnNextController.stop(); // Stop loading
    }, (Errors message) async {
      btnNextController.stop(); // Stop loading
    });
    // Request API
    await ApiRequest()
        .requestInviteNewVisitor(cx, inviteVisitorModel, callBack);
  }

  bool checkIsDirtyData() {
    bool isDirty = false;
    for (var item in listControllerStep1) {
      if (item.text.isNotEmpty) {
        isDirty = true;
        break;
      }
    }
    if (isDirty) {
      return true;
    }
    return false;
  }

  @override
  // ignore: must_call_super
  void dispose() {
    memCacheListStep1 = AsyncMemoizer();
    memCacheListStep2 = AsyncMemoizer();
  }

  @override
  String getSubTitle(BuildContext context) {
    // TODO: implement getSubTitle
    throw UnimplementedError();
  }

  @override
  String getTitle(BuildContext context) {
    return appLocalizations.composeInvite;
  }

  @override
  void onClickLeft(BuildContext context) {
    // TODO: implement onClickLeft
  }

  @override
  void onClickRight(BuildContext context) {
    // TODO: implement onClickRight
  }
}
