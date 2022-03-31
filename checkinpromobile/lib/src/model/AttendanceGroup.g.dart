// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AttendanceGroup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceGroup _$AttendanceGroupFromJson(Map<String, dynamic> json) {
  return AttendanceGroup(
    (json['listDetail'] as List)
        ?.map((e) => e == null
            ? null
            : AttendanceDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['weekRange'] as String,
  );
}

Map<String, dynamic> _$AttendanceGroupToJson(AttendanceGroup instance) =>
    <String, dynamic>{
      'listDetail': instance.listDetail,
      'weekRange': instance.weekRange,
    };
