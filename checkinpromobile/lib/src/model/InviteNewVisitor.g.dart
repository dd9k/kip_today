// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'InviteNewVisitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InviteNewVisitor _$InviteNewVisitorFromJson(Map<String, dynamic> json) {
  return InviteNewVisitor(
    (json['id'] as num)?.toDouble(),
    json['invitationName'] as String,
    (json['branchId'] as num)?.toDouble(),
    json['branchName'] as String,
    json['branchAddress'] as String,
    json['visitorType'] as String,
    json['visitorTypeValue'] as String,
    json['startDate'] as String,
    json['description'] as String,
    (json['guests'] as List)
        ?.map((e) =>
            e == null ? null : NewVisitor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['endDate'] as String,
    json['color'] as String,
    json['status'] as String,
  );
}

Map<String, dynamic> _$InviteNewVisitorToJson(InviteNewVisitor instance) =>
    <String, dynamic>{
      'invitationName': instance.invitationName,
      'branchId': instance.branchId,
      'branchName': instance.branchName,
      'branchAddress': instance.branchAddress,
      'visitorType': instance.visitorType,
      'visitorTypeValue': instance.visitorTypeValue,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'color': instance.color,
      'description': instance.description,
      'guests': instance.guests,
      'id': instance.id,
      'status': instance.status,
    };
