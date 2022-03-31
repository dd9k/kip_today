// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WelcomeMessage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WelcomeMessage _$WelcomeMessageFromJson(Map<String, dynamic> json) {
  return WelcomeMessage(
    json['id'] as int,
    json['messageContent'] as String,
    json['type'] as String,
    (json['locationId'] as num)?.toDouble(),
    (json['companyId'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WelcomeMessageToJson(WelcomeMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'messageContent': instance.messageContent,
      'type': instance.type,
      'locationId': instance.locationId,
      'companyId': instance.companyId,
    };
