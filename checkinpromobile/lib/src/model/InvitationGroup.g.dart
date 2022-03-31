// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'InvitationGroup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvitationGroup _$InvitationGroupFromJson(Map<String, dynamic> json) {
  return InvitationGroup(
    (json['inviteNewVisitor'] as List)
        ?.map((e) => e == null
            ? null
            : InviteNewVisitor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['startDate'] as String,
  );
}

Map<String, dynamic> _$InvitationGroupToJson(InvitationGroup instance) =>
    <String, dynamic>{
      'inviteNewVisitor': instance.inviteNewVisitor,
      'startDate': instance.startDate,
    };
