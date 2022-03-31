import 'package:json_annotation/json_annotation.dart';

import 'PhoneJson.dart';
part 'EmployeeInfo.g.dart';

@JsonSerializable()
class EmployeeInfo {
  @JsonKey(name: 'phoneJson')
  String phoneJson;

  @JsonKey(name: 'id')
  double id;

  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'fullName')
  String fullName;

  @JsonKey(name: 'firstName')
  String firstName;

  @JsonKey(name: 'lastName')
  String lastName;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'fingerPrint')
  String fingerPrint;

  @JsonKey(name: 'pushNotification')
  String pushNotification;

  @JsonKey(name: 'pushEmail')
  String pushEmail;

  @JsonKey(name: 'companyName')
  String companyName;

  @JsonKey(name: 'companyId')
  double companyId;

  @JsonKey(name: 'companyAddress')
  String companyAddress;

  @JsonKey(name: 'avatarFileName')
  String avatarFileName;

  @JsonKey(name: 'mobileAvatar')
  String mobileAvatar;

  @JsonKey(name: 'avatarRepoId')
  double avatarRepoId;

  @JsonKey(name: 'jobTitle')
  String jobTitle;

  @JsonKey(name: 'language')
  String language;

  @JsonKey(name: 'isBuilding')
  int isBuilding;

  @JsonKey(name: 'ownerAccountId')
  int ownerAccountId;

  @JsonKey(name: 'firstLogin')
  double firstLogin;

  @JsonKey(name: 'effectedDate')
  String effectedDate;

  @JsonKey(name: 'expiredDate')
  String expiredDate;

  EmployeeInfo(
      this.phoneJson,
      this.id,
      this.username,
      this.fullName,
      this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.fingerPrint,
      this.pushNotification,
      this.pushEmail,
      this.companyName,
      this.companyId,
      this.companyAddress,
      this.avatarFileName,
      this.mobileAvatar,
      this.avatarRepoId,
      this.jobTitle,
      this.language,
      this.isBuilding,
      this.ownerAccountId,
      this.firstLogin,
      this.effectedDate,
      this.expiredDate);

  EmployeeInfo._();

  factory EmployeeInfo.fromJson(Map<String, dynamic> json) =>
      _$EmployeeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeInfoToJson(this);
}
