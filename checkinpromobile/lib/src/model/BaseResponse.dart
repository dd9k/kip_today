import 'package:json_annotation/json_annotation.dart';

part 'BaseResponse.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'success')
  bool success;

  @JsonKey(name: 'data')
  Map<String, dynamic> data;

  @JsonKey(name: 'messages')
  List<String> errors;


  BaseResponse._();

  BaseResponse(bool success, Map<String, dynamic> data, List<String> errors) {
    this.success = success;
    this.data = data;
    this.errors = errors;
  }

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);
}

