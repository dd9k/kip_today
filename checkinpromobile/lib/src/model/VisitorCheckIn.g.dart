// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VisitorCheckIn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorCheckIn _$VisitorCheckInFromJson(Map<String, dynamic> json) {
  return VisitorCheckIn(
    (json['id'] as num)?.toDouble() ?? 0.0,
    json['fullName'] as String,
    json['email'] as String,
    json['phoneNumber'] as String,
    json['idCard'] as String,
    json['purpose'] as String,
    (json['visitorId'] as num)?.toDouble(),
    json['visitorType'] as String,
    json['fromCompany'] as String,
    json['toCompany'] as String,
    (json['contactPersonId'] as num)?.toDouble(),
    (json['faceCaptureRepoId'] as num)?.toDouble(),
    json['signInBy'] as int,
    (json['toCompanyId'] as num)?.toDouble(),
  )..signInType = json['signInType'] as String;
}

Map<String, dynamic> _$VisitorCheckInToJson(VisitorCheckIn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'idCard': instance.idCard,
      'purpose': instance.purpose,
      'visitorId': instance.visitorId,
      'visitorType': instance.visitorType,
      'fromCompany': instance.fromCompany,
      'toCompany': instance.toCompany,
      'contactPersonId': instance.contactPersonId,
      'faceCaptureRepoId': instance.faceCaptureRepoId,
      'signInBy': instance.signInBy,
      'signInType': instance.signInType,
      'toCompanyId': instance.toCompanyId,
    };
