import 'dart:convert';

import 'package:async/async.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/Authenticate.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/EmployeeInfo.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/model/IdEmployeeInfo.dart';
import 'package:checkinpromobile/src/model/UpdateEmployee.dart';
import 'package:checkinpromobile/src/screens/AppBarNotifier.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum InfoPersonSwitchType { NORMAL, PHONE, GENDER, LANGUAGE }
enum GenderType { MALE, FEMALE, OTHER }

class ItemInforPerson {
  String title;
  String data;
  InfoPersonSwitchType type;
  bool edit;

  ItemInforPerson({this.title, this.data, this.type, this.edit});
}

class Gender {
  GenderType type;
  String data;

  Gender({this.type, this.data});
}

class InforPersonNotifier extends AppBarNotifier {
  List<TextEditingController> listController = List();
  TextEditingController phoneController = TextEditingController();

  List<FocusNode> listFocus = List();
  List<ItemInforPerson> items = List();
  ItemInforPerson data;
  List<GlobalKey<FormState>> listKey = List();
  AsyncMemoizer<List<String>> memCacheList = AsyncMemoizer();
  List<Gender> listGender = List();
  List<String> language = List();
  bool isUpdateLang = false;
  InfoPersonSwitchType type;
  bool isEdit = false;
  bool isLoading = false;
  EmployeeInfo employee;
  UpdateEmployee updateEmployeeData;
  PhoneNumber number = PhoneNumber(isoCode: 'VN');
  bool errorPhone = true; // true not error
  ExpandableController exController = ExpandableController();
  ExpandableController exLanguaeController = ExpandableController();
  Authenticate authenPersonalInfo;

  String errorText;
  bool isExpand = false;
  String singleValue = "";
  String singlelanguageValue = "";
  bool reloadLang = false;
  String currentLang;
  // String US = 'us'.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
  //     (match) => String.fromCharCode(match.group(0).codeUnitAt(0) + 127397));
  String US = 'English';
  // String VN = 'vn'.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
  //     (match) => String.fromCharCode(match.group(0).codeUnitAt(0) + 127397));
  String VN = 'Tiếng việt';
  //

  Future<List<String>> getList(BuildContext context) {}

  @override
  String getTitle(BuildContext context) {
    return appLocalizations.personalInfor;
  }

