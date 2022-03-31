// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventGuestOffline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventGuestOffline _$EventGuestOfflineFromJson(Map<String, dynamic> json) {
  return EventGuestOffline(
    (json['id'] as num)?.toDouble(),
    json['visitorName'] as String,
    json['visitorEmail'] as String,
    json['visitorPhoneNumber'] as String,
    json['inviteCode'] as String,
    json['checkinStatus'] as int,
    json['visitorType'] as String,
    json['visitorCompany'] as String,
    (json['emailLogId'] as num)?.toDouble(),
    json['description'] as String,
    (json['visitorLogId'] as num)?.toDouble(),
    json['totalCount'] as int,
    json['timezone'] as String,
    json['signIn'] as String,
    json['signOut'] as String,
  );
}

Map<String, dynamic> _$EventGuestOfflineToJson(EventGuestOffline instance) =>
    <String, dynamic>{
      'id': instance.guestId,
      'visitorName': instance.visitorName,
      'visitorEmail': instance.visitorEmail,
      'visitorPhoneNumber': instance.visitorPhoneNumber,
      'inviteCode': instance.inviteCode,
      'checkinStatus': instance.checkinStatus,
      'visitorType': instance.visitorType,
      'visitorCompany': instance.visitorCompany,
      'emailLogId': instance.emailLogId,
      'description': instance.description,
      'visitorLogId': instance.visitorLogId,
      'totalCount': instance.totalCount,
      'timezone': instance.timezone,
      'signIn': instance.signIn,
      'signOut': instance.signOut,
    };
