import 'package:json_annotation/json_annotation.dart';

part 'VisitorType.g.dart';

@JsonSerializable()
class VisitorType {
  @JsonKey(name: 'settingType')
  String settingType;

  @JsonKey(name: 'settingKey')
  String settingKey;

  @JsonKey(name: 'settingValue')
  String settingValue;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(ignore: true)
  String settingName;

  factory VisitorType.fromJson(Map<String, dynamic> json) =>
      _$VisitorTypeFromJson(json);

  VisitorType(
      this.settingType, this.settingKey, this.settingValue, this.description);

  VisitorType._();

  // Custom comparing function to check if two users are equal
  bool isEqual(VisitorType model) {
    return this?.settingKey == model?.settingKey;
  }
}
