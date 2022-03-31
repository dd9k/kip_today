// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PhoneJson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneJson _$PhoneJsonFromJson(Map<String, dynamic> json) {
  return PhoneJson(
    json['number'] as String,
    json['internationalNumber'] as String,
    json['nationalNumber'] as String,
    json['e164Number'] as String,
    json['countryCode'] as String,
    (json['dialCode'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PhoneJsonToJson(PhoneJson instance) => <String, dynamic>{
      'number': instance.number,
      'internationalNumber': instance.internationalNumber,
      'nationalNumber': instance.nationalNumber,
      'e164Number': instance.e164Number,
      'countryCode': instance.countryCode,
      'dialCode': instance.dialCode,
    };
