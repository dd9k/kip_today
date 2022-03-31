import 'package:json_annotation/json_annotation.dart';
part 'ItemEventToday.g.dart';

@JsonSerializable()
class ItemEventToday {
  @JsonKey(name: 'eventName')
  String eventName;

  @JsonKey(name: 'branchId')
  double branchId;

  @JsonKey(name: 'contactPersonId')
  double contactPersonId;

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

  @JsonKey(name: 'coverRepoId')
  double coverRepoId;

  @JsonKey(name: 'sendSummary')
  int sendSummary;

  @JsonKey(name: 'pushNotification')
  int pushNotification;

  @JsonKey(name: 'sendReminder')
  int sendReminder;

  @JsonKey(name: 'reminderDays')
  int reminderDays;

  @JsonKey(name: 'companyId')
  double companyId;

  @JsonKey(name: 'createdBy')
  String createBy;

  @JsonKey(name: 'createdDate')
  String createdDate;

  @JsonKey(name: 'updatedBy')
  String updatedBy;

  @JsonKey(name: 'updatedDate')
  String updatedDate;

  @JsonKey(name: 'siteName')
  String sitName;

  @JsonKey(name: 'siteAddress')
  String siteAddress;

  @JsonKey(name: 'contactPersonName')
  String contactPersonName;

  @JsonKey(name: 'visitorTypeValue')
  String visitorTypeValue;

  @JsonKey(name: 'contactPersonEmail')
  String contactPersonEmail;

  @JsonKey(name: 'contactPersonPhone')
  String contactPersonPhone;

  @JsonKey(name: 'branchName')
  String branchName;

  @JsonKey(name: 'editable')
  bool editable;

  @JsonKey(name: 'notifySetting')
  String notifySetting;

  @JsonKey(name: 'id')
  double id;

  @JsonKey(name: 'totalCount')
  int totalCount;

  @JsonKey(name: 'badgeTemplateId')
  String badgeTemplateId;

  @JsonKey(name: 'isPrint')
  int isPrint;

  @JsonKey(ignore: true)
  String nameImgLocal;

  ItemEventToday.local(
      this.id,
      this.nameImgLocal,
      this.eventName,
      this.branchId,
      this.contactPersonId,
      this.visitorType,
      this.contactPersonName,
      this.contactPersonEmail,
      this.visitorTypeValue,
      this.companyId,
      this.sitName,
      this.siteAddress,
      this.startDate,
      this.endDate,
      this.description,
      this.notifySetting,
      this.badgeTemplateId,
      this.isPrint,
      this.branchName);

  ItemEventToday(
      String eventName,
      double branchId,
      double contactPersonId,
      String visitorType,
      String startDate,
      String endDate,
      String description,
      String coverPathFile,
      double coverRepoId,
      int sendSummary,
      int pushNotification,
      int sendReminder,
      int reminderDays,
      double companyId,
      String createBy,
      String createdDate,
      String updatedBy,
      String updatedDate,
      String sitName,
      String siteAddress,
      String contactPersonName,
      String visitorTypeValue,
      String contactPersonEmail,
      String contactPersonPhone,
      String branchName,
      bool editable,
      String notifySetting,
      double id,
      int totalCount,
      int isPrint,
      String badgeTemplateId,
      String nameImgLocal) {
    this.eventName = eventName;
    this.branchId = branchId;
    this.contactPersonId = contactPersonId;
    this.visitorType = visitorType;
    this.startDate = startDate;
    this.endDate = endDate;
    this.description = description;
    this.coverPathFile = coverPathFile;
    this.coverRepoId = coverRepoId;
    this.sendSummary = sendSummary;
    this.pushNotification = pushNotification;
    this.sendReminder = sendReminder;
    this.reminderDays = reminderDays;
    this.companyId = companyId;
    this.createBy = createBy;
    this.createdDate = createdDate;
    this.updatedBy = updatedBy;
    this.updatedDate = updatedDate;
    this.sitName = sitName;
    this.siteAddress = siteAddress;
    this.contactPersonName = contactPersonName;
    this.visitorTypeValue = visitorTypeValue;
    this.contactPersonEmail = contactPersonEmail;
    this.contactPersonPhone = contactPersonPhone;
    this.branchName = branchName;
    this.editable = editable;
    this.notifySetting = notifySetting;
    this.id = id;
    this.totalCount = totalCount;
    this.badgeTemplateId = badgeTemplateId;
    this.isPrint = isPrint;
    this.nameImgLocal = nameImgLocal;
  }

  ItemEventToday._();

  factory ItemEventToday.fromJson(Map<String, dynamic> json) =>
      _$ItemEventTodayFromJson(json);
}
