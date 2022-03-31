// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PersonalInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) {
  return PersonalInfo(
    json['email'] as String,
    json['phone'] as String,
    json['phoneJson'] as String,
    json['fullName'] as String,
    json['firstName'] as String,
    json['lastName'] as String,
    json['avatarFileName'] as String,
    json['avatarRepoId'] as String,
    json['gender'] as int,
    json['actived'] as int,
    json['locked'] as int,
    json['birthDay'] as String,
    json['nationality'] as String,
    json['language'] as String,
    json['mobileAvatar'] as String,
  );
}

Map<String, dynamic> _$PersonalInfoToJson(PersonalInfo instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'phoneJson': instance.phoneJson,
      'fullName': instance.fullName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatarFileName': instance.avatarFileName,
      'avatarRepoId': instance.avatarRepoId,
      'gender': instance.gender,
      'actived': instance.actived,
      'locked': instance.locked,
      'birthDay': instance.birthDay,
      'nationality': instance.nationality,
      'language': instance.language,
      'mobileAvatar': instance.mobileAvatar
    };
