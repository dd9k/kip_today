// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListLog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListLog _$ListLogFromJson(Map<String, dynamic> json) {
  return ListLog(
    (json['today'] as List)
        ?.map((e) =>
            e == null ? null : VisitorLog.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['tomorrow'] as List)
        ?.map((e) =>
            e == null ? null : VisitorLog.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['int'] as int,
  );
}

Map<String, dynamic> _$ListLogToJson(ListLog instance) => <String, dynamic>{
      'today': instance.today,
      'tomorrow': instance.tomorrow,
      'int': instance.total,
    };
