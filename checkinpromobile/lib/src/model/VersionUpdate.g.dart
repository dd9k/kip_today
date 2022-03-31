// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VersionUpdate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionUpdate _$VersionUpdateFromJson(Map<String, dynamic> json) {
  return VersionUpdate(
    json['version'] as String,
    json['mandatory'] as bool,
  );
}

Map<String, dynamic> _$VersionUpdateToJson(VersionUpdate instance) =>
    <String, dynamic>{
      'fullAddress': instance.version,
      'phone': instance.mandatory,
    };
