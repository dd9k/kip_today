// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IdEmployeeInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdEmployeeInfo _$IdEmployeeInfoFromJson(Map<String, dynamic> json) {
  return IdEmployeeInfo(
    json['personalInfo'] == null
        ? null
        : PersonalInfo.fromJson(json['personalInfo'] as Map<String, dynamic>),
    json['addressInfo'] == null
        ? null
        : AddressInfo.fromJson(json['addressInfo'] as Map<String, dynamic>),
    json['jobInfo'] == null
        ? null
        : JobInfo.fromJson(json['jobInfo'] as Map<String, dynamic>),
    (json['id'] as num)?.toDouble(),
    (json['companyId'] as num)?.toDouble(),
    json['companyName'] as String,
    json['companyAddress'] as String,
    json['expected'] as int,
    json['attendanceStatus'] as bool,
    json['created_By'] as String,
    json['created_Date'] as String,
    json['updated_By'] as String,
    json['updated_Date'] as String,
    json['integrationSettingInfo'] == null
        ? null
        : IntegrationSettingInfo.fromJson(
            json['integrationSettingInfo'] as Map<String, dynamic>),
  )..notificationInfo = json['notificationInfo'] == null
      ? null
      : NotificationInfo.fromJson(
          json['notificationInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$IdEmployeeInfoToJson(IdEmployeeInfo instance) =>
    <String, dynamic>{
      'personalInfo': instance.personalInfo,
      'addressInfo': instance.addressInfo,
      'jobInfo': instance.jobInfo,
      'notificationInfo': instance.notificationInfo,
      'id': instance.id,
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'companyAddress': instance.companyAddress,
      'expected': instance.expected,
      'attendanceStatus': instance.isAttendance,
      'created_By': instance.createBy,
      'created_Date': instance.createdDate,
      'updated_By': instance.updatedBy,
      'updated_Date': instance.updatedDate,
      'integrationSettingInfo': instance.integrationSettingInfo,
    };
