// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ETPaymentType.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ETPaymentType _$ETPaymentTypeFromJson(Map<String, dynamic> json) {
  return ETPaymentType(
    (json['eventId'] as num)?.toDouble(),
    json['value'] as String,
    json['label'] as String,
  );
}

Map<String, dynamic> _$ETPaymentTypeToJson(ETPaymentType instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'value': instance.settingCode,
      'label': instance.settingValue,
    };
