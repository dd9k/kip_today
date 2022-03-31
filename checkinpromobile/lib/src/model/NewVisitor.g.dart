// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NewVisitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewVisitor _$NewVisitorFromJson(Map<String, dynamic> json) {
  return NewVisitor(
    json['visitorName'] as String,
    json['visitorEmail'] as String,
    json['visitorPhoneNumber'] as String,
    json['visitorCompany'] as String,
    json['avatarFileName'] as String,
    (json['id'] as num)?.toDouble(),
  )..inviteCode = json['inviteCode'] as String;
}

Map<String, dynamic> _$NewVisitorToJson(NewVisitor instance) =>
    <String, dynamic>{
      'visitorName': instance.visitorName,
      'visitorEmail': instance.visitorEmail,
      'visitorPhoneNumber': instance.visitorPhoneNumber,
      'visitorCompany': instance.visitorCompany,
      'inviteCode': instance.inviteCode,
      'avatarFileName': instance.visitorAvatarFileName,
      'id': instance.id,
    };
