import 'package:json_annotation/json_annotation.dart';
part 'LineManager.g.dart';

@JsonSerializable()
class LineManager {

  @JsonKey(name: 'id')
  double id;

  @JsonKey(name: 'fullName')
  String fullName;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'phone')
  String phone;


  LineManager(this.id, this.fullName, this.email, this.phone);

  LineManager._();

  factory LineManager.fromJson(Map<String, dynamic> json) =>
      _$LineManagerFromJson(json);
  Map<String, dynamic> toJson() => _$LineManagerToJson(this);
}