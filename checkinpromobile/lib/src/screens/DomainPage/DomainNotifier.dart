import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/BaseResponse.dart';
import 'package:checkinpromobile/src/model/Errors.dart';
import 'package:checkinpromobile/src/screens/ActiveEmail/ActiveEmailScreen.dart';
import 'package:checkinpromobile/src/screens/login/LoginScreen.dart';
import 'package:checkinpromobile/src/services/ApiCallBack.dart';
import 'package:checkinpromobile/src/services/AppRouter.dart';
import 'package:checkinpromobile/src/services/RequestApi.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:checkinpromobile/src/utilities/UtilityNotifier.dart';
import 'package:checkinpromobile/src/widgetUtilities/awesomeDialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum DOMAIN_ERROR_TYPE { IS_EMPTY, WRONG_DOMAIN }

class DomainNotifier extends UtilityNotifier {
  bool isLoading = false;
  bool isUpdateLang = false;
  bool isFabOpen = false;
  String error;
  bool isDevMode = false;
  bool updateToggle = false;
  int clickNumber = 0;
  List<bool> selections =
      List.generate(Constants.URL_LIST.length, (index) => false);

  DOMAIN_ERROR_TYPE domainErrorType;

  String dataNotification;

  Future<void> onTapLogo() async {
    clickNumber++;
    // Meet maximum value
    if (Constants.MAX_CLICK_NUMBER == clickNumber) {
      // Reset clickNumber value
      clickNumber = 0;
      // Show hidden
      updateToggle = !updateToggle;
      isDevMode = !isDevMode;
      var index = parent.preferences.getInt(Constants.KEY_DEV_MODE) ?? 0;
      selections[index] = true;
      notifyListeners();
    }
  }

  Future<void> onToggleSelected(int index) async {
    Constants().indexURL = index;
    selections.asMap().forEach((index, element) {
      selections[index] = false;
    });
    selections[index] = true;
    parent.preferences.setInt(Constants.KEY_DEV_MODE, index);
    updateToggle = !updateToggle;
    notifyListeners();
  }

  void _gotoNextScreen(BuildContext context, String domainData) async {
    domainData = domainData.replaceAll(" ", "").toLowerCase();
    parent.preferences.setString(Constants.KEY_DOMAIN_STRING, domainData);
    final isHasLogin = parent.preferences.getBool(Constants.KEY_IS_HAS_LOGIN) ?? false;
    if (isHasLogin) {
      AppRouter.pushToWithArguments(context, LoginScreen.route_name, arguments: {
        'dataNotification': dataNotification
      });
    } else {
      AppRouter.pushTo(context, ActiveEmailScreen.route_name);
    }
  }

  Future<void> updateLang(BuildContext context, String lang) async {
    var langSaved =
        parent.preferences.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
    if (langSaved == lang) {
      return;
    }
    if (!Constants.LIST_LANG.contains(lang)) {
      lang = Constants.EN_CODE;
    }
    parent.preferences.setString(Constants.KEY_LANGUAGE, lang);
    await appLocalizations.load(Locale(lang));
    currentLang = lang;
    if (error != null) {
      switch (domainErrorType) {
        case DOMAIN_ERROR_TYPE.IS_EMPTY:
          error = appLocalizations.invalidDomain;
          break;
        case DOMAIN_ERROR_TYPE.WRONG_DOMAIN:
          error = appLocalizations.wrongDomain;
          break;
      }
    }
    isUpdateLang = !isUpdateLang;
    notifyListeners();
  }

  Future<void> validateDomain(BuildContext context, String domain) async {
    domain = domain.replaceAll(" ", "").toLowerCase();
    error = null;
    if (domain.isEmpty) {
      domainErrorType = DOMAIN_ERROR_TYPE.IS_EMPTY;
      error = appLocalizations.invalidDomain;
      notifyListeners();
      return;
    }
    isLoading = true;
    notifyListeners();
    ApiCallBack callBack = ApiCallBack((BaseResponse baseResponse) async {
      isLoading = false;
      notifyListeners();
      _gotoNextScreen(context, domain);
    }, (Errors message) {
      if (message.code == Constants.STATUS_CODE_NO_INTERNET) {
        locator<Utilities>().showTwoButtonDialog(
            context,
            DialogType.QUESTION,
            null,
            appLocalizations.titleError,
            appLocalizations.noInternet,
            appLocalizations.buttonTryAgain,
            appLocalizations.buttonClose, () {
          validateDomain(context, domain);
        }, () {});
      }
      domainErrorType = DOMAIN_ERROR_TYPE.WRONG_DOMAIN;
      error = appLocalizations.wrongDomain;
      isLoading = false;
      notifyListeners();
    });

    await ApiRequest().requestGetCheckDomainRegister(context, domain, callBack);
  }

  Future<void> initURL() async {
    var langSaved =
        parent.preferences.getString(Constants.KEY_LANGUAGE) ?? Constants.LANG_DEFAULT;
    currentLang = langSaved;
    isUpdateLang = !isUpdateLang;
    // Key mode API
    var index = parent.preferences.getInt(Constants.KEY_DEV_MODE) ?? 0;
    if (arguments != null) {
      dataNotification = arguments["dataNotification"] as String;
    }
    Constants().indexURL = index;
    notifyListeners();
  }
}
