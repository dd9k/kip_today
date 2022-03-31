// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CompanyInfor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyInfor _$CompanyInforFromJson(Map<String, dynamic> json) {
  return CompanyInfor(
    json['code'] as String,
    json['companyName'] as String,
    (json['companyId'] as num)?.toDouble(),
    json['address'] as String,
  );
}

Map<String, dynamic> _$CompanyInforToJson(CompanyInfor instance) =>
    <String, dynamic>{
      'code': instance.code,
      'companyName': instance.name,
      'companyId': instance.id,
      'address': instance.address,
    };
