import 'package:json_annotation/json_annotation.dart';

part 'EventGuestOffline.g.dart';

@JsonSerializable()
class EventGuestOffline {
  @JsonKey(name: 'id')
  double guestId;

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
  String visitorCompany;

  @JsonKey(name: 'emailLogId')
  double emailLogId;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'visitorLogId')
  double visitorLogId;

  @JsonKey(name: 'totalCount')
  int totalCount;

  @JsonKey(name: 'timezone')
  String timezone;

  @JsonKey(name: 'signIn')
  String signIn;

  @JsonKey(name: 'signOut')
  String signOut;

  @JsonKey(ignore: true)
  double eventId;

  EventGuestOffline(
      this.guestId,
      this.visitorName,
      this.visitorEmail,
      this.visitorPhoneNumber,
      this.inviteCode,
      this.checkinStatus,
      this.visitorType,
      this.visitorCompany,
      this.emailLogId,
      this.description,
      this.visitorLogId,
      this.totalCount,
      this.timezone,
      this.signIn,
      this.signOut);

  EventGuestOffline.local(
      this.guestId,
      this.visitorName,
      this.visitorEmail,
      this.visitorPhoneNumber,
      this.inviteCode,
      this.checkinStatus,
      this.visitorType,
      this.visitorCompany,
      this.emailLogId,
      this.description,
      this.visitorLogId,
      this.totalCount,
      this.timezone,
      this.signIn,
      this.signOut,
      this.eventId);

  factory EventGuestOffline.fromJson(Map<String, dynamic> json) =>
      _$EventGuestOfflineFromJson(json);

  Map<String, dynamic> toJson() => _$EventGuestOfflineToJson(this);
}
