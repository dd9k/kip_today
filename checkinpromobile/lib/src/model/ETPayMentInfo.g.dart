// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ETPayMentInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ETPayMentInfo _$ETPayMentInfoFromJson(Map<String, dynamic> json) {
  return ETPayMentInfo(
    (json['id'] as num)?.toDouble(),
    (json['eventId'] as num)?.toDouble(),
    json['paymentType'] as String,
    json['accountName'] as String,
    json['accountNo'] as String,
    json['bankName'] as String,
    json['bankBranchName'] as String,
  );
}

Map<String, dynamic> _$ETPayMentInfoToJson(ETPayMentInfo instance) =>
    <String, dynamic>{
      'id': instance.idPayment,
      'eventId': instance.eventId,
      'paymentType': instance.paymentType,
      'accountName': instance.accountName,
      'accountNo': instance.accountNo,
      'bankName': instance.bankName,
      'bankBranchName': instance.bankBranchName,
    };
