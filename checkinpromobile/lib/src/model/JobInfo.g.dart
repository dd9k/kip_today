// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'JobInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobInfo _$JobInfoFromJson(Map<String, dynamic> json) {
  return JobInfo(
    json['workPhoneExt'] as String,
    json['workPhoneNumber'] as String,
    json['workPhoneJson'] as String,
    json['lineManager'] == null
        ? null
        : LineManager.fromJson(json['lineManager'] as Map<String, dynamic>),
    (json['office'] as List)
        ?.map((e) =>
            e == null ? null : Office.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['jobtitleName'] as String,
    json['departmentName'] as String,
    json['employeeStatus'] as String,
    json['employmentType'] as String,
    json['attendanceType'] as String,
    json['workingLocation'] as String,
    json['joinDate'] as String,
    json['jobtitle'] as int,
    json['department'] as int,
  );
}

Map<String, dynamic> _$JobInfoToJson(JobInfo instance) => <String, dynamic>{
      'workPhoneExt': instance.workPhoneExt,
      'workPhoneNumber': instance.workPhoneNumber,
      'workPhoneJson': instance.workPhoneJson,
      'lineManager': instance.lineManager,
      'office': instance.office,
      'jobtitleName': instance.jobtitleName,
      'departmentName': instance.departmentName,
      'employeeStatus': instance.employeeStatus,
      'employmentType': instance.employmentType,
      'attendanceType': instance.attendanceType,
      'workingLocation': instance.workingLocation,
      'joinDate': instance.joinDate,
      'jobtitle': instance.jobtitle,
      'department': instance.department,
    };
