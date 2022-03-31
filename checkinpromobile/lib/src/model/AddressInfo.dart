import 'package:json_annotation/json_annotation.dart';
part 'AddressInfo.g.dart';

@JsonSerializable()
class AddressInfo {
  @JsonKey(name: 'fullAddress')
  String fullAddress;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'country')
  String country;

  @JsonKey(name: 'stateProvince')
  String stateProvince;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'postalCode')
  String postalCode;

  AddressInfo(this.fullAddress, this.phone, this.country, this.stateProvince,
      this.city, this.postalCode);

  AddressInfo._();

  factory AddressInfo.fromJson(Map<String, dynamic> json) =>
      _$AddressInfoFromJson(json);
  Map<String, dynamic> toJson() => _$AddressInfoToJson(this);
}