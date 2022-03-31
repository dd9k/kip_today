// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemVisitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemVisitor _$ItemVisitorFromJson(Map<String, dynamic> json) {
  return ItemVisitor(
    json['fullName'] as String,
    json['email'] as String,
    json['phoneNumber'] as String,
    (json['id'] as num)?.toDouble(),
    json['signIn'] as String,
    json['signOut'] as String,
    json['toCompany'] as String,
    json['fromCompany'] as String,
    json['visitorTypeValue'] as String,
    json['purpose'] as String,
    json['feedback'] as String,
    json['rating'] as int,
    json['branchName'] as String,
    json['eventName'] as String,
    (json['totalCount'] as num)?.toDouble(),
    json['typeDescription'] as String,
    json['faceCaptureFile'] as String,
    'face_${(json['id'] as num)?.toDouble()?.toInt()?.toString()}.png',
    json['inviteCode'] as String,
  );
}

Map<String, dynamic> _$ItemVisitorToJson(ItemVisitor instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'id': instance.id,
      'signIn': instance.signIn,
      'signOut': instance.signOut,
      'toCompany': instance.toCompany,
      'fromCompany': instance.fromCompany,
      'visitorTypeValue': instance.visitorTypeValue,
      'purpose': instance.purpose,
      'feedback': instance.feedback,
      'rating': instance.rating,
      'branchName': instance.brachName,
      'eventName': instance.evenName,
      'totalCount': instance.totalCount,
      'typeDescription': instance.typeDescription,
      'faceCaptureFile': instance.faceCaptureFile,
      'inviteCode': instance.inviteCode
    };
