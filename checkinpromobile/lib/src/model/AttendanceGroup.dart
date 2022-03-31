import 'package:json_annotation/json_annotation.dart';
import 'AttendanceDetailResponse.dart';

part 'AttendanceGroup.g.dart';

@JsonSerializable()
class AttendanceGroup {
  @JsonKey(name: 'listDetail')
  List<AttendanceDetail> listDetail;

  @JsonKey(name: 'weekRange')
  String weekRange;

  AttendanceGroup.init();

  AttendanceGroup(this.listDetail, this.weekRange);

  factory AttendanceGroup.fromJson(Map<String, dynamic> json) =>
      _$AttendanceGroupFromJson(json);
}
