// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotificationInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationInfo _$NotificationInfoFromJson(Map<String, dynamic> json) {
  return NotificationInfo(
    json['pinHostScreen'] as int,
    json['pushEmail'] as int,
    json['pushNotification'] as int,
    json['fingerPrint'] as int,
    json['viber'] as int,
    json['zalo'] as int,
  );
}

Map<String, dynamic> _$NotificationInfoToJson(NotificationInfo instance) =>
    <String, dynamic>{
      'pinHostScreen': instance.pinHostScreen,
      'pushEmail': instance.pushEmail,
      'pushNotification': instance.pushNotification,
      'fingerPrint': instance.fingerPrint,
      'viber': instance.viber,
      'zalo': instance.zalo,
    };
