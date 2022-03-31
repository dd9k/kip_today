// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventDetailInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDetailInfo _$EventDetailInfoFromJson(Map<String, dynamic> json) {
  return EventDetailInfo(
    (json['id'] as num)?.toDouble(),
    json['eventName'] as String,
    json['branchId'] as int,
    json['contactPersonId'] as int,
    json['visitorType'] as String,
    json['startDate'] as String,
    json['endDate'] as String,
    json['description'] as String,
    json['coverPathFile'] as String,
    json['companyId'] as int,
    json['visitorTypeValue'] as String,
    json['contactPersonName'] as String,
    json['contactPersonPhone'] as String,
    json['contactPersonEmail'] as String,
    json['branchName'] as String,
    json['siteName'] as String,
    json['siteAddress'] as String,
    json['isPrint'] as int,
    json['badgeTemplateId'] as String,
  );
}

Map<String, dynamic> _$EventDetailInfoToJson(EventDetailInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventName': instance.eventName,
      'branchId': instance.branchId,
      'contactPersonId': instance.contactPersonId,
      'visitorType': instance.visitorType,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'description': instance.description,
      'coverPathFile': instance.coverPathFile,
      'companyId': instance.companyId,
      'visitorTypeValue': instance.visitorTypeValue,
      'contactPersonName': instance.contactPersonName,
      'contactPersonPhone': instance.contactPersonPhone,
      'contactPersonEmail': instance.contactPersonEmail,
      'branchName': instance.branchName,
      'siteName': instance.siteName,
      'siteAddress': instance.siteAddress,
      'isPrint': instance.isPrint,
      'badgeTemplateId': instance.badgeTemplateId,
    };
