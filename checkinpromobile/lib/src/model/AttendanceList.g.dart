part of 'AttendanceList.dart';

AttendanceList _$AttendanceListFromJson(Map<String, dynamic> json) {
  return AttendanceList(
    json['timeIn'] as String,
    json['timeOut'] as String,
    json['time'] == null || json['time'] == 0
        ? 0.0
        : json['time'].toDouble(),
  );
}

Map<String, dynamic> _$AttendanceListToJson(AttendanceList instance) =>
    <String, dynamic>{
      'timeIn': instance.timeIn,
      'timeOut': instance.timeOut,
      'time': instance.time,
    };
