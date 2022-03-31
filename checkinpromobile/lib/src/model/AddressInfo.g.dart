// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddressInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressInfo _$AddressInfoFromJson(Map<String, dynamic> json) {
  return AddressInfo(
    json['fullAddress'] as String,
    json['phone'] as String,
    json['country'] as String,
    json['stateProvince'] as String,
    json['city'] as String,
    json['postalCode'] as String,
  );
}

Map<String, dynamic> _$AddressInfoToJson(AddressInfo instance) =>
    <String, dynamic>{
      'fullAddress': instance.fullAddress,
      'phone': instance.phone,
      'country': instance.country,
      'stateProvince': instance.stateProvince,
      'city': instance.city,
      'postalCode': instance.postalCode,
    };
