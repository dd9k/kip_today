// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ETOrderDetailInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ETOrderDetailInfo _$ETOrderDetailInfoFromJson(Map<String, dynamic> json) {
  return ETOrderDetailInfo(
    (json['id'] as num)?.toDouble(),
    (json['orderId'] as num)?.toDouble(),
    (json['ticketId'] as num)?.toDouble(),
    (json['quantity'] as num)?.toDouble(),
    (json['amount'] as num)?.toDouble(),
    (json['discountId'] as num)?.toDouble(),
    json['inviteCode'] as String,
    json['status'] as String,
    json['ticketName'] as String,
    (json['ticketPrice'] as num)?.toDouble(),
    (json['ticketIsFree'] as num)?.toDouble(),
    (json['ticketQuantity'] as num)?.toDouble(),
    json['ticketStartDate'] as String,
    json['ticketEndDate'] as String,
  );
}

Map<String, dynamic> _$ETOrderDetailInfoToJson(ETOrderDetailInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'ticketId': instance.ticketId,
      'quantity': instance.quantity,
      'amount': instance.amount,
      'discountId': instance.discountId,
      'inviteCode': instance.inviteCode,
      'status': instance.status,
      'ticketName': instance.ticketName,
      'ticketPrice': instance.ticketPrice,
      'ticketIsFree': instance.ticketIsFree,
      'ticketQuantity': instance.ticketQuantity,
      'ticketStartDate': instance.ticketStartDate,
      'ticketEndDate': instance.ticketEndDate,
    };
