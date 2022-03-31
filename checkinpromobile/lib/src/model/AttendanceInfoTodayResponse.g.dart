// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AttendanceInfoTodayResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceInfoTodayResponse _$AttendanceInfoTodayResponseFromJson(
    Map<String, dynamic> json) {
  return AttendanceInfoTodayResponse(
    (json['today'] as List)
        ?.map((e) => e == null
            ? null
            : AttendanceInfoToday.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['latestCheckin'] == null
        ? null
        : AttendanceInfoToday.fromJson(
            json['latestCheckin'] as Map<String, dynamic>),
    json['isLate'] as bool,
    (json['totalWorkingTime'] as num)?.toDouble(),
    json['isEnoughWorkingTime'] as bool,
  );
}
