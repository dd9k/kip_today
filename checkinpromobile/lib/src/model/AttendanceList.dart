import 'package:json_annotation/json_annotation.dart';
part 'AttendanceList.g.dart';

@JsonSerializable()
class AttendanceList {
  @JsonKey(name: 'timeIn')
  String timeIn;

  @JsonKey(name: 'timeOut')
  String timeOut;

  @JsonKey(name: 'time')
  double time;

  AttendanceList._();

  AttendanceList(String timeIn, String timeOut, double time) {
    this.timeIn = timeIn;
    this.timeOut = timeOut;
    this.time = time;
  }

  factory AttendanceList.fromJson(Map<String, dynamic> json) =>
      _$AttendanceListFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceListToJson(this);
}
