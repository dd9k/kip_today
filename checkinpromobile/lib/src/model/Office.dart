import 'package:json_annotation/json_annotation.dart';
part 'Office.g.dart';

@JsonSerializable()
class Office {

  @JsonKey(name: 'id')
  double id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'isActive')
  double isActive;

  @JsonKey(name: 'timeZoneOffsetHour')
  int timeZoneOffsetHour;


  Office(this.id, this.name, this.isActive, this.timeZoneOffsetHour);

  Office._();

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);

  Map<String, dynamic> toJson() => _$OfficeToJson(this);
}