import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/services/ServiceLocator.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';

part 'ItemInvitation.g.dart';

@JsonSerializable()
class ItemInvitation {
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

  @JsonKey(name: 'companyId')
  double companyId;

  @JsonKey(name: 'createdBy')
  String createdBy;

  @JsonKey(name: 'createdDate')
  String createdDate;

  @JsonKey(name: 'updatedBy')
  String updatedBy;

  @JsonKey(name: 'updatedDate')
  String updatedDate;

  @JsonKey(name: 'visitorName')
  String visitorName;

  @JsonKey(name: 'visitorTypeValue')
  String visitorTypeValue;

  @JsonKey(name: 'contactPersonName')
  String contactPersonName;

  @JsonKey(name: 'contactPersonPhone')
  String contactPersonPhone;

  @JsonKey(name: 'contactPersonEmail')
  String contactPersonEmail;

  @JsonKey(name: 'timeZone')
  String timeZone;

  @JsonKey(name: 'branchName')
  String branchName;

  @JsonKey(name: 'branchAddress')
  String branchAddress;

  @JsonKey(name: 'preRegisterId')
  double preRegisterId;

  @JsonKey(name: 'visitorEmail')
  String visitorEmail;

  @JsonKey(name: 'invitationId')
  int invitationId;

  @JsonKey(name: 'hostInfo')
  String hostInfo;

  @JsonKey(name: 'visitorPhoneNumber')
  String visitorPhoneNumber;

  @JsonKey(name: 'visitorCompany')
  String visitorCompany;

  @JsonKey(name: 'inviteCode')
  String inviteCode;

  @JsonKey(ignore: true)
  String nameImgLocal;

  ItemInvitation(
      String eventName,
      double branchId,
      double contactPersonId,
      String visitorType,
      String startDate,
      String endDate,
      String description,
      String coverPathFile,
      double companyId,
      String createdBy,
      String createdDate,
      String updatedBy,
      String updatedDate,
      String visitorName,
      String visitorTypeValue,
      String contactPersonName,
      String contactPersonPhone,
      String contactPersonEmail,
      String timeZone,
      String branchName,
      String branchAddress,
      double preRegisterId,
      String visitorEmail,
      int invitationId,
      String hostInfo,
      String visitorPhoneNumber,
      String visitorCompany,
      String inviteCode,
      String nameImgLocal) {
    this.eventName = eventName;
    this.branchId = branchId;
    this.contactPersonId = contactPersonId;
    this.visitorType = visitorType;
    this.startDate = startDate;
    this.endDate = endDate;
    this.description = description;
    this.coverPathFile = coverPathFile;
    this.companyId = companyId;
    this.createdBy = createdBy;
    this.createdDate = createdDate;
    this.updatedBy = updatedBy;
    this.updatedDate = updatedDate;
    this.visitorName = visitorName;
    this.visitorTypeValue = visitorTypeValue;
    this.contactPersonName = contactPersonName;
    this.contactPersonPhone = contactPersonPhone;
    this.contactPersonEmail = contactPersonEmail;
    this.timeZone = timeZone;
    this.branchName = branchName;
    this.branchAddress = branchAddress;
    this.preRegisterId = preRegisterId;
    this.visitorEmail = visitorEmail;
    this.invitationId = invitationId;
    this.hostInfo = hostInfo;
    this.visitorPhoneNumber = visitorPhoneNumber;
    this.visitorCompany = visitorCompany;
    this.inviteCode = inviteCode;
    this.nameImgLocal = nameImgLocal;
  }

  ItemInvitation.local(
      String eventName,
      double branchId,
      double contactPersonId,
      String visitorType,
      String startDate,
      String endDate,
      String description,
      String nameImgLocal,
      double companyId,
      String visitorName,
      String visitorTypeValue,
      String contactPersonName,
      String contactPersonPhone,
      String contactPersonEmail,
      String timeZone,
      String branchName,
      String branchAddress,
      double preRegisterId,
      String visitorEmail,
      int invitationId,
      String hostInfo,
      String visitorPhoneNumber,
      String visitorCompany,
      String inviteCode) {
    this.eventName = eventName;
    this.branchId = branchId;
    this.contactPersonId = contactPersonId;
    this.visitorType = visitorType;
    this.startDate = startDate;
    this.endDate = endDate;
    this.description = description;
    this.nameImgLocal = nameImgLocal;
    this.companyId = companyId;
    this.visitorName = visitorName;
    this.visitorTypeValue = visitorTypeValue;
    this.contactPersonName = contactPersonName;
    this.contactPersonPhone = contactPersonPhone;
    this.contactPersonEmail = contactPersonEmail;
    this.timeZone = timeZone;
    this.branchName = branchName;
    this.branchAddress = branchAddress;
    this.preRegisterId = preRegisterId;
    this.visitorEmail = visitorEmail;
    this.invitationId = invitationId;
    this.hostInfo = hostInfo;
    this.visitorPhoneNumber = visitorPhoneNumber;
    this.visitorCompany = visitorCompany;
    this.inviteCode = inviteCode;
  }

  String getStartJustDate(BuildContext context, String currentLang) {
    final DateFormat formatter = DateFormat.yMMMEd(currentLang);
    final DateTime now = DateTime.now();
    final String formatted = formatter.format(DateTime.parse(startDate));
    if (formatted == formatter.format(now)) {
      return AppLocalizations.of(context).todayTitle;
    } else if (formatted == formatter.format(now.add(Duration(days: 1)))) {
      return AppLocalizations.of(context).tomorrowTitle;
    }
    return formatted;
  }

  String getStartJustTime(BuildContext context, String currentLang) {
    bool is24HoursFormat = MediaQuery.of(context).alwaysUse24HourFormat;
    var date = DateTime.parse(startDate);
    if (!is24HoursFormat) {
      return DateFormat(Constants.TIME_FORMAT_12_EN, currentLang).format(date);
    }
    return DateFormat(Constants.TIME_FORMAT_24).format(date);
  }

  String getVisitorTypeValue(String lang) {
    return locator<Utilities>().getStringByLang(visitorTypeValue, lang);
  }

  ItemInvitation._();

  factory ItemInvitation.FromJson(Map<String, dynamic> json) =>
      _$ItemInvitationFromJson(json);

  Map<String, dynamic> toJson() => _$ItemInvitationToJson(this);
}
