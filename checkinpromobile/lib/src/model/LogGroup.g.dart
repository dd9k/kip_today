// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LogGroup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogGroup _$LogGroupFromJson(Map<String, dynamic> json) {
  return LogGroup(
    (json['inviteNewVisitor'] as List)
        ?.map((e) =>
            e == null ? null : VisitorLog.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['signIn'] as String,
    json['signOut'] as String,
  );
}

Map<String, dynamic> _$LogGroupToJson(LogGroup instance) => <String, dynamic>{
      'inviteNewVisitor': instance.logVisitor,
      'signIn': instance.signIn,
      'signOut': instance.signOut,
    };
