// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BranchInfor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchInfor _$BranchInforFromJson(Map<String, dynamic> json) {
  return BranchInfor(
    (json['code'] as num)?.toDouble(),
    (json['id'] as num)?.toDouble(),
    json['name'] as String,
    json['timeZoneOffsetHour'] as int,
  );
}

Map<String, dynamic> _$BranchInforToJson(BranchInfor instance) =>
    <String, dynamic>{
      'code': instance.branchCode,
      'id': instance.branchId,
      'name': instance.branchName,
      'timeZoneOffsetHour': instance.timeZoneOffsetHour,
    };
