import 'package:json_annotation/json_annotation.dart';

part 'CompanyInfor.g.dart';
@JsonSerializable()
class CompanyInfor {
  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'companyName')
  String name;

  @JsonKey(name: 'companyId')
  double id;

  @JsonKey(name: 'address')
  String address;

  CompanyInfor(String code, String name, double id, String address) {
    this.code = code;
    this.name = name;
    this.id = id;
    this.address = address;
  }

  factory CompanyInfor.fromJson(Map<String, dynamic> json) => _$CompanyInforFromJson(json);
}