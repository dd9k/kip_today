// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IntegrationSettingInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntegrationSettingInfo _$IntegrationSettingInfoFromJson(
    Map<String, dynamic> json) {
  return IntegrationSettingInfo(
    json['zalo'] as int,
    json['viber'] as int,
  );
}

Map<String, dynamic> _$IntegrationSettingInfoToJson(
        IntegrationSettingInfo instance) =>
    <String, dynamic>{
      'zalo': instance.zalo,
      'viber': instance.viber,
    };
