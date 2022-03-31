// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LineManager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LineManager _$LineManagerFromJson(Map<String, dynamic> json) {
  return LineManager(
    (json['id'] as num)?.toDouble(),
    json['fullName'] as String,
    json['email'] as String,
    json['phone'] as String,
  );
}

Map<String, dynamic> _$LineManagerToJson(LineManager instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
    };
