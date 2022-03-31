import 'package:json_annotation/json_annotation.dart';
import 'dart:convert' as convert;

part 'AttendanceInfoTodayResponse.g.dart';

@JsonSerializable()
class AttendanceInfoTodayResponse {
  @JsonKey(name: "today")
  List<AttendanceInfoToday> today;

  @JsonKey(name: "latestCheckin")
  AttendanceInfoToday latestCheckin;

  @JsonKey(name: "isLate")
  bool isLate;

  @JsonKey(name: "totalWorkingTime")
  double totalWorkingTime;

  @JsonKey(name: "isEnoughWorkingTime")
  bool isEnoughWorkingTime;

  AttendanceInfoTodayResponse._();

  AttendanceInfoTodayResponse(
      this.today, this.latestCheckin, this.isLate, this.totalWorkingTime, this.isEnoughWorkingTime);

  factory AttendanceInfoTodayResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceInfoTodayResponseFromJson(json);
}

class AttendanceInfoToday {
  String date;
  String timeIn;
  String timeOut;
  int actualHours;
  String attendanceType;
  Map<String, dynamic> inLocation;
  Map<String, dynamic> outLocation;
  String notes;
  int locationId;
  String branchName;
  String branchAddress;
  String branchLocation;

  AttendanceInfoToday(
      this.date,
      this.timeIn,
      this.timeOut,
      this.actualHours,
      this.attendanceType,
      this.inLocation,
      this.outLocation,
      this.notes,
      this.locationId,
      this.branchName,
      this.branchAddress,
      this.branchLocation);

  factory AttendanceInfoToday.fromJson(Map<String, dynamic> json) {
    return AttendanceInfoToday(
      json['date'] as String,
      json['timeIn'] as String,
      json['timeOut'] as String,
      json['actualHours'] as int,
      json['attendanceType'] as String,
      convert.json.decode(json['inLocation'] ?? '{}'),
      convert.json.decode(json['outLocation'] ?? '{}'),
      json['notes'] as String,
      json['locationId'] as int,
      json['branchName'] as String,
      json['branchAddress'] as String,
      json['branchLocation'] as String,
    );
  }
}
