import 'package:json_annotation/json_annotation.dart';
import 'package:checkinpromobile/src/database/Database.dart';
part 'ETBookingConfigInfor.g.dart';

@JsonSerializable()
class ETBookingConfigInfor {
  @JsonKey(name: 'id')
  double idBooking;

  @JsonKey(name: 'eventId')
  double eventId;

  @JsonKey(name: 'bookingLink')
  String bookingLink;

  @JsonKey(name: 'emailTemplateContent')
  String emailTemplateContent;

  @JsonKey(name: "bookingField")
  String bookingField;

  ETBookingConfigInfor.normal(
    this.idBooking,
    this.eventId,
    this.bookingLink,
    this.emailTemplateContent,
    this.bookingField,
  );

  ETBookingConfigInfor(
    this.idBooking,
    this.eventId,
    this.bookingLink,
    this.emailTemplateContent,
    this.bookingField,
  );

  ETBookingConfigInfor.local(
    this.idBooking,
    this.eventId,
    this.bookingLink,
    this.emailTemplateContent,
    this.bookingField,
  );
  ETBookingConfigInfor.copyWithEntity(ETBookingConfigInforAllEntry entry) {
    this.idBooking = entry.idBooking;
    this.eventId = entry.eventId;
    this.bookingLink = entry.bookingLink;
    this.emailTemplateContent = entry.emailTemplateContent;
    this.bookingField = entry.bookingField;
  }

  factory ETBookingConfigInfor.fromJson(Map<String, dynamic> json) =>
      _$ETBookingConfigInforFromJson(json);

  Map<String, dynamic> toJson() => _$ETBookingConfigInforToJson(this);
}
