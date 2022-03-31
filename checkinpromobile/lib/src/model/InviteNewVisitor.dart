import 'package:json_annotation/json_annotation.dart';

import 'NewVisitor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';

part 'InviteNewVisitor.g.dart';

@JsonSerializable()
class InviteNewVisitor {
  @JsonKey(name: 'invitationName')
  String invitationName;

  @JsonKey(name: 'branchId')
  double branchId;

  @JsonKey(name: 'branchName')
  String branchName;

  @JsonKey(name: 'branchAddress')
  String branchAddress;

  @JsonKey(name: 'visitorType')
  String visitorType;

  @JsonKey(name: 'visitorTypeValue')
  String visitorTypeValue;

  @JsonKey(name: 'startDate')
  String startDate;

  @JsonKey(name: 'endDate')
  String endDate;

  @JsonKey(name: 'color')
  String color;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'guests')
  List<NewVisitor> guests;

  @JsonKey(name: 'id')
  double id;

  @JsonKey(name: 'status')
  String status = InvitationStatus.SENT;

  @JsonKey(ignore: true)
  bool isSent = false;

  @JsonKey(ignore: true)
  int valueReminder;

  String getStartJustDate(BuildContext context, String currentLang) {
    final DateFormat formatter = DateFormat.yMMMEd(currentLang);
    final DateTime now = DateTime.now();
    final String formatted = formatter.format(DateTime.parse(startDate));
    if (formatted == formatter.format(now)) {
      return AppLocalizations.of(context).todayTitle;
    } else if (formatted == formatter.format(now.add(Duration(days: 1)))) {
      return AppLocalizations.of(context).tomorrowTitle;
    }
    return formatted;
  }

  DateTime getStartDate(String currentLang) {
    try {
      return DateTime.parse(startDate);
    } catch (_) {
      return DateTime.now();
    }
  }

  DateTime getEndDate(String currentLang) {
    try {
      return DateTime.parse(endDate);
    } catch (_) {
      return getStartDate(currentLang).add(Duration(hours: 1));
    }
  }

  String getStringStartDay(String currentLang) {
    DateTime startDate = getStartDate(currentLang);
    return DateFormat(Constants.FORMAT_DAY_MAIN, currentLang).format(startDate);
  }

  String getStringEndDay(String currentLang) {
    DateTime endDate = getEndDate(currentLang);
    return DateFormat(Constants.FORMAT_DAY_MAIN, currentLang).format(endDate);
  }

  String getStringStartTime(String currentLang) {
    DateTime startDate = getStartDate(currentLang);
    return DateFormat(Constants.FORMAT_TIME_BASIC, currentLang)
        .format(startDate);
  }

  String getStringEndTime(String currentLang) {
    DateTime endDate = getEndDate(currentLang);
    return DateFormat(Constants.FORMAT_TIME_BASIC, currentLang).format(endDate);
  }

  String getStartJustTime(BuildContext context, String currentLang,
      {bool is12h = true}) {
    bool is24HoursFormat = MediaQuery.of(context).alwaysUse24HourFormat;
    var date = getStartDate(currentLang);
    if (!is24HoursFormat && is12h) {
      return DateFormat(Constants.TIME_FORMAT_12_EN, currentLang).format(date);
    }
    return DateFormat(Constants.TIME_FORMAT_24).format(date);
  }

  String getEndJustTime(BuildContext context, String currentLang,
      {bool is12h = true}) {
    bool is24HoursFormat = MediaQuery.of(context).alwaysUse24HourFormat;
    var date = getEndDate(currentLang);
    if (!is24HoursFormat && is12h) {
      return DateFormat(Constants.TIME_FORMAT_12_EN, currentLang).format(date);
    }
    return DateFormat(Constants.TIME_FORMAT_24).format(date);
  }

  // ignore: unused_element
  InviteNewVisitor.init();

  InviteNewVisitor(
      double id,
      String invitationName,
      double branchId,
      String branchName,
      String branchAddress,
      String visitorType,
      String visitorTypeValue,
      String startDate,
      String description,
      List<NewVisitor> guests,
      String endDate,
      String color,
      String status) {
    this.id = id;
    this.invitationName = invitationName;
    this.branchId = branchId;
    this.branchName = branchName;
    this.branchAddress = branchAddress;
    this.visitorType = visitorType;
    this.visitorTypeValue = visitorTypeValue;
    this.startDate = startDate;
    this.description = description;
    this.guests = guests;
    this.endDate = endDate;
    this.color = color;
    this.status = status;
  }

  InviteNewVisitor.local(
      double id,
      String invitationName,
      double branchId,
      String branchName,
      String branchAddress,
      String visitorType,
      String visitorTypeValue,
      String startDate,
      String description,
      List<NewVisitor> guests,
      String endDate,
      String color,
      String status) {
    this.id = id;
    this.invitationName = invitationName;
    this.branchId = branchId;
    this.branchName = branchName;
    this.branchAddress = branchAddress;
    this.visitorType = visitorType;
    this.visitorTypeValue = visitorTypeValue;
    this.startDate = startDate;
    this.description = description;
    this.guests = guests;
    this.endDate = endDate;
    this.color = color;
    this.status = status;
  }

  InviteNewVisitor.insert(
      String invitationName,
      double branchId,
      String visitorType,
      String startDate,
      String description,
      List<NewVisitor> guests,
      String endDate,
      String color,
      String status) {
    this.invitationName = invitationName;
    this.branchId = branchId;
    this.visitorType = visitorType;
    this.startDate = startDate;
    this.description = description;
    this.guests = guests;
    this.endDate = endDate;
    this.color = color;
    this.status = status;
  }

  factory InviteNewVisitor.fromJson(Map<String, dynamic> json) =>
      _$InviteNewVisitorFromJson(json);

  Map<String, dynamic> toJson() => _$InviteNewVisitorToJson(this);

  @override
  bool operator ==(Object other) {
    if (other is InviteNewVisitor) {
      return this.invitationName == other.invitationName &&
          this.branchId == other.branchId &&
          this.branchName == other.branchName &&
          this.branchAddress == other.branchAddress &&
          this.visitorType == other.visitorType &&
          this.visitorTypeValue == other.visitorTypeValue &&
          this.startDate == other.startDate &&
          this.description == other.description &&
          this.guests.length == other.guests.length &&
          this.endDate == other.endDate &&
          this.color == other.color;
    }
    return false;
  }

  @override
  int get hashCode => super.hashCode;
}
