import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class VisitorInviteCheckinSync {
  @JsonKey(ignore: true)
  int id;

  @JsonKey(name: 'signIn')
  String signIn;

  @JsonKey(name: 'timezone')
  String timezone;

  @JsonKey(name: 'signOut')
  String signOut;

  @JsonKey(name: 'invitationId')
  double invitationId;

  @JsonKey(name: 'inviteCode')
  String inviteCode;

  @JsonKey(name: 'visitorName')
  String visitorName;

  @JsonKey(name: 'visitorType')
  String visitorType;

  @JsonKey(name: 'visitorEmail')
  String visitorEmail;

  @JsonKey(name: 'visitorPhoneNumber')
  String visitorPhoneNumber;

  @JsonKey(name: 'branchId')
  double branchId;

  @JsonKey(name: 'contactPersonId')
  double contactPersonId;

  VisitorInviteCheckinSync(
      this.id,
      this.signIn,
      this.timezone,
      this.signOut,
      this.invitationId,
      this.inviteCode,
      this.visitorName,
      this.visitorType,
      this.visitorEmail,
      this.visitorPhoneNumber,
      this.branchId,
      this.contactPersonId);

  VisitorInviteCheckinSync.insertLocal(
      this.signIn,
      this.timezone,
      this.invitationId,
      this.inviteCode,
      this.visitorName,
      this.visitorType,
      this.visitorEmail,
      this.visitorPhoneNumber,
      this.branchId,
      this.contactPersonId);

  Map<String, dynamic> toJson() {
    return {
      'signIn': this.signIn,
      'signOut': this.signOut,
      'timezone': this.timezone,
      'invitationId': this.invitationId,
      'inviteCode': this.inviteCode,
      'visitorName': this.visitorName,
      'visitorType': this.visitorType,
      'visitorEmail': this.visitorEmail,
      'visitorPhoneNumber': this.visitorPhoneNumber,
      'branchId': this.branchId,
      'contactPersonId': this.contactPersonId,
    };
  }
}
