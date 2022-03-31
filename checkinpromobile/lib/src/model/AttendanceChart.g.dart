// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AttendanceChart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceChart _$AttendanceChartFromJson(Map<String, dynamic> json) {
  return AttendanceChart(
    json['month'] as int,
    (json['workingTime'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$AttendanceChartToJson(AttendanceChart instance) =>
    <String, dynamic>{
      'month': instance.month,
      'workingTime': instance.workingTime,
    };
