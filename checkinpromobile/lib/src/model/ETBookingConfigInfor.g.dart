// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ETBookingConfigInfor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ETBookingConfigInfor _$ETBookingConfigInforFromJson(Map<String, dynamic> json) {
  return ETBookingConfigInfor(
    (json['id'] as num)?.toDouble(),
    (json['eventId'] as num)?.toDouble(),
    json['bookingLink'] as String,
    json['emailTemplateContent'] as String,
    json['bookingField'] as String,
  );
}

Map<String, dynamic> _$ETBookingConfigInforToJson(
        ETBookingConfigInfor instance) =>
    <String, dynamic>{
      'id': instance.idBooking,
      'eventId': instance.eventId,
      'bookingLink': instance.bookingLink,
      'emailTemplateContent': instance.emailTemplateContent,
      'bookingField': instance.bookingField,
    };
