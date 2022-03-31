// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ETTicketInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ETTicketInfo _$ETTicketInfoFromJson(Map<String, dynamic> json) {
  return ETTicketInfo(
    (json['id'] as num)?.toDouble(),
    (json['eventId'] as num)?.toDouble(),
    (json['remainingTicketQuantity'] as num)?.toDouble(),
    json['ticketName'] as String,
    (json['ticketPrice'] as num)?.toDouble(),
    (json['isFree'] as num)?.toDouble(),
    (json['ticketQuantity'] as num)?.toDouble(),
    (json['maxQuantity'] as num)?.toDouble(),
    (json['minQuantity'] as num)?.toDouble(),
    json['description'] as String,
    json['eventStartDate'] as String,
    json['eventEndDate'] as String,
    json['startDate'] as String,
    json['endDate'] as String,
    (json['bookingDiscountInfo'] as List)
        ?.map((e) => e == null
            ? null
            : ETBookingDiscountInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ETTicketInfoToJson(ETTicketInfo instance) =>
    <String, dynamic>{
      'id': instance.idTicketInfo,
      'eventId': instance.eventId,
      'remainingTicketQuantity': instance.remainingTicketQuantity,
      'ticketName': instance.ticketName,
      'ticketPrice': instance.ticketPrice,
      'isFree': instance.isFree,
      'ticketQuantity': instance.ticketQuantity,
      'maxQuantity': instance.maxQuantity,
      'minQuantity': instance.minQuantity,
      'description': instance.description,
      'eventStartDate': instance.eventStartDate,
      'eventEndDate': instance.eventEndDate,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'bookingDiscountInfo': instance.bookingDiscountInfo,
    };
