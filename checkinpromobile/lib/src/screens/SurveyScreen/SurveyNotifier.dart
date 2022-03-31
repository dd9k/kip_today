import 'dart:convert';

import 'package:async/async.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/QuestionSurvey.dart';
import 'package:checkinpromobile/src/model/SurveyForm.dart';
import 'package:checkinpromobile/src/screens/AppBarNotifier.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:checkinpromobile/src/utilities/Validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurveyNotifier extends AppBarNotifier {
  List<QuestionSurvey> listItem = List();
  List<QuestionSurvey> listOld = List();
  bool isValidate = false;
  SurveyForm surveyForm;
  String langSaved = Constants.EN_CODE;
  bool isReload = false;
  AsyncMemoizer<List<QuestionSurvey>> memCache = AsyncMemoizer();
  RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();

  Future<void> moveToNext(BuildContext context, Function callback) async {
    btnController.start();
    isValidate = false;
    List<QuestionSurvey> listSurvey = List();
    listItem.forEach((QuestionSurvey element) {
      if (checkingValidator(element).isNotEmpty) {
        isValidate = true;
      }
      listSurvey.add(element.createSubmit());
    });
    if (!isValidate) {
      btnController.stop();
      callback(surveyForm.customFormData.surveyId, jsonEncode(listSurvey));
    } else {
      btnController.stop();
      isReload = !isReload;
      notifyListeners();
    }
  }

  Future<List<QuestionSurvey>> getSurvey(BuildContext context) async {
    return memCache.runOnce(() async {
      var preferences = await SharedPreferences.getInstance();
      langSaved = preferences.getString(Constants.KEY_LANGUAGE) ??
          Constants.LANG_DEFAULT;
      await appLocalizations.initLocalLang();
      surveyForm = await utilities.getSurvey();
      if (surveyForm.customFormData.bodyTemperature == 1) {
        temperatureHardCode();
      }
      listItem.addAll(surveyForm.customFormData.questions);
      listItem?.removeWhere((element) => element.isHidden == 1);
      listItem?.sort((a, b) => a.sort.compareTo(b.sort));
      // Get answer old
      final survey = surveyForm.surveyAnswer ?? "";
      if (survey.isNotEmpty) {
        List<dynamic> convert = jsonDecode(survey);
        listOld = convert.map((e) => QuestionSurvey.fromJson(e)).toList();
      }
      return listItem;
    });
  }

  void temperatureHardCode() {
    Map<String, String> mapTitle = Map();
    Map<String, String> mapValue = Map();
    mapTitle[Constants.VN_CODE] = appLocalizations.titleSurvey0Vi;
    mapTitle[Constants.EN_CODE] = appLocalizations.titleSurvey0En;
    mapValue[Constants.VN_CODE] = appLocalizations.value0Survey2Vi;
    mapValue[Constants.EN_CODE] = appLocalizations.value0Survey2En;
    String title = jsonEncode(mapTitle);
    String value = jsonEncode(mapValue);
    listItem
        .add(QuestionSurvey(-1, title, [value], List(), "5", "1", 1, 0, -1));
  }

  String checkingValidator(QuestionSurvey questionSurvey) {
    if (questionSurvey.getSurveyType() != QuestionType.EDIT_TEXT) {
      if (questionSurvey.isRequired == 1 &&
          questionSurvey?.getAnswer()?.isEmpty == true) {
        questionSurvey.errorText = appLocalizations.surveyValidate;
      } else {
        questionSurvey.errorText = "";
      }
      return questionSurvey.errorText;
    }
    switch (questionSurvey.getSurveySubType()) {
      case QuestionSubType.PHONE:
        {
          if (questionSurvey.getAnswer().isEmpty ||
              questionSurvey.getAnswer()[0].isEmpty) {
            if (questionSurvey.isRequired == 1) {
              questionSurvey.errorText = appLocalizations.surveyValidate;
            } else {
              questionSurvey.errorText = "";
            }
          } else {
            RegExp regExp = new RegExp(Validator.patternPhone);
            if (regExp.hasMatch(questionSurvey.getAnswerOptionValue(
                questionSurvey.getAnswer()[0], langSaved))) {
              questionSurvey.errorText = "";
            } else {
              questionSurvey.errorText = appLocalizations.errorMinPhone;
            }
          }
          return questionSurvey.errorText;
        }

      case QuestionSubType.EMAIL:
        {
          if (questionSurvey.getAnswer().isEmpty ||
              questionSurvey.getAnswer()[0].isEmpty) {
            if (questionSurvey.isRequired == 1) {
              questionSurvey.errorText = appLocalizations.surveyValidate;
            } else {
              questionSurvey.errorText = "";
            }
          } else {
            RegExp regExp = RegExp(Validator.patternEmail);
            if (regExp.hasMatch(questionSurvey.getAnswerOptionValue(
                questionSurvey.getAnswer()[0], langSaved))) {
              questionSurvey.errorText = "";
            } else {
              questionSurvey.errorText = appLocalizations.validateEmail;
            }
          }
          return questionSurvey.errorText;
        }

      default:
        {
          if (questionSurvey.isRequired == 1 &&
              (questionSurvey.getAnswer().isEmpty ||
                  questionSurvey.getAnswer()[0].isEmpty)) {
            questionSurvey.errorText = appLocalizations.surveyValidate;
          } else {
            questionSurvey.errorText = "";
          }
          return questionSurvey.errorText;
        }
    }
  }

  @override
  String getSubTitle(BuildContext context) {
    // TODO: implement getSubTitle
    throw UnimplementedError();
  }

  @override
  String getTitle(BuildContext context) {
    return utilities.getStringByLang(
        surveyForm?.customFormData?.title, langSaved);
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
