// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ETNewOrder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ETNewOrder _$ETNewOrderFromJson(Map<String, dynamic> json) {
  return ETNewOrder(
    json['fullName'] as String,
    json['emailAddress'] as String,
    json['phoneNumber'] as String,
    json['idCard'] as String,
    json['company'] as String,
    json['position'] as String,
    (json['eventId'] as num)?.toDouble(),
    json['paymentType'] as String,
    (json['totalAmount'] as num)?.toDouble(),
    (json['quantity'] as num)?.toDouble(),
    (json['amount'] as num)?.toDouble(),
    (json['discountId'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ETNewOrderToJson(ETNewOrder instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'idCard': instance.idCard,
      'company': instance.company,
      'position': instance.position,
      'eventId': instance.eventId,
      'paymentType': instance.paymentType,
      'totalAmount': instance.totalAmount,
      'quantity': instance.quantity,
      'amount': instance.amount,
      'discountId': instance.discountId,
    };
