import 'package:checkinpromobile/src/model/Office.dart';
import 'package:json_annotation/json_annotation.dart';

import 'LineManager.dart';
part 'JobInfo.g.dart';

@JsonSerializable()
class JobInfo {

  @JsonKey(name: 'workPhoneExt')
  String workPhoneExt;

  @JsonKey(name: 'workPhoneNumber')
  String workPhoneNumber;

  @JsonKey(name: 'workPhoneJson')
  String workPhoneJson;

  @JsonKey(name: 'lineManager')
  LineManager lineManager;

  @JsonKey(name: 'office')
  List<Office> office;

  @JsonKey(name: 'jobtitleName')
  String jobtitleName;

  @JsonKey(name: 'departmentName')
  String departmentName;

  @JsonKey(name: 'employeeStatus')
  String employeeStatus;

  @JsonKey(name: 'employmentType')
  String employmentType;

  @JsonKey(name: 'attendanceType')
  String attendanceType;

  @JsonKey(name: 'workingLocation')
  String workingLocation;

  @JsonKey(name: 'joinDate')
  String joinDate;

  @JsonKey(name: 'jobtitle')
  int jobtitle;

  @JsonKey(name: 'department')
  int department;


  JobInfo(this.workPhoneExt, this.workPhoneNumber, this.workPhoneJson, this.lineManager, this.office, this.jobtitleName, this.departmentName,
      this.employeeStatus, this.employmentType, this.attendanceType, this.workingLocation, this.joinDate, this.jobtitle, this.department);

  JobInfo._();

  factory JobInfo.fromJson(Map<String, dynamic> json) => _$JobInfoFromJson(json);
  Map<String, dynamic> toJson() => _$JobInfoToJson(this);
}