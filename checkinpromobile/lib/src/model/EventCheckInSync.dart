import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class EventCheckInSync {
  @JsonKey(ignore: true)
  int idSync; // Use For local DB

  @JsonKey(name: "id")
  double id;

  @JsonKey(name: "signIn")
  String signIn;

  @JsonKey(name: "signOut")
  String signOut;

  @JsonKey(name: "timezone")
  String timezone;

  @JsonKey(name: "eventId")
  double eventId;

  @JsonKey(name: "inviteCode")
  String inviteCode;

  @JsonKey(name: "visitorName")
  String visitorName;

  @JsonKey(name: "visitorType")
  String visitorType;

  @JsonKey(name: "visitorEmail")
  String visitorEmail;

  @JsonKey(name: "visitorPhoneNumber")
  String visitorPhoneNumber;

  @JsonKey(name: "branchId")
  double branchId;

  @JsonKey(name: "contactPersonId")
  double contactPersonId;

  EventCheckInSync(
      this.idSync,
      this.id,
      this.signIn,
      this.signOut,
      this.timezone,
      this.eventId,
      this.inviteCode,
      this.visitorName,
      this.visitorType,
      this.visitorEmail,
      this.visitorPhoneNumber,
      this.branchId,
      this.contactPersonId);

  EventCheckInSync.init();

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': this.id,
      'signIn': this.signIn,
      'signOut': this.signOut,
      'timezone': this.timezone,
      'eventId': this.eventId,
      'inviteCode': this.inviteCode,
      'visitorName': this.visitorName,
      'visitorType': this.visitorType,
      'visitorEmail': this.visitorEmail,
      'visitorPhoneNumber': this.visitorPhoneNumber,
      'branchId': this.branchId,
      'contactPersonId': this.contactPersonId
    };
  }
}
