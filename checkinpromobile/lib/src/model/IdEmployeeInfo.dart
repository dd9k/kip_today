import 'package:checkinpromobile/src/model/IntegrationSettingInfo.dart';
import 'package:json_annotation/json_annotation.dart';

import 'AddressInfo.dart';
import 'JobInfo.dart';
import 'NotificationInfo.dart';
import 'Office.dart';
import 'PersonalInfo.dart';

part 'IdEmployeeInfo.g.dart';

@JsonSerializable()
class IdEmployeeInfo {
  @JsonKey(name: 'personalInfo')
  PersonalInfo personalInfo;

  @JsonKey(name: 'addressInfo')
  AddressInfo addressInfo;

  @JsonKey(name: 'jobInfo')
  JobInfo jobInfo;

  @JsonKey(name: 'notificationInfo')
  NotificationInfo notificationInfo;

  @JsonKey(name: 'id')
  double id;

  @JsonKey(name: 'companyId')
  double companyId;

  @JsonKey(name: 'companyName')
  String companyName;

  @JsonKey(name: 'companyAddress')
  String companyAddress;

  @JsonKey(name: 'expected')
  int expected;

  @JsonKey(name: 'attendanceStatus')
  bool isAttendance;

  @JsonKey(name: 'created_By')
  String createBy;

  @JsonKey(name: 'created_Date')
  String createdDate;

  @JsonKey(name: 'updated_By')
  String updatedBy;

  @JsonKey(name: 'updated_Date')
  String updatedDate;

  @JsonKey(name: 'integrationSettingInfo')
  IntegrationSettingInfo integrationSettingInfo;

  IdEmployeeInfo(
      this.personalInfo,
      this.addressInfo,
      this.jobInfo,
      this.id,
      this.companyId,
      this.companyName,
      this.companyAddress,
      this.expected,
      this.isAttendance,
      this.createBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.integrationSettingInfo);

  IdEmployeeInfo._();

  factory IdEmployeeInfo.fromJson(Map<String, dynamic> json) =>
      _$IdEmployeeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$IdEmployeeInfoToJson(this);
}
