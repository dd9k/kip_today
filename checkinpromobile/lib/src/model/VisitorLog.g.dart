// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VisitorLog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorLog _$VisitorLogFromJson(Map<String, dynamic> json) {
  return VisitorLog(
    (json['id'] as num)?.toDouble(),
    json['fullName'] as String,
    json['phoneNumber'] as String,
    json['email'] as String,
    json['signIn'] as String,
    json['signOut'] as String,
    json['fromCompany'] as String,
    json['branchId'] as int,
    json['branchName'] as String,
    json['faceCaptureFile'] as String,
    json['feedback'] as String,
    json['rating'] as int,
    json['visitorType'] as String,
    json['inviteCode'] as String,
    'face_${(json['id'] as num)?.toDouble()?.toInt()?.toString()}.png',
  )..visitorTypeValue = json['visitorTypeValue'] as String;
}

Map<String, dynamic> _$VisitorLogToJson(VisitorLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'signIn': instance.signIn,
      'signOut': instance.signOut,
      'fromCompany': instance.fromCompany,
      'branchId': instance.branchId,
      'branchName': instance.branchName,
      'visitorTypeValue': instance.visitorTypeValue,
      'faceCaptureFile': instance.faceCaptureFile,
      'rating': instance.rating,
      'feedback': instance.feedback,
      'visitorType': instance.visitorType,
      'inviteCode': instance.inviteCode,
    };
