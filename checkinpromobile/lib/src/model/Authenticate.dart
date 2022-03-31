import 'package:json_annotation/json_annotation.dart';

import 'EmployeeInfo.dart';
import 'IdEmployeeInfo.dart';

part 'Authenticate.g.dart';

@JsonSerializable()
class Authenticate {
  @JsonKey(name: 'accessToken')
  String accessToken;

  @JsonKey(name: 'refreshToken')
  String refreshToken;

  @JsonKey(name: 'expired')
  String expired;

  @JsonKey(name: 'tokenType')
  String tokenType;

  @JsonKey(name: 'isEventTicket')
  bool isEventTicket;

  @JsonKey(name: 'employeeInfo')
  IdEmployeeInfo employeeInfo;

  Authenticate._();

  Authenticate(String accessToken, String refreshToken, String expired,
      String tokenType, IdEmployeeInfo employeeInfo, bool isEventTicket) {
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
    this.expired = expired;
    this.tokenType = tokenType;
    this.employeeInfo = employeeInfo;
    this.isEventTicket = isEventTicket;
  }

  factory Authenticate.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateToJson(this);
}
