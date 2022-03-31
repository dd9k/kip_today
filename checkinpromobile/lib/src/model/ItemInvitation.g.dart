// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemInvitation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemInvitation _$ItemInvitationFromJson(Map<String, dynamic> json) {
  return ItemInvitation(
      json['eventName'] as String,
      (json['branchId'] as num)?.toDouble(),
      (json['contactPersonId'] as num)?.toDouble(),
      json['visitorType'] as String,
      json['startDate'] as String,
      json['endDate'] as String,
      json['description'] as String,
      json['coverPathFile'] as String,
      (json['companyId'] as num)?.toDouble(),
      json['createdBy'] as String,
      json['createdDate'] as String,
      json['updatedBy'] as String,
      json['updatedDate'] as String,
      json['visitorName'] as String,
      json['visitorTypeValue'] as String,
      json['contactPersonName'] as String,
      json['contactPersonPhone'] as String,
      json['contactPersonEmail'] as String,
      json['timeZone'] as String,
      json['branchName'] as String,
      json['branchAddress'] as String,
      (json['preRegisterId'] as num)?.toDouble(),
      json['visitorEmail'] as String,
      json['invitationId'] as int,
      json['hostInfo'] as String,
      json['visitorPhoneNumber'] as String,
      json['visitorCompany'] as String,
      json['inviteCode'] as String,
      'cover_${json['inviteCode'] as String}.png');
}

Map<String, dynamic> _$ItemInvitationToJson(ItemInvitation instance) =>
    <String, dynamic>{
      'eventName': instance.eventName,
      'branchId': instance.branchId,
      'contactPersonId': instance.contactPersonId,
      'visitorType': instance.visitorType,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'description': instance.description,
      'coverPathFile': instance.coverPathFile,
      'companyId': instance.companyId,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'updatedBy': instance.updatedBy,
      'updatedDate': instance.updatedDate,
      'visitorName': instance.visitorName,
      'visitorTypeValue': instance.visitorTypeValue,
      'contactPersonName': instance.contactPersonName,
      'contactPersonPhone': instance.contactPersonPhone,
      'contactPersonEmail': instance.contactPersonEmail,
      'timeZone': instance.timeZone,
      'branchName': instance.branchName,
      'branchAddress': instance.branchAddress,
      'preRegisterId': instance.preRegisterId,
      'visitorEmail': instance.visitorEmail,
      'invitationId': instance.invitationId,
      'hostInfo': instance.hostInfo,
      'visitorPhoneNumber': instance.visitorPhoneNumber,
      'visitorCompany': instance.visitorCompany,
      'inviteCode': instance.inviteCode,
    };
