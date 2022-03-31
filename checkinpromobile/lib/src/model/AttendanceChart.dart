import 'package:json_annotation/json_annotation.dart';
part 'AttendanceChart.g.dart';

@JsonSerializable()
class AttendanceChart {
  @JsonKey(name: 'month')
  int month;

  @JsonKey(name: 'workingTime')
  double workingTime;

  AttendanceChart._();

  AttendanceChart(
    int month,
    double workingTime,
  ) {
    this.month = month;
    this.workingTime = workingTime;
  }

  factory AttendanceChart.fromJson(Map<String, dynamic> json) =>
      _$AttendanceChartFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceChartToJson(this);
}
