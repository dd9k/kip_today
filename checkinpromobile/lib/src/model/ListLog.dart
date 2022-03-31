import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/model/VisitorLog.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ListLog.g.dart';

@JsonSerializable()
class ListLog {
  @JsonKey(name: 'today')
  List<VisitorLog> today;

  @JsonKey(name: 'tomorrow')
  List<VisitorLog> tomorrow;

  @JsonKey(name: 'int')
  int total;


  ListLog(this.today, this.tomorrow, this.total);

  factory ListLog.fromJson(Map<String, dynamic> json) =>
      _$ListLogFromJson(json);

  Map<String, dynamic> toJson() => _$ListLogToJson(this);
}
