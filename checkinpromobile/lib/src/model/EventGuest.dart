import 'package:json_annotation/json_annotation.dart';

part 'EventGuest.g.dart';

@JsonSerializable()
class EventGuest {
  @JsonKey(name: 'visitorName')
  String visitorName;

  @JsonKey(name: 'visitorEmail')
  String visitorEmail;

  @JsonKey(name: 'visitorPhoneNumber')
  String visitorPhoneNumber;

  @JsonKey(name: 'inviteCode')
  String inviteCode;

  @JsonKey(name: 'checkinStatus')
  int checkinStatus;

  @JsonKey(name: 'visitorType')
  String visitorType;

  @JsonKey(name: 'visitorCompany')
  String fromCompany;

  @JsonKey(name: 'eventId')
  double eventId;

  @JsonKey(name: 'signIn')
  String signIn;

  @JsonKey(name: 'signOut')
  String signOut;

  @JsonKey(name: "timezone")
  String timezone;

  @JsonKey(name: 'id')
  double id;

  @JsonKey(ignore: true)
  int totalCount;

  EventGuest.normal(
      this.visitorName,
      this.visitorEmail,
      this.visitorPhoneNumber,
      this.inviteCode,
      this.checkinStatus,
      this.visitorType,
      this.fromCompany);

  EventGuest(
      this.eventId,
      this.visitorName,
      this.visitorEmail,
      this.visitorPhoneNumber,
      this.inviteCode,
      this.checkinStatus,
      this.visitorType,
      this.fromCompany,
      this.signIn,
      this.signOut,
      this.timezone,
      this.id);

  EventGuest.local(
      this.eventId,
      this.visitorName,
      this.visitorEmail,
      this.visitorPhoneNumber,
      this.visitorType,
      this.inviteCode,
      this.checkinStatus,
      this.fromCompany,
      this.signIn,
      this.signOut,
      this.timezone,
      this.id,
      this.totalCount);

  factory EventGuest.fromJson(Map<String, dynamic> json) =>
      _$EventGuestFromJson(json);

  Map<String, dynamic> toJson() => _$EventGuestToJson(this);
}
