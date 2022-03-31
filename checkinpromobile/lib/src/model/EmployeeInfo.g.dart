// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EmployeeInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeInfo _$EmployeeInfoFromJson(Map<String, dynamic> json) {
  return EmployeeInfo(
    json['phoneJson'] as String,
    (json['id'] as num)?.toDouble(),
    json['username'] as String,
    json['fullName'] as String,
    json['firstName'] as String,
    json['lastName'] as String,
    json['phone'] as String,
    json['email'] as String,
    json['fingerPrint'] as String,
    json['pushNotification'] as String,
    json['pushEmail'] as String,
    json['companyName'] as String,
    (json['companyId'] as num)?.toDouble(),
    json['companyAddress'] as String,
    json['avatarFileName'] as String,
    json['mobileAvatar'] as String,
    (json['avatarRepoId'] as num)?.toDouble(),
    json['jobTitle'] as String,
    json['language'] as String,
    json['isBuilding'] as int,
    json['ownerAccountId'] as int,
    (json['firstLogin'] as num)?.toDouble(),
    json['effectedDate'] as String,
    json['expiredDate'] as String,
  );
}

Map<String, dynamic> _$EmployeeInfoToJson(EmployeeInfo instance) =>
    <String, dynamic>{
      'phoneJson': instance.phoneJson,
      'id': instance.id,
      'username': instance.username,
      'fullName': instance.fullName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
      'fingerPrint': instance.fingerPrint,
      'pushNotification': instance.pushNotification,
      'pushEmail': instance.pushEmail,
      'companyName': instance.companyName,
      'companyId': instance.companyId,
      'companyAddress': instance.companyAddress,
      'avatarFileName': instance.avatarFileName,
      'mobileAvatar': instance.mobileAvatar,
      'avatarRepoId': instance.avatarRepoId,
      'jobTitle': instance.jobTitle,
      'language': instance.language,
      'isBuilding': instance.isBuilding,
      'ownerAccountId': instance.ownerAccountId,
      'firstLogin': instance.firstLogin,
      'effectedDate': instance.effectedDate,
      'expiredDate': instance.expiredDate,
    };
