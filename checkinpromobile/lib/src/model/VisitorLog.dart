import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

part 'VisitorLog.g.dart';

@JsonSerializable()
class VisitorLog {
  @JsonKey(name: 'id')
  double id;

  @JsonKey(name: 'fullName')
  String fullName;

  @JsonKey(name: 'phoneNumber')
  String phoneNumber;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'signIn')
  String signIn;

  @JsonKey(name: 'signOut')
  String signOut;

  @JsonKey(name: 'fromCompany')
  String fromCompany;

  @JsonKey(name: 'branchId')
  int branchId;

  @JsonKey(name: 'branchName')
  String branchName;

  @JsonKey(name: 'visitorTypeValue')
  String visitorTypeValue;

  @JsonKey(name: 'faceCaptureFile')
  String faceCaptureFile;

  @JsonKey(ignore: true)
  String nameImgLocal;

  @JsonKey(name: 'rating')
  int rating;

  @JsonKey(name: 'feedback')
  String feedback;

  @JsonKey(name: 'visitorType')
  String visitorType;

  @JsonKey(name: 'inviteCode')
  String inviteCode;

  String getLinkFace() {
    if (faceCaptureFile == null) {
      return "";
    }
    return faceCaptureFile;
  }

  String getLinkFaceLocal() {
    if (nameImgLocal == null) {
      return "";
    }
    return nameImgLocal;
  }

  String getVisitorTypeValue(String lang) {
    return locator<Utilities>().getStringByLang(visitorTypeValue, lang);
  }

  String getInJustDate(BuildContext context, String currentLang) {
    if (signIn == null || signIn.isEmpty) {
      return "";
    }
    final DateFormat formatter = DateFormat.yMMMEd(currentLang);
    final DateTime now = DateTime.now();
    final String formatted = formatter.format(DateTime.parse(signIn));
    if (formatted == formatter.format(now)) {
      return AppLocalizations.of(context).todayTitle;
    } else if (formatted == formatter.format(now.add(Duration(days: 1)))) {
      return AppLocalizations.of(context).tomorrowTitle;
    }
    return formatted;
  }

  String getOutJustDate(BuildContext context, String currentLang) {
    if (signOut == null || signOut.isEmpty) {
      return "";
    }
    final DateFormat formatter = DateFormat.yMMMEd(currentLang);
    final DateTime now = DateTime.now();
    final String formatted = formatter.format(DateTime.parse(signOut));
    if (formatted == formatter.format(now)) {
      return AppLocalizations.of(context).todayTitle;
    } else if (formatted == formatter.format(now.add(Duration(days: 1)))) {
      return AppLocalizations.of(context).tomorrowTitle;
    }
    return formatted;
  }

  String getInJustTime(BuildContext context, String currentLang) {
    if (signIn == null || signIn.isEmpty) {
      return "";
    }
    bool is24HoursFormat = MediaQuery.of(context).alwaysUse24HourFormat;
    var date = DateTime.parse(signIn);
    if (!is24HoursFormat) {
      return DateFormat(Constants.TIME_FORMAT_12_EN, currentLang).format(date);
    }
    return DateFormat(Constants.TIME_FORMAT_24).format(date);
  }

  String getOutJustTime(BuildContext context, String currentLang) {
    if (signOut == null || signOut.isEmpty) {
      return "";
    }
    bool is24HoursFormat = MediaQuery.of(context).alwaysUse24HourFormat;
    var date = DateTime.parse(signOut);
    if (!is24HoursFormat) {
      return DateFormat(Constants.TIME_FORMAT_12_EN, currentLang).format(date);
    }
    return DateFormat(Constants.TIME_FORMAT_24).format(date);
  }

  VisitorLog(
      this.id,
      this.fullName,
      this.phoneNumber,
      this.email,
      this.signIn,
      this.signOut,
      this.fromCompany,
      this.branchId,
      this.branchName,
      this.faceCaptureFile,
      this.feedback,
      this.rating,
      this.visitorType,
      this.inviteCode,
      this.nameImgLocal);

  VisitorLog.insertLocal(
      this.id,
      this.fullName,
      this.phoneNumber,
      this.email,
      this.signIn,
      this.signOut,
      this.fromCompany,
      this.branchId,
      this.branchName,
      this.faceCaptureFile,
      this.feedback,
      this.rating,
      this.visitorType,
      this.visitorTypeValue,
      this.inviteCode,
      this.nameImgLocal);

  VisitorLog.local(
      this.id,
      this.fullName,
      this.phoneNumber,
      this.email,
      this.signIn,
      this.signOut,
      this.fromCompany,
      this.branchId,
      this.branchName,
      this.nameImgLocal,
      this.feedback,
      this.rating,
      this.visitorType,
      this.visitorTypeValue,
      this.inviteCode);

  VisitorLog.hard(this.fullName, this.fromCompany);

  factory VisitorLog.fromJson(Map<String, dynamic> json) =>
      _$VisitorLogFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorLogToJson(this);
}