  @override
  String getSubTitle(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  void onClickLeft(BuildContext context) {}

  @override
  void onClickRight(BuildContext context) {
    if (isEdit) {
      utilities.hideKeyBoard(context);
      isEdit = false;
      //handler request api
      saveDataChange(context);
    } else {
      errorPhone = true;
      errorText = null;
      isEdit = true;
      isExpand = false;
      notifyListeners();
    }
  }

  Future<Authenticate> getAuthenInfo(BuildContext context) async {
    if (items.length > 0 && listController.length > 0) {
      return authenPersonalInfo;
    }
    isLoading = true;
    notifyListeners();

    final data = parent.preferences.getString(Constants.KEY_AUTHENTICATE) ?? "";
    authenPersonalInfo = Authenticate.fromJson(JsonDecoder().convert(data));

    listFocus.clear();
    listController.clear();

    String gender = authenPersonalInfo.employeeInfo.personalInfo.gender == 0
        ? appLocalizations.male
        : authenPersonalInfo.employeeInfo.personalInfo.gender == 1
            ? appLocalizations.female
            : appLocalizations.other;
    singleValue = gender;

    items = <ItemInforPerson>[
      ItemInforPerson(
          title: appLocalizations.fullname,
          data: authenPersonalInfo.employeeInfo.personalInfo.fullName == null
              ? appLocalizations.noneContent
              : authenPersonalInfo.employeeInfo.personalInfo.fullName,
          type: InfoPersonSwitchType.NORMAL,
          edit: false),
      ItemInforPerson(
          title: appLocalizations.numberphone,
          data: authenPersonalInfo.employeeInfo.personalInfo.phone == null
              ? appLocalizations.noneContent
              : authenPersonalInfo.employeeInfo.personalInfo.phone,
          type: InfoPersonSwitchType.PHONE,
          edit: true),
      ItemInforPerson(
          title: appLocalizations.gender,
          data: gender == null ? appLocalizations.noneContent : gender,
          type: InfoPersonSwitchType.GENDER,
          edit: true),
      ItemInforPerson(
          title: appLocalizations.language,
          data: authenPersonalInfo.employeeInfo.personalInfo.language == null
              ? appLocalizations.noneContent
              : authenPersonalInfo.employeeInfo.personalInfo.language,
          type: InfoPersonSwitchType.LANGUAGE,
          edit: true),
    ];

    items.forEach((element) {
      listController.add(TextEditingController());
      listFocus.add(FocusNode());
      listKey.add(GlobalKey());
    });

    //gender
    listGender = <Gender>[
      Gender(type: GenderType.MALE, data: appLocalizations.male),
      Gender(type: GenderType.FEMALE, data: appLocalizations.female),
      Gender(type: GenderType.OTHER, data: appLocalizations.other),
    ];

    //language
    singlelanguageValue =
        authenPersonalInfo.employeeInfo.personalInfo.language == "VI"
            ? this.VN
            : this.US;
    language = <String>[VN, US];
    isLoading = false;
    notifyListeners();
    return authenPersonalInfo;
  }

  Future saveDataChange(BuildContext context) async {
    if (items.length <= 0 && listController.length <= 0) {
      return null;
    }
    updateLang(context, singlelanguageValue == this.VN ? 'vi' : 'en');
    isLoading = true;
    notifyListeners();
    for (var i = 0; i < listController.length; i++) {
      items[i].data = listController[i].text;
    }
    authenPersonalInfo.employeeInfo.personalInfo.phone = listController[1].text;
    authenPersonalInfo.employeeInfo.personalInfo.gender =
        singleValue == appLocalizations.male
            ? 0
            : singleValue == appLocalizations.female
                ? 1
                : 2;
    authenPersonalInfo.employeeInfo.personalInfo.language =
        singlelanguageValue == this.VN ? "VI" : "EN";

    updateEmployeeData = UpdateEmployee.Update(
      authenPersonalInfo.employeeInfo.personalInfo.fullName,
      authenPersonalInfo.employeeInfo.personalInfo.email,
      authenPersonalInfo.employeeInfo.personalInfo.phone,
      authenPersonalInfo.employeeInfo.companyId,
      authenPersonalInfo.employeeInfo.companyAddress,
    );

    //check invalidate phone number
    if (this.errorPhone == false) {
      isLoading = false;
      this.errorText = "Phone Number invalidate";
      notifyListeners();
    } else {
      getPhoneNumber(listController[1].text);

      Map<String, dynamic> body = Map<String, dynamic>();
      body['phone'] = authenPersonalInfo.employeeInfo.personalInfo.phone;
      body['gender'] = authenPersonalInfo.employeeInfo.personalInfo.gender;
      body['genderName'] = '';
      body['birthDay'] = authenPersonalInfo.employeeInfo.personalInfo.birthDay;
      body['birthDayDisplay'] = '';
      body['firstName'] =
          authenPersonalInfo.employeeInfo.personalInfo.firstName;
      body['lastName'] = authenPersonalInfo.employeeInfo.personalInfo.lastName;
      body['fullName'] = authenPersonalInfo.employeeInfo.personalInfo.lastName +
          authenPersonalInfo.employeeInfo.personalInfo.firstName;
      body['phoneJson'] =
          authenPersonalInfo.employeeInfo.personalInfo.phoneJson;
      body['nationality'] = null;
      body['language'] = authenPersonalInfo.employeeInfo.personalInfo.language;

      updateInfo(context, body);
    }
  }

  /// function get info employee By Id
  ///
  Future updateInfo(BuildContext context, Map<String, dynamic> body) async {
    var preferences = await SharedPreferences.getInstance();
    var authentication =
        preferences.getString(Constants.KEY_EMPLOYEE_DATA) ?? "";
    var id = Authenticate.fromJson(json.decode(authentication)).employeeInfo.id;
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      var authenticationString =
          JsonEncoder().convert(authenPersonalInfo.toJson());
      parent.preferences
          .setString(Constants.KEY_AUTHENTICATE, authenticationString);
      isLoading = false;
      notifyListeners();
    }, (Errors message) {});
    await ApiRequest()
        .requestUpdateProFile(context, body, id.toInt().toString(), callBack);
  }

  // function get phone number
  //
  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'VN');
    this.number = number;
    notifyListeners();
  }

  Future<void> updateLang(BuildContext context, String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var langSaved =
        prefs.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
    if (langSaved == lang) {
      return;
    }
    if (!Constants.LIST_LANG.contains(lang)) {
      lang = Constants.EN_CODE;
    }
    prefs.setString(Constants.KEY_LANGUAGE, lang);
    await appLocalizations.load(Locale(lang));
    items[0].title = appLocalizations.fullname;
    items[1].title = appLocalizations.numberphone;
    items[2].title = appLocalizations.gender;
    items[3].title = appLocalizations.language;
    isUpdateLang = !isUpdateLang;
    reloadLang = true;
    notifyListeners();
  }

  Future<void> initURL() async {
    var preferences = await SharedPreferences.getInstance();
    var langSaved =
        preferences.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
    currentLang = langSaved;
    isUpdateLang = !isUpdateLang;
    // Key mode API
    var index = preferences.getInt(Constants.KEY_DEV_MODE) ?? 0;
    Constants().indexURL = index;
    notifyListeners();
  }
}
