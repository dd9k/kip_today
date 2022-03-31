// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EmployeeSearch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeSearch _$EmployeeSearchFromJson(Map<String, dynamic> json) {
  return EmployeeSearch(
    json['totalCount'] as int,
    (json['employees'] as List)
        ?.map((e) => e == null
            ? null
            : IdEmployeeInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EmployeeSearchToJson(EmployeeSearch instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'employees': instance.employees,
    };
