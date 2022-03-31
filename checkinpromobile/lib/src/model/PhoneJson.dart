import 'package:json_annotation/json_annotation.dart';

import 'AddressInfo.dart';
import 'JobInfo.dart';
import 'NotificationInfo.dart';
import 'Office.dart';
import 'PersonalInfo.dart';

part 'PhoneJson.g.dart';

@JsonSerializable()
class PhoneJson{

  @JsonKey(name: 'number')
  String number;

  @JsonKey(name: 'internationalNumber')
  String internationalNumber;

  @JsonKey(name: 'nationalNumber')
  String nationalNumber;

  @JsonKey(name: 'e164Number')
  String   e164Number;

  @JsonKey(name: 'countryCode')
  String countryCode;

  @JsonKey(name: 'dialCode')
  double dialCode;


  PhoneJson(this.number, this.internationalNumber, this.nationalNumber, this.e164Number, this.countryCode, this.dialCode);

  PhoneJson._();

  factory PhoneJson.fromJson(Map<String, dynamic> json) => _$PhoneJsonFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneJsonToJson(this);
}