// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemEventToday.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemEventToday _$ItemEventTodayFromJson(Map<String, dynamic> json) {
  return ItemEventToday(
      json['eventName'] as String,
      (json['branchId'] as num)?.toDouble(),
      (json['contactPersonId'] as num)?.toDouble(),
      json['visitorType'] as String,
      json['startDate'] as String,
      json['endDate'] as String,
      json['description'] as String,
      json['coverPathFile'] as String,
      (json['coverRepoId'] as num)?.toDouble(),
      json['sendSummary'] as int,
      json['pushNotification'] as int,
      json['sendReminder'] as int,
      json['reminderDays'] as int,
      (json['companyId'] as num)?.toDouble(),
      json['createdBy'] as String,
      json['createdDate'] as String,
      json['updatedBy'] as String,
      json['updatedDate'] as String,
      json['siteName'] as String,
      json['siteAddress'] as String,
      json['contactPersonName'] as String,
      json['visitorTypeValue'] as String,
      json['contactPersonEmail'] as String,
      json['contactPersonPhone'] as String,
      json['branchName'] as String,
      json['editable'] as bool,
      json['notifySetting'] as String,
      (json['id'] as num)?.toDouble(),
      json['totalCount'] as int,
      json['isPrint'] as int,
      json['badgeTemplateId'] as String,
      'cover_${(json['id'] as num)?.toDouble()?.toInt()?.toString()}.png');
}
