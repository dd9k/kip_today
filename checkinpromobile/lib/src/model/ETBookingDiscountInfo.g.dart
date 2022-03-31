// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ETBookingDiscountInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ETBookingDiscountInfo _$ETBookingDiscountInfoFromJson(
    Map<String, dynamic> json) {
  return ETBookingDiscountInfo(
    (json['id'] as num)?.toDouble(),
    (json['ticketId'] as num)?.toDouble(),
    (json['discountValue'] as num)?.toDouble(),
    json['discountUnit'] as String,
    (json['bookingQuantity'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ETBookingDiscountInfoToJson(
        ETBookingDiscountInfo instance) =>
    <String, dynamic>{
      'id': instance.idBookingDiscount,
      'ticketId': instance.ticketId,
      'discountValue': instance.discountValue,
      'discountUnit': instance.discountUnit,
      'bookingQuantity': instance.bookingQuantity,
    };
