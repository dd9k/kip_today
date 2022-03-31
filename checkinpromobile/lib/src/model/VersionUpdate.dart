import 'package:json_annotation/json_annotation.dart';
part 'VersionUpdate.g.dart';

@JsonSerializable()
class VersionUpdate {
  @JsonKey(name: 'version')
  String version;

  @JsonKey(name: 'mandatory')
  bool mandatory;

  VersionUpdate(this.version, this.mandatory);

  VersionUpdate._();

  factory VersionUpdate.fromJson(Map<String, dynamic> json) =>
      _$VersionUpdateFromJson(json);
  Map<String, dynamic> toJson() => _$VersionUpdateToJson(this);
}