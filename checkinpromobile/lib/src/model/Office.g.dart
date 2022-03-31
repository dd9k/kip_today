// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Office.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Office _$OfficeFromJson(Map<String, dynamic> json) {
  return Office(
    (json['id'] as num)?.toDouble(),
    json['name'] as String,
    (json['isActive'] as num)?.toDouble(),
    json['timeZoneOffsetHour'] as int,
  );
}

Map<String, dynamic> _$OfficeToJson(Office instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isActive': instance.isActive,
      'timeZoneOffsetHour': instance.timeZoneOffsetHour,
    };
