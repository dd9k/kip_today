import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class WorkingTimeInfo {
  @JsonKey(name: "totalInWeek")
  double totalInWeek;

  @JsonKey(name: "totalInMonth")
  double totalInMonth;

  @JsonKey(name: "TotalLateDayInMonth")
  int totalLateDayInMonth;

  @JsonKey(name: "TotalNotCheckoutDayInMonth")
  int totalNotCheckoutDayInMonth;

  @JsonKey(name: "totalNotEnoughInMonth")
  int totalNotEnoughInMonth;

  WorkingTimeInfo(this.totalInWeek, this.totalInMonth, this.totalLateDayInMonth, this.totalNotCheckoutDayInMonth, this.totalNotEnoughInMonth);

  factory WorkingTimeInfo.fromJson(Map<String, dynamic> json) {
    return WorkingTimeInfo(
        json['totalInWeek'] == null || json['totalInWeek'] == 0
            ? 0.0
            : json['totalInWeek'].toDouble(),
        json['totalInMonth'] == null || json['totalInMonth'] == 0
            ? 0.0
            : json['totalInMonth'].toDouble(),
        json['totalLateDayInMonth'] as int,
        json['totalNotCheckoutDayInMonth'] as int,
        json['totalNotEnoughInMonth'] as int);
  }
}
