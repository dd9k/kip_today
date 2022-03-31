import 'package:json_annotation/json_annotation.dart';

import 'BranchInfor.dart';
import 'CompanyInfor.dart';
import 'CompanyLanguage.dart';
import 'LocationInfor.dart';

part 'UserInfor.g.dart';

@JsonSerializable()
class UserInfor {
  @JsonKey(name: 'accountId')
  int accountId;

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'fullName')
  String fullName;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'fingerprint')
  String fingerprint;

  @JsonKey(name: 'phoneNumber')
  String phoneNumber;

  @JsonKey(name: 'pushNotification')
  String pushNotification;

  @JsonKey(name: 'pushEmail')
  String pushEmail;

  @JsonKey(name: 'companyInfo')
  CompanyInfor companyInfo;

  @JsonKey(name: 'locationInfo')
  LocationInfor locationInfo;

  @JsonKey(name: 'companyLanguage')
  List<CompanyLanguage> companyLanguage;

  @JsonKey(name: 'branchInfo')
  List<BranchInfor> branchInfo;

  @JsonKey(name: 'firstLogin')
  bool firstLogin;

  @JsonKey(name: 'isBuilding')
  bool isBuilding;

  UserInfor(
      this.accountId,
      this.userName,
      this.fullName,
      this.email,
      this.fingerprint,
      this.phoneNumber,
      this.pushNotification,
      this.pushEmail,
      this.companyInfo,
      this.locationInfo,
      this.companyLanguage,
      this.branchInfo,
      this.firstLogin,
      this.isBuilding);

  UserInfor._();

  factory UserInfor.fromJson(Map<String, dynamic> json) =>
      _$UserInforFromJson(json);
}
