// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReminderInvitation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReminderInvitation _$ReminderInvitationFromJson(Map<String, dynamic> json) {
  return ReminderInvitation(
    json['titleNoti'] as String,
    json['contentNoti'] as String,
    json['delayNoti'] as int,
    json['reminderValue'] as int,
    (json['idInvitation'] as num)?.toDouble(),
    json['invitation'] == null
        ? null
        : InviteNewVisitor.fromJson(json['invitation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ReminderInvitationToJson(ReminderInvitation instance) =>
    <String, dynamic>{
      'titleNoti': instance.titleNoti,
      'contentNoti': instance.contentNoti,
      'delayNoti': instance.delayNoti,
      'reminderValue': instance.reminderValue,
      'idInvitation': instance.idInvitation,
      'invitation': instance.invitation,
    };
