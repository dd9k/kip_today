// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventGuest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventGuest _$EventGuestFromJson(Map<String, dynamic> json) {
  return EventGuest(
    (json['eventId'] as num)?.toDouble(),
    json['visitorName'] as String,
    json['visitorEmail'] as String,
    json['visitorPhoneNumber'] as String,
    json['inviteCode'] as String,
    json['checkinStatus'] as int,
    json['visitorType'] as String,
    json['visitorCompany'] as String,
    json['signIn'] as String,
    json['signOut'] as String,
    json['timezone'] as String,
    (json['id'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$EventGuestToJson(EventGuest instance) =>
    <String, dynamic>{
      'visitorName': instance.visitorName,
      'visitorEmail': instance.visitorEmail,
      'visitorPhoneNumber': instance.visitorPhoneNumber,
      'inviteCode': instance.inviteCode,
      'checkinStatus': instance.checkinStatus,
      'visitorType': instance.visitorType,
      'visitorCompany': instance.fromCompany,
      'eventId': instance.eventId,
      'signIn': instance.signIn,
      'signOut': instance.signOut,
      'timezone': instance.timezone,
      'id': instance.id,
    };
