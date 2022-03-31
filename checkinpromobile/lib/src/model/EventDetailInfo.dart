import 'package:json_annotation/json_annotation.dart';

part 'EventDetailInfo.g.dart';

@JsonSerializable()
class EventDetailInfo {
  @JsonKey(name: "id")
  double id;

  @JsonKey(name: 'eventName')
  String eventName;

  @JsonKey(name: 'branchId')
  int branchId;

  @JsonKey(name: 'contactPersonId')
  int contactPersonId;

  @JsonKey(name: 'visitorType')
  String visitorType;

  @JsonKey(name: 'startDate')
  String startDate;

  @JsonKey(name: 'endDate')
  String endDate;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'coverPathFile')
  String coverPathFile;

  @JsonKey(name: 'companyId')
  int companyId;

  @JsonKey(name: 'visitorTypeValue')
  String visitorTypeValue;

  @JsonKey(name: 'contactPersonName')
  String contactPersonName;

  @JsonKey(name: 'contactPersonPhone')
  String contactPersonPhone;

  @JsonKey(name: 'contactPersonEmail')
  String contactPersonEmail;

  @JsonKey(name: 'branchName')
  String branchName;

  @JsonKey(name: 'siteName')
  String siteName;

  @JsonKey(name: 'siteAddress')
  String siteAddress;

  @JsonKey(name: 'isPrint')
  int isPrint;

  @JsonKey(name: 'badgeTemplateId')
  String badgeTemplateId;

  EventDetailInfo(
      this.id,
      this.eventName,
      this.branchId,
      this.contactPersonId,
      this.visitorType,
      this.startDate,
      this.endDate,
      this.description,
      this.coverPathFile,
      this.companyId,
      this.visitorTypeValue,
      this.contactPersonName,
      this.contactPersonPhone,
      this.contactPersonEmail,
      this.branchName,
      this.siteName,
      this.siteAddress,
      this.isPrint,
      this.badgeTemplateId);

  EventDetailInfo.local(
      this.id,
      this.eventName,
      this.branchId,
      this.contactPersonId,
      this.visitorType,
      this.startDate,
      this.endDate,
      this.description,
      this.coverPathFile,
      this.companyId,
      this.visitorTypeValue,
      this.contactPersonName,
      this.contactPersonEmail,
      this.branchName,
      this.siteName,
      this.siteAddress,
      this.isPrint,
      this.badgeTemplateId);

  EventDetailInfo.init();

  factory EventDetailInfo.fromJson(Map<String, dynamic> json) =>
      _$EventDetailInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EventDetailInfoToJson(this);
}
