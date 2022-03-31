// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CheckInFlow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckInFlow _$CheckInFlowFromJson(Map<String, dynamic> json) {
  return CheckInFlow(
    json['stepName'] as String,
    json['stepCode'] as String,
    json['stepType'] as String,
    json['isRequired'] as bool,
    json['sort'] as int,
    json['isShow'] as bool,
  );
}

Map<String, dynamic> _$CheckInFlowToJson(CheckInFlow instance) =>
    <String, dynamic>{
      'stepName': instance.stepName,
      'stepCode': instance.stepCode,
      'stepType': instance.stepType,
      'isRequired': instance.isRequired,
      'sort': instance.sort,
      'isShow': instance.isShow,
    };
