// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AttendanceDetailResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceDetail _$AttendanceDetailFromJson(Map<String, dynamic> json) {
  return AttendanceDetail(
    json['dayOfMonth'] as String,
    json['location'] as String,
    json['isLate'] as bool,
    json['isEnoughWorkingTime'] as bool,
    (json['totalWorkingTime'] as num)?.toDouble(),
    json['checkin'] as String,
    json['checkout'] as String,
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : AttendanceList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AttendanceDetailToJson(AttendanceDetail instance) =>
    <String, dynamic>{
      'dayOfMonth': instance.dayOfMonth,
      'location': instance.location,
      'totalWorkingTime': instance.totalWorkingTime,
      'checkin': instance.checkin,
      'checkout': instance.checkout,
      'isLate': instance.isLate,
      'isEnoughWorkingTime': instance.isEnoughWorkingTime,
      'data': instance.attendanceList,
    };
