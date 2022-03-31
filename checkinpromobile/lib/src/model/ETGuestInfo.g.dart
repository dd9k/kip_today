// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ETGuestInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ETGuestInfo _$ETGuestInfoFromJson(Map<String, dynamic> json) {
  return ETGuestInfo(
    (json['id'] as num)?.toDouble(),
    json['fullName'] as String,
    json['emailAddress'] as String,
    json['phoneNumber'] as String,
    json['idCard'] as String,
    json['company'] as String,
    json['position'] as String,
  );
}

Map<String, dynamic> _$ETGuestInfoToJson(ETGuestInfo instance) =>
    <String, dynamic>{
      'id': instance.idGuest,
      'fullName': instance.fullName,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'idCard': instance.idCard,
      'company': instance.company,
      'position': instance.position,
    };
