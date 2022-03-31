import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'AttendanceList.dart';
import 'package:intl/intl.dart';
part 'AttendanceDetailResponse.g.dart';

@JsonSerializable()
class AttendanceDetail {
  @JsonKey(name: 'dayOfMonth')
  String dayOfMonth;

  @JsonKey(name: 'location')
  String location;

  @JsonKey(name: 'totalWorkingTime')
  double totalWorkingTime;

  @JsonKey(name: 'checkin')
  String checkin;

  @JsonKey(name: 'checkout')
  String checkout;

  @JsonKey(name: 'isLate')
  bool isLate = false;

  @JsonKey(name: 'isEnoughWorkingTime')
  bool isEnoughWorkingTime = true;

  @JsonKey(name: 'data')
  List<AttendanceList> attendanceList;

  AttendanceDetail._();

  AttendanceDetail(this.dayOfMonth, this.location, this.isLate, this.isEnoughWorkingTime, this.totalWorkingTime,
      this.checkin, this.checkout, this.attendanceList);

  factory AttendanceDetail.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDetailFromJson(json);

  String getDayOfMonthDate(BuildContext context, String currentLang) {
    if (dayOfMonth == null || dayOfMonth.isEmpty) {
      return "";
    }
    final DateFormat formatter = DateFormat("dd/MM/yyyy");
    final String formatted = formatter.format(DateTime.parse(dayOfMonth));
    return formatted;
  }

  String getTotalWorkingTime(AppLocalizations appLocalizations) {
    double decimal = totalWorkingTime - totalWorkingTime.toInt();
    int hour = totalWorkingTime.toInt();
    int minutes = (60 * decimal).toInt();
    if (hour == 0 && minutes == 0) {
      int seconds = (3600 * decimal).toInt();
      if (seconds == 0) {
        return "";
      }
      return "$seconds ${appLocalizations.secondsTitle}";
    }
    String hourString = (hour == 0) ? "" : "$hour ${appLocalizations.hoursTitle}";
    String minutesString = (minutes == 0) ? "" : " $minutes ${appLocalizations.minutesTitle}";
    return hourString + minutesString;
  }
}
