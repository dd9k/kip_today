import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:flutter/cupertino.dart';

import 'AppLocalizations.dart';
import 'package:intl/intl.dart';

class Validator {
  static const String patternEmail = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";

  static const String patternPhone = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  BuildContext context;
  Validator(this.context);

  String validateName(String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).pleaseEnterFullnameInviteValidator;
    }
    return null;
  }

  String validateTitle(String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).pleaseEnterTitleInviteValidator;
    }
    return null;
  }

  String validateIdCard(String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).validateIdcard;
    }
    return null;
  }

  String validatePosition(String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).validatePosition;
    }
    return null;
  }

  String validatecompany(String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).validateCompany;
    }
    return null;
  }

  String validatequantity(String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).validateQuantity;
    }
    return null;
  }

  String validateamount(String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).validateAmount;
    }
    return null;
  }

  String validateSites(String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).pleaseEnterSitesInviteValidator;
    }
    return null;
  }

  String validateVisitorType(String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).pleaseEnterVisitorTupeInviteValidator;
    }
    return null;
  }

  String validateUserName(String value) {
    if (value.isNotEmpty) {
      String pattern = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
          "\\@" +
          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
          "(" +
          "\\." +
          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
          ")+";
      RegExp regExp = new RegExp(pattern);
      if (regExp.hasMatch(value)) {
        return null;
      }
      return AppLocalizations.of(context).validateEmail;
    }
    return AppLocalizations.of(context).errorNoUserName;
  }

  String validateEmail(String value) {
    if (value.isNotEmpty) {
      String pattern = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
          "\\@" +
          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
          "(" +
          "\\." +
          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
          ")+";
      RegExp regExp = new RegExp(pattern);
      if (regExp.hasMatch(value)) {
        return null;
      }
      return AppLocalizations.of(context).validateEmail;
    }
    return AppLocalizations.of(context).errorNoUserName;
  }

  String phoneNumberValidator(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return AppLocalizations.of(context).errorMinPhone;
    else
      return null;
  }

  String validateEmailWithoutRequire(String value) {
    if (value.isNotEmpty) {
      String pattern = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
          "\\@" +
          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
          "(" +
          "\\." +
          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
          ")+";
      RegExp regExp = new RegExp(pattern);
      if (regExp.hasMatch(value)) {
        return null;
      }
      return AppLocalizations.of(context).validateEmail;
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).errorNoPassword;
    }
    return null;
  }

  String validatePasswordVer2(String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).errorNoPassword;
    }
    if (value.length < 8) {
      return AppLocalizations.of(context).shouldBe8CharPassError;
    }
    bool hasUppercase = value.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = value.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = value.contains(new RegExp(r'[a-z]'));
    if (hasUppercase & hasDigits & hasLowercase) {
      return null;
    }
    return AppLocalizations.of(context).ruleValidPassError;
  }

  String validateTime(String value,
      {String formatStr = Constants.FORMAT_STRING_DATE}) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).enterStartDateContent;
    }
    DateTime tempDate = new DateFormat(formatStr).parse(value);
    if (tempDate.compareTo(DateTime.now()) <= 0) {
      return AppLocalizations.of(context).startDateGreaterThanTodayContent;
    }
    return null;
  }

  String validateSubject(String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).enterSubjectInviteContent;
    }
    return null;
  }

  String validateDomain(String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).invalidDomain;
    }
    return null;
  }
}

class ValidatorLabel {
  AppLocalizations appLocalizations;

  ValidatorLabel(this.appLocalizations);

  String getStrParam = "";

  void setStrParam(String str) {
    getStrParam = str;
  }

  String validateName(String value) {
    if (value.isEmpty) {
      return appLocalizations.errorNo.replaceAll("field_name", getStrParam);
    }
    if (!value.trim().contains(" ") || value.trim().length < 4) {
      return "${appLocalizations.validate} ${getStrParam}";
    }
    return null;
  }

  String validateText(String value) {
    if (value.isEmpty) {
      return appLocalizations.errorNo.replaceAll("field_name", getStrParam);
    }
    return null;
  }

  String validateEmail(String value) {
    if (value.isNotEmpty) {
      RegExp regExp = new RegExp(Validator.patternEmail);
      if (regExp.hasMatch(value)) {
        return null;
      }
      return appLocalizations.validateEmail;
    }
    return appLocalizations.errorNo.replaceAll("field_name", getStrParam);
  }

  String validateEmailWithoutRequire(String value) {
    if (value.isNotEmpty) {
      RegExp regExp = new RegExp(Validator.patternEmail);
      if (!regExp.hasMatch(value)) {
        return appLocalizations.validateEmail;
      }
      return null;
    }
    return null;
  }

  String validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return appLocalizations.errorNo.replaceAll("field_name", getStrParam);
    }
    RegExp regExp = new RegExp(Validator.patternPhone);
    if (value.length == 0) {
      return "${getStrParam} is Required";
    } else if (!regExp.hasMatch(value)) {
      return appLocalizations.errorMinPhone;
    }
    return null;
  }

  String validatePhoneWithoutRequire(String value) {
    if (value.isNotEmpty) {
      RegExp regExp = new RegExp(Validator.patternPhone);
      if (!regExp.hasMatch(value)) {
        return appLocalizations.errorMinPhone;
      }
    }
    return null;
  }
}
