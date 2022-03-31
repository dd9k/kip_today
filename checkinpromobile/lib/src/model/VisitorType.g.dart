// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VisitorType.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorType _$VisitorTypeFromJson(Map<String, dynamic> json) {
  return VisitorType(
    json['settingType'] as String,
    json['settingKey'] as String,
    json['settingValue'] as String,
    json['description'] as String,
  );
}

Map<String, dynamic> _$VisitorTypeToJson(VisitorType instance) =>
    <String, dynamic>{
      'settingType': instance.settingType,
      'settingKey': instance.settingKey,
      'settingValue': instance.settingValue,
      'description': instance.description,
    };
