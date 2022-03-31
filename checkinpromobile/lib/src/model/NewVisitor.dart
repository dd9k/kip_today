import 'package:json_annotation/json_annotation.dart';

import 'IdEmployeeInfo.dart';

part 'NewVisitor.g.dart';

@JsonSerializable()
class NewVisitor {
  @JsonKey(name: 'visitorName')
  String visitorName;

  @JsonKey(name: 'visitorEmail')
  String visitorEmail;

  @JsonKey(name: 'visitorPhoneNumber')
  String visitorPhoneNumber;

  @JsonKey(name: 'visitorCompany')
  String visitorCompany;

  @JsonKey(name: 'inviteCode')
  String inviteCode;

  @JsonKey(name: 'avatarFileName')
  String visitorAvatarFileName;

  @JsonKey(name: 'id')
  double id;

  // ignore: unused_element
  NewVisitor._();

  NewVisitor(
    String visitorName,
    String visitorEmail,
    String visitorPhoneNumber,
    String visitorCompany,
    String visitorAvatarFileName,
    double id,
  ) {
    this.visitorName = visitorName;
    this.visitorEmail = visitorEmail;
    this.visitorPhoneNumber = visitorPhoneNumber;
    this.visitorCompany = visitorCompany;
    this.visitorAvatarFileName = visitorAvatarFileName;
    this.id = id;
  }

  NewVisitor.withEmployee(
      IdEmployeeInfo employeeInfo
      ) {
    this.visitorName = employeeInfo.personalInfo.fullName;
    this.visitorEmail = employeeInfo.personalInfo.email;
    this.visitorPhoneNumber = employeeInfo.personalInfo.phone;
    this.visitorCompany = employeeInfo.companyName;
    this.visitorAvatarFileName = employeeInfo.personalInfo.avatarFileName;
  }

  NewVisitor.local(
    String visitorName,
    String visitorEmail,
    String visitorPhoneNumber,
    String visitorCompany,
    String inviteCode,
    String visitorAvatarFileName,
    double id,
  ) {
    this.visitorName = visitorName;
    this.visitorEmail = visitorEmail;
    this.visitorPhoneNumber = visitorPhoneNumber;
    this.visitorCompany = visitorCompany;
    this.inviteCode = inviteCode;
    this.visitorAvatarFileName = visitorAvatarFileName;
    this.id = id;
  }

  factory NewVisitor.fromJson(Map<String, dynamic> json) =>
      _$NewVisitorFromJson(json);

  Map<String, dynamic> toJson() => _$NewVisitorToJson(this);

  @override
  bool operator ==(Object other) {
    if (other is NewVisitor) {
      return this.visitorEmail == other.visitorEmail &&
          this.visitorName == other.visitorName;
    }
    return false;
  }

  @override
  int get hashCode => super.hashCode;
}
