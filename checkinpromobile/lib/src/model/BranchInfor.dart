import 'package:json_annotation/json_annotation.dart';

part 'BranchInfor.g.dart';

@JsonSerializable()
class BranchInfor {
  @JsonKey(name: 'code')
  double branchCode;

  @JsonKey(name: 'id')
  double branchId;

  @JsonKey(name: 'name')
  String branchName;

  @JsonKey(name: 'timeZoneOffsetHour')
  int timeZoneOffsetHour;

  @JsonKey(ignore: true)
  bool isSelect = false;

  // ignore: unused_element
  BranchInfor._();

  BranchInfor(
      this.branchCode, this.branchId, this.branchName, this.timeZoneOffsetHour);

  factory BranchInfor.fromJson(Map<String, dynamic> json) =>
      _$BranchInforFromJson(json);

  Map<String, dynamic> toJson() => _$BranchInforToJson(this);

  // Custom comparing function to check if two users are equal
  bool isEqual(BranchInfor model) {
    return this?.branchId == model?.branchId;
  }
}
