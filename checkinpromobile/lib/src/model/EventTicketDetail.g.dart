// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventTicketDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventTicketDetail _$EventTicketDetailFromJson(Map<String, dynamic> json) {
  return EventTicketDetail(
    json['eventInfo'] == null
        ? null
        : EventTicket.fromJson(json['eventInfo'] as Map<String, dynamic>),
    json['ticketInfo'] == null
        ? null
        : ETTicketInfo.fromJson(json['ticketInfo'] as Map<String, dynamic>),
    json['paymentInfo'] == null
        ? null
        : ETPayMentInfo.fromJson(json['paymentInfo'] as Map<String, dynamic>),
    json['settingInfo'] == null
        ? null
        : ETBookingConfigInfor.fromJson(
            json['settingInfo'] as Map<String, dynamic>),
    (json['orderInfo'] as List)
        ?.map((e) =>
            e == null ? null : ETOrderInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['paymentTypes'] as List)
        ?.map((e) => e == null
            ? null
            : ETPaymentType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EventTicketDetailToJson(EventTicketDetail instance) =>
    <String, dynamic>{
      'eventInfo': instance.eventInfo,
      'ticketInfo': instance.ticketInfo,
      'paymentInfo': instance.paymentInfo,
      'settingInfo': instance.settingInfo,
      'orderInfo': instance.orderInfo,
      'paymentTypes': instance.paymentTypes,
    };
