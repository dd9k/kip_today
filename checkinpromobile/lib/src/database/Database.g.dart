// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class EventTodayEntry extends DataClass implements Insertable<EventTodayEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final double eventId;
  final String coverPathFile;
  final String eventName;
  final double branchId;
  final double contactPersonId;
  final String visitorType;
  final String contactPersonName;
  final String contactPersonEmail;
  final String visitorTypeValue;
  final double companyId;
  final String siteName;
  final String siteAddress;
  final DateTime startDateEvent;
  final DateTime endDateEvent;
  final String description;
  final String notifySetting;
  final String badgeTemplateId;
  final int isPrint;
  final String branchName;
  EventTodayEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      @required this.eventId,
      this.coverPathFile,
      this.eventName,
      this.branchId,
      this.contactPersonId,
      this.visitorType,
      this.contactPersonName,
      this.contactPersonEmail,
      this.visitorTypeValue,
      this.companyId,
      this.siteName,
      this.siteAddress,
      this.startDateEvent,
      this.endDateEvent,
      this.description,
      this.notifySetting,
      this.badgeTemplateId,
      this.isPrint,
      this.branchName});
  factory EventTodayEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    final intType = db.typeSystem.forDartType<int>();
    return EventTodayEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      eventId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}event_id']),
      coverPathFile: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}cover_path_file']),
      eventName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}event_name']),
      branchId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_id']),
      contactPersonId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}contact_person_id']),
      visitorType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_type']),
      contactPersonName: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}contact_person_name']),
      contactPersonEmail: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}contact_person_email']),
      visitorTypeValue: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}visitor_type_value']),
      companyId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}company_id']),
      siteName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}site_name']),
      siteAddress: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}site_address']),
      startDateEvent: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date_event']),
      endDateEvent: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}end_date_event']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      notifySetting: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}notify_setting']),
      badgeTemplateId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}badge_template_id']),
      isPrint:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}is_print']),
      branchName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<double>(eventId);
    }
    if (!nullToAbsent || coverPathFile != null) {
      map['cover_path_file'] = Variable<String>(coverPathFile);
    }
    if (!nullToAbsent || eventName != null) {
      map['event_name'] = Variable<String>(eventName);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<double>(branchId);
    }
    if (!nullToAbsent || contactPersonId != null) {
      map['contact_person_id'] = Variable<double>(contactPersonId);
    }
    if (!nullToAbsent || visitorType != null) {
      map['visitor_type'] = Variable<String>(visitorType);
    }
    if (!nullToAbsent || contactPersonName != null) {
      map['contact_person_name'] = Variable<String>(contactPersonName);
    }
    if (!nullToAbsent || contactPersonEmail != null) {
      map['contact_person_email'] = Variable<String>(contactPersonEmail);
    }
    if (!nullToAbsent || visitorTypeValue != null) {
      map['visitor_type_value'] = Variable<String>(visitorTypeValue);
    }
    if (!nullToAbsent || companyId != null) {
      map['company_id'] = Variable<double>(companyId);
    }
    if (!nullToAbsent || siteName != null) {
      map['site_name'] = Variable<String>(siteName);
    }
    if (!nullToAbsent || siteAddress != null) {
      map['site_address'] = Variable<String>(siteAddress);
    }
    if (!nullToAbsent || startDateEvent != null) {
      map['start_date_event'] = Variable<DateTime>(startDateEvent);
    }
    if (!nullToAbsent || endDateEvent != null) {
      map['end_date_event'] = Variable<DateTime>(endDateEvent);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || notifySetting != null) {
      map['notify_setting'] = Variable<String>(notifySetting);
    }
    if (!nullToAbsent || badgeTemplateId != null) {
      map['badge_template_id'] = Variable<String>(badgeTemplateId);
    }
    if (!nullToAbsent || isPrint != null) {
      map['is_print'] = Variable<int>(isPrint);
    }
    if (!nullToAbsent || branchName != null) {
      map['branch_name'] = Variable<String>(branchName);
    }
    return map;
  }

  EventTodayEntityCompanion toCompanion(bool nullToAbsent) {
    return EventTodayEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      coverPathFile: coverPathFile == null && nullToAbsent
          ? const Value.absent()
          : Value(coverPathFile),
      eventName: eventName == null && nullToAbsent
          ? const Value.absent()
          : Value(eventName),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      contactPersonId: contactPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(contactPersonId),
      visitorType: visitorType == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorType),
      contactPersonName: contactPersonName == null && nullToAbsent
          ? const Value.absent()
          : Value(contactPersonName),
      contactPersonEmail: contactPersonEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(contactPersonEmail),
      visitorTypeValue: visitorTypeValue == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorTypeValue),
      companyId: companyId == null && nullToAbsent
          ? const Value.absent()
          : Value(companyId),
      siteName: siteName == null && nullToAbsent
          ? const Value.absent()
          : Value(siteName),
      siteAddress: siteAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(siteAddress),
      startDateEvent: startDateEvent == null && nullToAbsent
          ? const Value.absent()
          : Value(startDateEvent),
      endDateEvent: endDateEvent == null && nullToAbsent
          ? const Value.absent()
          : Value(endDateEvent),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      notifySetting: notifySetting == null && nullToAbsent
          ? const Value.absent()
          : Value(notifySetting),
      badgeTemplateId: badgeTemplateId == null && nullToAbsent
          ? const Value.absent()
          : Value(badgeTemplateId),
      isPrint: isPrint == null && nullToAbsent
          ? const Value.absent()
          : Value(isPrint),
      branchName: branchName == null && nullToAbsent
          ? const Value.absent()
          : Value(branchName),
    );
  }

  factory EventTodayEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return EventTodayEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      eventId: serializer.fromJson<double>(json['eventId']),
      coverPathFile: serializer.fromJson<String>(json['coverPathFile']),
      eventName: serializer.fromJson<String>(json['eventName']),
      branchId: serializer.fromJson<double>(json['branchId']),
      contactPersonId: serializer.fromJson<double>(json['contactPersonId']),
      visitorType: serializer.fromJson<String>(json['visitorType']),
      contactPersonName: serializer.fromJson<String>(json['contactPersonName']),
      contactPersonEmail:
          serializer.fromJson<String>(json['contactPersonEmail']),
      visitorTypeValue: serializer.fromJson<String>(json['visitorTypeValue']),
      companyId: serializer.fromJson<double>(json['companyId']),
      siteName: serializer.fromJson<String>(json['siteName']),
      siteAddress: serializer.fromJson<String>(json['siteAddress']),
      startDateEvent: serializer.fromJson<DateTime>(json['startDateEvent']),
      endDateEvent: serializer.fromJson<DateTime>(json['endDateEvent']),
      description: serializer.fromJson<String>(json['description']),
      notifySetting: serializer.fromJson<String>(json['notifySetting']),
      badgeTemplateId: serializer.fromJson<String>(json['badgeTemplateId']),
      isPrint: serializer.fromJson<int>(json['isPrint']),
      branchName: serializer.fromJson<String>(json['branchName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'eventId': serializer.toJson<double>(eventId),
      'coverPathFile': serializer.toJson<String>(coverPathFile),
      'eventName': serializer.toJson<String>(eventName),
      'branchId': serializer.toJson<double>(branchId),
      'contactPersonId': serializer.toJson<double>(contactPersonId),
      'visitorType': serializer.toJson<String>(visitorType),
      'contactPersonName': serializer.toJson<String>(contactPersonName),
      'contactPersonEmail': serializer.toJson<String>(contactPersonEmail),
      'visitorTypeValue': serializer.toJson<String>(visitorTypeValue),
      'companyId': serializer.toJson<double>(companyId),
      'siteName': serializer.toJson<String>(siteName),
      'siteAddress': serializer.toJson<String>(siteAddress),
      'startDateEvent': serializer.toJson<DateTime>(startDateEvent),
      'endDateEvent': serializer.toJson<DateTime>(endDateEvent),
      'description': serializer.toJson<String>(description),
      'notifySetting': serializer.toJson<String>(notifySetting),
      'badgeTemplateId': serializer.toJson<String>(badgeTemplateId),
      'isPrint': serializer.toJson<int>(isPrint),
      'branchName': serializer.toJson<String>(branchName),
    };
  }

  EventTodayEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          double eventId,
          String coverPathFile,
          String eventName,
          double branchId,
          double contactPersonId,
          String visitorType,
          String contactPersonName,
          String contactPersonEmail,
          String visitorTypeValue,
          double companyId,
          String siteName,
          String siteAddress,
          DateTime startDateEvent,
          DateTime endDateEvent,
          String description,
          String notifySetting,
          String badgeTemplateId,
          int isPrint,
          String branchName}) =>
      EventTodayEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        eventId: eventId ?? this.eventId,
        coverPathFile: coverPathFile ?? this.coverPathFile,
        eventName: eventName ?? this.eventName,
        branchId: branchId ?? this.branchId,
        contactPersonId: contactPersonId ?? this.contactPersonId,
        visitorType: visitorType ?? this.visitorType,
        contactPersonName: contactPersonName ?? this.contactPersonName,
        contactPersonEmail: contactPersonEmail ?? this.contactPersonEmail,
        visitorTypeValue: visitorTypeValue ?? this.visitorTypeValue,
        companyId: companyId ?? this.companyId,
        siteName: siteName ?? this.siteName,
        siteAddress: siteAddress ?? this.siteAddress,
        startDateEvent: startDateEvent ?? this.startDateEvent,
        endDateEvent: endDateEvent ?? this.endDateEvent,
        description: description ?? this.description,
        notifySetting: notifySetting ?? this.notifySetting,
        badgeTemplateId: badgeTemplateId ?? this.badgeTemplateId,
        isPrint: isPrint ?? this.isPrint,
        branchName: branchName ?? this.branchName,
      );
  @override
  String toString() {
    return (StringBuffer('EventTodayEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('eventId: $eventId, ')
          ..write('coverPathFile: $coverPathFile, ')
          ..write('eventName: $eventName, ')
          ..write('branchId: $branchId, ')
          ..write('contactPersonId: $contactPersonId, ')
          ..write('visitorType: $visitorType, ')
          ..write('contactPersonName: $contactPersonName, ')
          ..write('contactPersonEmail: $contactPersonEmail, ')
          ..write('visitorTypeValue: $visitorTypeValue, ')
          ..write('companyId: $companyId, ')
          ..write('siteName: $siteName, ')
          ..write('siteAddress: $siteAddress, ')
          ..write('startDateEvent: $startDateEvent, ')
          ..write('endDateEvent: $endDateEvent, ')
          ..write('description: $description, ')
          ..write('notifySetting: $notifySetting, ')
          ..write('badgeTemplateId: $badgeTemplateId, ')
          ..write('isPrint: $isPrint, ')
          ..write('branchName: $branchName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              eventId.hashCode,
                              $mrjc(
                                  coverPathFile.hashCode,
                                  $mrjc(
                                      eventName.hashCode,
                                      $mrjc(
                                          branchId.hashCode,
                                          $mrjc(
                                              contactPersonId.hashCode,
                                              $mrjc(
                                                  visitorType.hashCode,
                                                  $mrjc(
                                                      contactPersonName
                                                          .hashCode,
                                                      $mrjc(
                                                          contactPersonEmail
                                                              .hashCode,
                                                          $mrjc(
                                                              visitorTypeValue
                                                                  .hashCode,
                                                              $mrjc(
                                                                  companyId
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      siteName
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          siteAddress
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              startDateEvent.hashCode,
                                                                              $mrjc(endDateEvent.hashCode, $mrjc(description.hashCode, $mrjc(notifySetting.hashCode, $mrjc(badgeTemplateId.hashCode, $mrjc(isPrint.hashCode, branchName.hashCode)))))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is EventTodayEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.eventId == this.eventId &&
          other.coverPathFile == this.coverPathFile &&
          other.eventName == this.eventName &&
          other.branchId == this.branchId &&
          other.contactPersonId == this.contactPersonId &&
          other.visitorType == this.visitorType &&
          other.contactPersonName == this.contactPersonName &&
          other.contactPersonEmail == this.contactPersonEmail &&
          other.visitorTypeValue == this.visitorTypeValue &&
          other.companyId == this.companyId &&
          other.siteName == this.siteName &&
          other.siteAddress == this.siteAddress &&
          other.startDateEvent == this.startDateEvent &&
          other.endDateEvent == this.endDateEvent &&
          other.description == this.description &&
          other.notifySetting == this.notifySetting &&
          other.badgeTemplateId == this.badgeTemplateId &&
          other.isPrint == this.isPrint &&
          other.branchName == this.branchName);
}

class EventTodayEntityCompanion extends UpdateCompanion<EventTodayEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<double> eventId;
  final Value<String> coverPathFile;
  final Value<String> eventName;
  final Value<double> branchId;
  final Value<double> contactPersonId;
  final Value<String> visitorType;
  final Value<String> contactPersonName;
  final Value<String> contactPersonEmail;
  final Value<String> visitorTypeValue;
  final Value<double> companyId;
  final Value<String> siteName;
  final Value<String> siteAddress;
  final Value<DateTime> startDateEvent;
  final Value<DateTime> endDateEvent;
  final Value<String> description;
  final Value<String> notifySetting;
  final Value<String> badgeTemplateId;
  final Value<int> isPrint;
  final Value<String> branchName;
  const EventTodayEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.eventId = const Value.absent(),
    this.coverPathFile = const Value.absent(),
    this.eventName = const Value.absent(),
    this.branchId = const Value.absent(),
    this.contactPersonId = const Value.absent(),
    this.visitorType = const Value.absent(),
    this.contactPersonName = const Value.absent(),
    this.contactPersonEmail = const Value.absent(),
    this.visitorTypeValue = const Value.absent(),
    this.companyId = const Value.absent(),
    this.siteName = const Value.absent(),
    this.siteAddress = const Value.absent(),
    this.startDateEvent = const Value.absent(),
    this.endDateEvent = const Value.absent(),
    this.description = const Value.absent(),
    this.notifySetting = const Value.absent(),
    this.badgeTemplateId = const Value.absent(),
    this.isPrint = const Value.absent(),
    this.branchName = const Value.absent(),
  });
  EventTodayEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    @required double eventId,
    this.coverPathFile = const Value.absent(),
    this.eventName = const Value.absent(),
    this.branchId = const Value.absent(),
    this.contactPersonId = const Value.absent(),
    this.visitorType = const Value.absent(),
    this.contactPersonName = const Value.absent(),
    this.contactPersonEmail = const Value.absent(),
    this.visitorTypeValue = const Value.absent(),
    this.companyId = const Value.absent(),
    this.siteName = const Value.absent(),
    this.siteAddress = const Value.absent(),
    this.startDateEvent = const Value.absent(),
    this.endDateEvent = const Value.absent(),
    this.description = const Value.absent(),
    this.notifySetting = const Value.absent(),
    this.badgeTemplateId = const Value.absent(),
    this.isPrint = const Value.absent(),
    this.branchName = const Value.absent(),
  }) : eventId = Value(eventId);
  static Insertable<EventTodayEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<double> eventId,
    Expression<String> coverPathFile,
    Expression<String> eventName,
    Expression<double> branchId,
    Expression<double> contactPersonId,
    Expression<String> visitorType,
    Expression<String> contactPersonName,
    Expression<String> contactPersonEmail,
    Expression<String> visitorTypeValue,
    Expression<double> companyId,
    Expression<String> siteName,
    Expression<String> siteAddress,
    Expression<DateTime> startDateEvent,
    Expression<DateTime> endDateEvent,
    Expression<String> description,
    Expression<String> notifySetting,
    Expression<String> badgeTemplateId,
    Expression<int> isPrint,
    Expression<String> branchName,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (eventId != null) 'event_id': eventId,
      if (coverPathFile != null) 'cover_path_file': coverPathFile,
      if (eventName != null) 'event_name': eventName,
      if (branchId != null) 'branch_id': branchId,
      if (contactPersonId != null) 'contact_person_id': contactPersonId,
      if (visitorType != null) 'visitor_type': visitorType,
      if (contactPersonName != null) 'contact_person_name': contactPersonName,
      if (contactPersonEmail != null)
        'contact_person_email': contactPersonEmail,
      if (visitorTypeValue != null) 'visitor_type_value': visitorTypeValue,
      if (companyId != null) 'company_id': companyId,
      if (siteName != null) 'site_name': siteName,
      if (siteAddress != null) 'site_address': siteAddress,
      if (startDateEvent != null) 'start_date_event': startDateEvent,
      if (endDateEvent != null) 'end_date_event': endDateEvent,
      if (description != null) 'description': description,
      if (notifySetting != null) 'notify_setting': notifySetting,
      if (badgeTemplateId != null) 'badge_template_id': badgeTemplateId,
      if (isPrint != null) 'is_print': isPrint,
      if (branchName != null) 'branch_name': branchName,
    });
  }

  EventTodayEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<double> eventId,
      Value<String> coverPathFile,
      Value<String> eventName,
      Value<double> branchId,
      Value<double> contactPersonId,
      Value<String> visitorType,
      Value<String> contactPersonName,
      Value<String> contactPersonEmail,
      Value<String> visitorTypeValue,
      Value<double> companyId,
      Value<String> siteName,
      Value<String> siteAddress,
      Value<DateTime> startDateEvent,
      Value<DateTime> endDateEvent,
      Value<String> description,
      Value<String> notifySetting,
      Value<String> badgeTemplateId,
      Value<int> isPrint,
      Value<String> branchName}) {
    return EventTodayEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      eventId: eventId ?? this.eventId,
      coverPathFile: coverPathFile ?? this.coverPathFile,
      eventName: eventName ?? this.eventName,
      branchId: branchId ?? this.branchId,
      contactPersonId: contactPersonId ?? this.contactPersonId,
      visitorType: visitorType ?? this.visitorType,
      contactPersonName: contactPersonName ?? this.contactPersonName,
      contactPersonEmail: contactPersonEmail ?? this.contactPersonEmail,
      visitorTypeValue: visitorTypeValue ?? this.visitorTypeValue,
      companyId: companyId ?? this.companyId,
      siteName: siteName ?? this.siteName,
      siteAddress: siteAddress ?? this.siteAddress,
      startDateEvent: startDateEvent ?? this.startDateEvent,
      endDateEvent: endDateEvent ?? this.endDateEvent,
      description: description ?? this.description,
      notifySetting: notifySetting ?? this.notifySetting,
      badgeTemplateId: badgeTemplateId ?? this.badgeTemplateId,
      isPrint: isPrint ?? this.isPrint,
      branchName: branchName ?? this.branchName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<double>(eventId.value);
    }
    if (coverPathFile.present) {
      map['cover_path_file'] = Variable<String>(coverPathFile.value);
    }
    if (eventName.present) {
      map['event_name'] = Variable<String>(eventName.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<double>(branchId.value);
    }
    if (contactPersonId.present) {
      map['contact_person_id'] = Variable<double>(contactPersonId.value);
    }
    if (visitorType.present) {
      map['visitor_type'] = Variable<String>(visitorType.value);
    }
    if (contactPersonName.present) {
      map['contact_person_name'] = Variable<String>(contactPersonName.value);
    }
    if (contactPersonEmail.present) {
      map['contact_person_email'] = Variable<String>(contactPersonEmail.value);
    }
    if (visitorTypeValue.present) {
      map['visitor_type_value'] = Variable<String>(visitorTypeValue.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<double>(companyId.value);
    }
    if (siteName.present) {
      map['site_name'] = Variable<String>(siteName.value);
    }
    if (siteAddress.present) {
      map['site_address'] = Variable<String>(siteAddress.value);
    }
    if (startDateEvent.present) {
      map['start_date_event'] = Variable<DateTime>(startDateEvent.value);
    }
    if (endDateEvent.present) {
      map['end_date_event'] = Variable<DateTime>(endDateEvent.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (notifySetting.present) {
      map['notify_setting'] = Variable<String>(notifySetting.value);
    }
    if (badgeTemplateId.present) {
      map['badge_template_id'] = Variable<String>(badgeTemplateId.value);
    }
    if (isPrint.present) {
      map['is_print'] = Variable<int>(isPrint.value);
    }
    if (branchName.present) {
      map['branch_name'] = Variable<String>(branchName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventTodayEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('eventId: $eventId, ')
          ..write('coverPathFile: $coverPathFile, ')
          ..write('eventName: $eventName, ')
          ..write('branchId: $branchId, ')
          ..write('contactPersonId: $contactPersonId, ')
          ..write('visitorType: $visitorType, ')
          ..write('contactPersonName: $contactPersonName, ')
          ..write('contactPersonEmail: $contactPersonEmail, ')
          ..write('visitorTypeValue: $visitorTypeValue, ')
          ..write('companyId: $companyId, ')
          ..write('siteName: $siteName, ')
          ..write('siteAddress: $siteAddress, ')
          ..write('startDateEvent: $startDateEvent, ')
          ..write('endDateEvent: $endDateEvent, ')
          ..write('description: $description, ')
          ..write('notifySetting: $notifySetting, ')
          ..write('badgeTemplateId: $badgeTemplateId, ')
          ..write('isPrint: $isPrint, ')
          ..write('branchName: $branchName')
          ..write(')'))
        .toString();
  }
}

class $EventTodayEntityTable extends EventTodayEntity
    with TableInfo<$EventTodayEntityTable, EventTodayEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $EventTodayEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _eventIdMeta = const VerificationMeta('eventId');
  GeneratedRealColumn _eventId;
  @override
  GeneratedRealColumn get eventId => _eventId ??= _constructEventId();
  GeneratedRealColumn _constructEventId() {
    return GeneratedRealColumn(
      'event_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _coverPathFileMeta =
      const VerificationMeta('coverPathFile');
  GeneratedTextColumn _coverPathFile;
  @override
  GeneratedTextColumn get coverPathFile =>
      _coverPathFile ??= _constructCoverPathFile();
  GeneratedTextColumn _constructCoverPathFile() {
    return GeneratedTextColumn(
      'cover_path_file',
      $tableName,
      true,
    );
  }

  final VerificationMeta _eventNameMeta = const VerificationMeta('eventName');
  GeneratedTextColumn _eventName;
  @override
  GeneratedTextColumn get eventName => _eventName ??= _constructEventName();
  GeneratedTextColumn _constructEventName() {
    return GeneratedTextColumn(
      'event_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _branchIdMeta = const VerificationMeta('branchId');
  GeneratedRealColumn _branchId;
  @override
  GeneratedRealColumn get branchId => _branchId ??= _constructBranchId();
  GeneratedRealColumn _constructBranchId() {
    return GeneratedRealColumn(
      'branch_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _contactPersonIdMeta =
      const VerificationMeta('contactPersonId');
  GeneratedRealColumn _contactPersonId;
  @override
  GeneratedRealColumn get contactPersonId =>
      _contactPersonId ??= _constructContactPersonId();
  GeneratedRealColumn _constructContactPersonId() {
    return GeneratedRealColumn(
      'contact_person_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorTypeMeta =
      const VerificationMeta('visitorType');
  GeneratedTextColumn _visitorType;
  @override
  GeneratedTextColumn get visitorType =>
      _visitorType ??= _constructVisitorType();
  GeneratedTextColumn _constructVisitorType() {
    return GeneratedTextColumn(
      'visitor_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _contactPersonNameMeta =
      const VerificationMeta('contactPersonName');
  GeneratedTextColumn _contactPersonName;
  @override
  GeneratedTextColumn get contactPersonName =>
      _contactPersonName ??= _constructContactPersonName();
  GeneratedTextColumn _constructContactPersonName() {
    return GeneratedTextColumn(
      'contact_person_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _contactPersonEmailMeta =
      const VerificationMeta('contactPersonEmail');
  GeneratedTextColumn _contactPersonEmail;
  @override
  GeneratedTextColumn get contactPersonEmail =>
      _contactPersonEmail ??= _constructContactPersonEmail();
  GeneratedTextColumn _constructContactPersonEmail() {
    return GeneratedTextColumn(
      'contact_person_email',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorTypeValueMeta =
      const VerificationMeta('visitorTypeValue');
  GeneratedTextColumn _visitorTypeValue;
  @override
  GeneratedTextColumn get visitorTypeValue =>
      _visitorTypeValue ??= _constructVisitorTypeValue();
  GeneratedTextColumn _constructVisitorTypeValue() {
    return GeneratedTextColumn(
      'visitor_type_value',
      $tableName,
      true,
    );
  }

  final VerificationMeta _companyIdMeta = const VerificationMeta('companyId');
  GeneratedRealColumn _companyId;
  @override
  GeneratedRealColumn get companyId => _companyId ??= _constructCompanyId();
  GeneratedRealColumn _constructCompanyId() {
    return GeneratedRealColumn(
      'company_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _siteNameMeta = const VerificationMeta('siteName');
  GeneratedTextColumn _siteName;
  @override
  GeneratedTextColumn get siteName => _siteName ??= _constructSiteName();
  GeneratedTextColumn _constructSiteName() {
    return GeneratedTextColumn(
      'site_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _siteAddressMeta =
      const VerificationMeta('siteAddress');
  GeneratedTextColumn _siteAddress;
  @override
  GeneratedTextColumn get siteAddress =>
      _siteAddress ??= _constructSiteAddress();
  GeneratedTextColumn _constructSiteAddress() {
    return GeneratedTextColumn(
      'site_address',
      $tableName,
      true,
    );
  }

  final VerificationMeta _startDateEventMeta =
      const VerificationMeta('startDateEvent');
  GeneratedDateTimeColumn _startDateEvent;
  @override
  GeneratedDateTimeColumn get startDateEvent =>
      _startDateEvent ??= _constructStartDateEvent();
  GeneratedDateTimeColumn _constructStartDateEvent() {
    return GeneratedDateTimeColumn(
      'start_date_event',
      $tableName,
      true,
    );
  }

  final VerificationMeta _endDateEventMeta =
      const VerificationMeta('endDateEvent');
  GeneratedDateTimeColumn _endDateEvent;
  @override
  GeneratedDateTimeColumn get endDateEvent =>
      _endDateEvent ??= _constructEndDateEvent();
  GeneratedDateTimeColumn _constructEndDateEvent() {
    return GeneratedDateTimeColumn(
      'end_date_event',
      $tableName,
      true,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _notifySettingMeta =
      const VerificationMeta('notifySetting');
  GeneratedTextColumn _notifySetting;
  @override
  GeneratedTextColumn get notifySetting =>
      _notifySetting ??= _constructNotifySetting();
  GeneratedTextColumn _constructNotifySetting() {
    return GeneratedTextColumn(
      'notify_setting',
      $tableName,
      true,
    );
  }

  final VerificationMeta _badgeTemplateIdMeta =
      const VerificationMeta('badgeTemplateId');
  GeneratedTextColumn _badgeTemplateId;
  @override
  GeneratedTextColumn get badgeTemplateId =>
      _badgeTemplateId ??= _constructBadgeTemplateId();
  GeneratedTextColumn _constructBadgeTemplateId() {
    return GeneratedTextColumn(
      'badge_template_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isPrintMeta = const VerificationMeta('isPrint');
  GeneratedIntColumn _isPrint;
  @override
  GeneratedIntColumn get isPrint => _isPrint ??= _constructIsPrint();
  GeneratedIntColumn _constructIsPrint() {
    return GeneratedIntColumn(
      'is_print',
      $tableName,
      true,
    );
  }

  final VerificationMeta _branchNameMeta = const VerificationMeta('branchName');
  GeneratedTextColumn _branchName;
  @override
  GeneratedTextColumn get branchName => _branchName ??= _constructBranchName();
  GeneratedTextColumn _constructBranchName() {
    return GeneratedTextColumn(
      'branch_name',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        eventId,
        coverPathFile,
        eventName,
        branchId,
        contactPersonId,
        visitorType,
        contactPersonName,
        contactPersonEmail,
        visitorTypeValue,
        companyId,
        siteName,
        siteAddress,
        startDateEvent,
        endDateEvent,
        description,
        notifySetting,
        badgeTemplateId,
        isPrint,
        branchName
      ];
  @override
  $EventTodayEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_event_today';
  @override
  final String actualTableName = 'cip_today_event_today';
  @override
  VerificationContext validateIntegrity(Insertable<EventTodayEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id'], _eventIdMeta));
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('cover_path_file')) {
      context.handle(
          _coverPathFileMeta,
          coverPathFile.isAcceptableOrUnknown(
              data['cover_path_file'], _coverPathFileMeta));
    }
    if (data.containsKey('event_name')) {
      context.handle(_eventNameMeta,
          eventName.isAcceptableOrUnknown(data['event_name'], _eventNameMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id'], _branchIdMeta));
    }
    if (data.containsKey('contact_person_id')) {
      context.handle(
          _contactPersonIdMeta,
          contactPersonId.isAcceptableOrUnknown(
              data['contact_person_id'], _contactPersonIdMeta));
    }
    if (data.containsKey('visitor_type')) {
      context.handle(
          _visitorTypeMeta,
          visitorType.isAcceptableOrUnknown(
              data['visitor_type'], _visitorTypeMeta));
    }
    if (data.containsKey('contact_person_name')) {
      context.handle(
          _contactPersonNameMeta,
          contactPersonName.isAcceptableOrUnknown(
              data['contact_person_name'], _contactPersonNameMeta));
    }
    if (data.containsKey('contact_person_email')) {
      context.handle(
          _contactPersonEmailMeta,
          contactPersonEmail.isAcceptableOrUnknown(
              data['contact_person_email'], _contactPersonEmailMeta));
    }
    if (data.containsKey('visitor_type_value')) {
      context.handle(
          _visitorTypeValueMeta,
          visitorTypeValue.isAcceptableOrUnknown(
              data['visitor_type_value'], _visitorTypeValueMeta));
    }
    if (data.containsKey('company_id')) {
      context.handle(_companyIdMeta,
          companyId.isAcceptableOrUnknown(data['company_id'], _companyIdMeta));
    }
    if (data.containsKey('site_name')) {
      context.handle(_siteNameMeta,
          siteName.isAcceptableOrUnknown(data['site_name'], _siteNameMeta));
    }
    if (data.containsKey('site_address')) {
      context.handle(
          _siteAddressMeta,
          siteAddress.isAcceptableOrUnknown(
              data['site_address'], _siteAddressMeta));
    }
    if (data.containsKey('start_date_event')) {
      context.handle(
          _startDateEventMeta,
          startDateEvent.isAcceptableOrUnknown(
              data['start_date_event'], _startDateEventMeta));
    }
    if (data.containsKey('end_date_event')) {
      context.handle(
          _endDateEventMeta,
          endDateEvent.isAcceptableOrUnknown(
              data['end_date_event'], _endDateEventMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('notify_setting')) {
      context.handle(
          _notifySettingMeta,
          notifySetting.isAcceptableOrUnknown(
              data['notify_setting'], _notifySettingMeta));
    }
    if (data.containsKey('badge_template_id')) {
      context.handle(
          _badgeTemplateIdMeta,
          badgeTemplateId.isAcceptableOrUnknown(
              data['badge_template_id'], _badgeTemplateIdMeta));
    }
    if (data.containsKey('is_print')) {
      context.handle(_isPrintMeta,
          isPrint.isAcceptableOrUnknown(data['is_print'], _isPrintMeta));
    }
    if (data.containsKey('branch_name')) {
      context.handle(
          _branchNameMeta,
          branchName.isAcceptableOrUnknown(
              data['branch_name'], _branchNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {eventId};
  @override
  EventTodayEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return EventTodayEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $EventTodayEntityTable createAlias(String alias) {
    return $EventTodayEntityTable(_db, alias);
  }
}

class EventCheckInSyncEntry extends DataClass
    implements Insertable<EventCheckInSyncEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final int idSync;
  final double guestId;
  final double eventId;
  final bool isSync;
  final String statusSync;
  final String timeZone;
  final double contactPersonId;
  final String visitorName;
  final String visitorEmail;
  final String visitorPhoneNumber;
  final String visitorType;
  final double branchId;
  final String inviteCode;
  final DateTime signIn;
  final DateTime signOut;
  EventCheckInSyncEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      @required this.idSync,
      @required this.guestId,
      @required this.eventId,
      this.isSync,
      this.statusSync,
      this.timeZone,
      this.contactPersonId,
      this.visitorName,
      this.visitorEmail,
      this.visitorPhoneNumber,
      this.visitorType,
      this.branchId,
      this.inviteCode,
      this.signIn,
      this.signOut});
  factory EventCheckInSyncEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final boolType = db.typeSystem.forDartType<bool>();
    return EventCheckInSyncEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      idSync:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_sync']),
      guestId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}guest_id']),
      eventId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}event_id']),
      isSync:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_sync']),
      statusSync: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}status_sync']),
      timeZone: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}time_zone']),
      contactPersonId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}contact_person_id']),
      visitorName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_name']),
      visitorEmail: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_email']),
      visitorPhoneNumber: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}visitor_phone_number']),
      visitorType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_type']),
      branchId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_id']),
      inviteCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}invite_code']),
      signIn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sign_in']),
      signOut: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sign_out']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || idSync != null) {
      map['id_sync'] = Variable<int>(idSync);
    }
    if (!nullToAbsent || guestId != null) {
      map['guest_id'] = Variable<double>(guestId);
    }
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<double>(eventId);
    }
    if (!nullToAbsent || isSync != null) {
      map['is_sync'] = Variable<bool>(isSync);
    }
    if (!nullToAbsent || statusSync != null) {
      map['status_sync'] = Variable<String>(statusSync);
    }
    if (!nullToAbsent || timeZone != null) {
      map['time_zone'] = Variable<String>(timeZone);
    }
    if (!nullToAbsent || contactPersonId != null) {
      map['contact_person_id'] = Variable<double>(contactPersonId);
    }
    if (!nullToAbsent || visitorName != null) {
      map['visitor_name'] = Variable<String>(visitorName);
    }
    if (!nullToAbsent || visitorEmail != null) {
      map['visitor_email'] = Variable<String>(visitorEmail);
    }
    if (!nullToAbsent || visitorPhoneNumber != null) {
      map['visitor_phone_number'] = Variable<String>(visitorPhoneNumber);
    }
    if (!nullToAbsent || visitorType != null) {
      map['visitor_type'] = Variable<String>(visitorType);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<double>(branchId);
    }
    if (!nullToAbsent || inviteCode != null) {
      map['invite_code'] = Variable<String>(inviteCode);
    }
    if (!nullToAbsent || signIn != null) {
      map['sign_in'] = Variable<DateTime>(signIn);
    }
    if (!nullToAbsent || signOut != null) {
      map['sign_out'] = Variable<DateTime>(signOut);
    }
    return map;
  }

  EventCheckInSyncEntityCompanion toCompanion(bool nullToAbsent) {
    return EventCheckInSyncEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      idSync:
          idSync == null && nullToAbsent ? const Value.absent() : Value(idSync),
      guestId: guestId == null && nullToAbsent
          ? const Value.absent()
          : Value(guestId),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      isSync:
          isSync == null && nullToAbsent ? const Value.absent() : Value(isSync),
      statusSync: statusSync == null && nullToAbsent
          ? const Value.absent()
          : Value(statusSync),
      timeZone: timeZone == null && nullToAbsent
          ? const Value.absent()
          : Value(timeZone),
      contactPersonId: contactPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(contactPersonId),
      visitorName: visitorName == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorName),
      visitorEmail: visitorEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorEmail),
      visitorPhoneNumber: visitorPhoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorPhoneNumber),
      visitorType: visitorType == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorType),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      inviteCode: inviteCode == null && nullToAbsent
          ? const Value.absent()
          : Value(inviteCode),
      signIn:
          signIn == null && nullToAbsent ? const Value.absent() : Value(signIn),
      signOut: signOut == null && nullToAbsent
          ? const Value.absent()
          : Value(signOut),
    );
  }

  factory EventCheckInSyncEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return EventCheckInSyncEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      idSync: serializer.fromJson<int>(json['idSync']),
      guestId: serializer.fromJson<double>(json['guestId']),
      eventId: serializer.fromJson<double>(json['eventId']),
      isSync: serializer.fromJson<bool>(json['isSync']),
      statusSync: serializer.fromJson<String>(json['statusSync']),
      timeZone: serializer.fromJson<String>(json['timeZone']),
      contactPersonId: serializer.fromJson<double>(json['contactPersonId']),
      visitorName: serializer.fromJson<String>(json['visitorName']),
      visitorEmail: serializer.fromJson<String>(json['visitorEmail']),
      visitorPhoneNumber:
          serializer.fromJson<String>(json['visitorPhoneNumber']),
      visitorType: serializer.fromJson<String>(json['visitorType']),
      branchId: serializer.fromJson<double>(json['branchId']),
      inviteCode: serializer.fromJson<String>(json['inviteCode']),
      signIn: serializer.fromJson<DateTime>(json['signIn']),
      signOut: serializer.fromJson<DateTime>(json['signOut']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'idSync': serializer.toJson<int>(idSync),
      'guestId': serializer.toJson<double>(guestId),
      'eventId': serializer.toJson<double>(eventId),
      'isSync': serializer.toJson<bool>(isSync),
      'statusSync': serializer.toJson<String>(statusSync),
      'timeZone': serializer.toJson<String>(timeZone),
      'contactPersonId': serializer.toJson<double>(contactPersonId),
      'visitorName': serializer.toJson<String>(visitorName),
      'visitorEmail': serializer.toJson<String>(visitorEmail),
      'visitorPhoneNumber': serializer.toJson<String>(visitorPhoneNumber),
      'visitorType': serializer.toJson<String>(visitorType),
      'branchId': serializer.toJson<double>(branchId),
      'inviteCode': serializer.toJson<String>(inviteCode),
      'signIn': serializer.toJson<DateTime>(signIn),
      'signOut': serializer.toJson<DateTime>(signOut),
    };
  }

  EventCheckInSyncEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          int idSync,
          double guestId,
          double eventId,
          bool isSync,
          String statusSync,
          String timeZone,
          double contactPersonId,
          String visitorName,
          String visitorEmail,
          String visitorPhoneNumber,
          String visitorType,
          double branchId,
          String inviteCode,
          DateTime signIn,
          DateTime signOut}) =>
      EventCheckInSyncEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        idSync: idSync ?? this.idSync,
        guestId: guestId ?? this.guestId,
        eventId: eventId ?? this.eventId,
        isSync: isSync ?? this.isSync,
        statusSync: statusSync ?? this.statusSync,
        timeZone: timeZone ?? this.timeZone,
        contactPersonId: contactPersonId ?? this.contactPersonId,
        visitorName: visitorName ?? this.visitorName,
        visitorEmail: visitorEmail ?? this.visitorEmail,
        visitorPhoneNumber: visitorPhoneNumber ?? this.visitorPhoneNumber,
        visitorType: visitorType ?? this.visitorType,
        branchId: branchId ?? this.branchId,
        inviteCode: inviteCode ?? this.inviteCode,
        signIn: signIn ?? this.signIn,
        signOut: signOut ?? this.signOut,
      );
  @override
  String toString() {
    return (StringBuffer('EventCheckInSyncEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('idSync: $idSync, ')
          ..write('guestId: $guestId, ')
          ..write('eventId: $eventId, ')
          ..write('isSync: $isSync, ')
          ..write('statusSync: $statusSync, ')
          ..write('timeZone: $timeZone, ')
          ..write('contactPersonId: $contactPersonId, ')
          ..write('visitorName: $visitorName, ')
          ..write('visitorEmail: $visitorEmail, ')
          ..write('visitorPhoneNumber: $visitorPhoneNumber, ')
          ..write('visitorType: $visitorType, ')
          ..write('branchId: $branchId, ')
          ..write('inviteCode: $inviteCode, ')
          ..write('signIn: $signIn, ')
          ..write('signOut: $signOut')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              idSync.hashCode,
                              $mrjc(
                                  guestId.hashCode,
                                  $mrjc(
                                      eventId.hashCode,
                                      $mrjc(
                                          isSync.hashCode,
                                          $mrjc(
                                              statusSync.hashCode,
                                              $mrjc(
                                                  timeZone.hashCode,
                                                  $mrjc(
                                                      contactPersonId.hashCode,
                                                      $mrjc(
                                                          visitorName.hashCode,
                                                          $mrjc(
                                                              visitorEmail
                                                                  .hashCode,
                                                              $mrjc(
                                                                  visitorPhoneNumber
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      visitorType
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          branchId
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              inviteCode.hashCode,
                                                                              $mrjc(signIn.hashCode, signOut.hashCode)))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is EventCheckInSyncEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.idSync == this.idSync &&
          other.guestId == this.guestId &&
          other.eventId == this.eventId &&
          other.isSync == this.isSync &&
          other.statusSync == this.statusSync &&
          other.timeZone == this.timeZone &&
          other.contactPersonId == this.contactPersonId &&
          other.visitorName == this.visitorName &&
          other.visitorEmail == this.visitorEmail &&
          other.visitorPhoneNumber == this.visitorPhoneNumber &&
          other.visitorType == this.visitorType &&
          other.branchId == this.branchId &&
          other.inviteCode == this.inviteCode &&
          other.signIn == this.signIn &&
          other.signOut == this.signOut);
}

class EventCheckInSyncEntityCompanion
    extends UpdateCompanion<EventCheckInSyncEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<int> idSync;
  final Value<double> guestId;
  final Value<double> eventId;
  final Value<bool> isSync;
  final Value<String> statusSync;
  final Value<String> timeZone;
  final Value<double> contactPersonId;
  final Value<String> visitorName;
  final Value<String> visitorEmail;
  final Value<String> visitorPhoneNumber;
  final Value<String> visitorType;
  final Value<double> branchId;
  final Value<String> inviteCode;
  final Value<DateTime> signIn;
  final Value<DateTime> signOut;
  const EventCheckInSyncEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.idSync = const Value.absent(),
    this.guestId = const Value.absent(),
    this.eventId = const Value.absent(),
    this.isSync = const Value.absent(),
    this.statusSync = const Value.absent(),
    this.timeZone = const Value.absent(),
    this.contactPersonId = const Value.absent(),
    this.visitorName = const Value.absent(),
    this.visitorEmail = const Value.absent(),
    this.visitorPhoneNumber = const Value.absent(),
    this.visitorType = const Value.absent(),
    this.branchId = const Value.absent(),
    this.inviteCode = const Value.absent(),
    this.signIn = const Value.absent(),
    this.signOut = const Value.absent(),
  });
  EventCheckInSyncEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.idSync = const Value.absent(),
    @required double guestId,
    @required double eventId,
    this.isSync = const Value.absent(),
    this.statusSync = const Value.absent(),
    this.timeZone = const Value.absent(),
    this.contactPersonId = const Value.absent(),
    this.visitorName = const Value.absent(),
    this.visitorEmail = const Value.absent(),
    this.visitorPhoneNumber = const Value.absent(),
    this.visitorType = const Value.absent(),
    this.branchId = const Value.absent(),
    this.inviteCode = const Value.absent(),
    this.signIn = const Value.absent(),
    this.signOut = const Value.absent(),
  })  : guestId = Value(guestId),
        eventId = Value(eventId);
  static Insertable<EventCheckInSyncEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<int> idSync,
    Expression<double> guestId,
    Expression<double> eventId,
    Expression<bool> isSync,
    Expression<String> statusSync,
    Expression<String> timeZone,
    Expression<double> contactPersonId,
    Expression<String> visitorName,
    Expression<String> visitorEmail,
    Expression<String> visitorPhoneNumber,
    Expression<String> visitorType,
    Expression<double> branchId,
    Expression<String> inviteCode,
    Expression<DateTime> signIn,
    Expression<DateTime> signOut,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (idSync != null) 'id_sync': idSync,
      if (guestId != null) 'guest_id': guestId,
      if (eventId != null) 'event_id': eventId,
      if (isSync != null) 'is_sync': isSync,
      if (statusSync != null) 'status_sync': statusSync,
      if (timeZone != null) 'time_zone': timeZone,
      if (contactPersonId != null) 'contact_person_id': contactPersonId,
      if (visitorName != null) 'visitor_name': visitorName,
      if (visitorEmail != null) 'visitor_email': visitorEmail,
      if (visitorPhoneNumber != null)
        'visitor_phone_number': visitorPhoneNumber,
      if (visitorType != null) 'visitor_type': visitorType,
      if (branchId != null) 'branch_id': branchId,
      if (inviteCode != null) 'invite_code': inviteCode,
      if (signIn != null) 'sign_in': signIn,
      if (signOut != null) 'sign_out': signOut,
    });
  }

  EventCheckInSyncEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<int> idSync,
      Value<double> guestId,
      Value<double> eventId,
      Value<bool> isSync,
      Value<String> statusSync,
      Value<String> timeZone,
      Value<double> contactPersonId,
      Value<String> visitorName,
      Value<String> visitorEmail,
      Value<String> visitorPhoneNumber,
      Value<String> visitorType,
      Value<double> branchId,
      Value<String> inviteCode,
      Value<DateTime> signIn,
      Value<DateTime> signOut}) {
    return EventCheckInSyncEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      idSync: idSync ?? this.idSync,
      guestId: guestId ?? this.guestId,
      eventId: eventId ?? this.eventId,
      isSync: isSync ?? this.isSync,
      statusSync: statusSync ?? this.statusSync,
      timeZone: timeZone ?? this.timeZone,
      contactPersonId: contactPersonId ?? this.contactPersonId,
      visitorName: visitorName ?? this.visitorName,
      visitorEmail: visitorEmail ?? this.visitorEmail,
      visitorPhoneNumber: visitorPhoneNumber ?? this.visitorPhoneNumber,
      visitorType: visitorType ?? this.visitorType,
      branchId: branchId ?? this.branchId,
      inviteCode: inviteCode ?? this.inviteCode,
      signIn: signIn ?? this.signIn,
      signOut: signOut ?? this.signOut,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (idSync.present) {
      map['id_sync'] = Variable<int>(idSync.value);
    }
    if (guestId.present) {
      map['guest_id'] = Variable<double>(guestId.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<double>(eventId.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    if (statusSync.present) {
      map['status_sync'] = Variable<String>(statusSync.value);
    }
    if (timeZone.present) {
      map['time_zone'] = Variable<String>(timeZone.value);
    }
    if (contactPersonId.present) {
      map['contact_person_id'] = Variable<double>(contactPersonId.value);
    }
    if (visitorName.present) {
      map['visitor_name'] = Variable<String>(visitorName.value);
    }
    if (visitorEmail.present) {
      map['visitor_email'] = Variable<String>(visitorEmail.value);
    }
    if (visitorPhoneNumber.present) {
      map['visitor_phone_number'] = Variable<String>(visitorPhoneNumber.value);
    }
    if (visitorType.present) {
      map['visitor_type'] = Variable<String>(visitorType.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<double>(branchId.value);
    }
    if (inviteCode.present) {
      map['invite_code'] = Variable<String>(inviteCode.value);
    }
    if (signIn.present) {
      map['sign_in'] = Variable<DateTime>(signIn.value);
    }
    if (signOut.present) {
      map['sign_out'] = Variable<DateTime>(signOut.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventCheckInSyncEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('idSync: $idSync, ')
          ..write('guestId: $guestId, ')
          ..write('eventId: $eventId, ')
          ..write('isSync: $isSync, ')
          ..write('statusSync: $statusSync, ')
          ..write('timeZone: $timeZone, ')
          ..write('contactPersonId: $contactPersonId, ')
          ..write('visitorName: $visitorName, ')
          ..write('visitorEmail: $visitorEmail, ')
          ..write('visitorPhoneNumber: $visitorPhoneNumber, ')
          ..write('visitorType: $visitorType, ')
          ..write('branchId: $branchId, ')
          ..write('inviteCode: $inviteCode, ')
          ..write('signIn: $signIn, ')
          ..write('signOut: $signOut')
          ..write(')'))
        .toString();
  }
}

class $EventCheckInSyncEntityTable extends EventCheckInSyncEntity
    with TableInfo<$EventCheckInSyncEntityTable, EventCheckInSyncEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $EventCheckInSyncEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idSyncMeta = const VerificationMeta('idSync');
  GeneratedIntColumn _idSync;
  @override
  GeneratedIntColumn get idSync => _idSync ??= _constructIdSync();
  GeneratedIntColumn _constructIdSync() {
    return GeneratedIntColumn('id_sync', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _guestIdMeta = const VerificationMeta('guestId');
  GeneratedRealColumn _guestId;
  @override
  GeneratedRealColumn get guestId => _guestId ??= _constructGuestId();
  GeneratedRealColumn _constructGuestId() {
    return GeneratedRealColumn(
      'guest_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _eventIdMeta = const VerificationMeta('eventId');
  GeneratedRealColumn _eventId;
  @override
  GeneratedRealColumn get eventId => _eventId ??= _constructEventId();
  GeneratedRealColumn _constructEventId() {
    return GeneratedRealColumn(
      'event_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  GeneratedBoolColumn _isSync;
  @override
  GeneratedBoolColumn get isSync => _isSync ??= _constructIsSync();
  GeneratedBoolColumn _constructIsSync() {
    return GeneratedBoolColumn(
      'is_sync',
      $tableName,
      true,
    );
  }

  final VerificationMeta _statusSyncMeta = const VerificationMeta('statusSync');
  GeneratedTextColumn _statusSync;
  @override
  GeneratedTextColumn get statusSync => _statusSync ??= _constructStatusSync();
  GeneratedTextColumn _constructStatusSync() {
    return GeneratedTextColumn(
      'status_sync',
      $tableName,
      true,
    );
  }

  final VerificationMeta _timeZoneMeta = const VerificationMeta('timeZone');
  GeneratedTextColumn _timeZone;
  @override
  GeneratedTextColumn get timeZone => _timeZone ??= _constructTimeZone();
  GeneratedTextColumn _constructTimeZone() {
    return GeneratedTextColumn(
      'time_zone',
      $tableName,
      true,
    );
  }

  final VerificationMeta _contactPersonIdMeta =
      const VerificationMeta('contactPersonId');
  GeneratedRealColumn _contactPersonId;
  @override
  GeneratedRealColumn get contactPersonId =>
      _contactPersonId ??= _constructContactPersonId();
  GeneratedRealColumn _constructContactPersonId() {
    return GeneratedRealColumn(
      'contact_person_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorNameMeta =
      const VerificationMeta('visitorName');
  GeneratedTextColumn _visitorName;
  @override
  GeneratedTextColumn get visitorName =>
      _visitorName ??= _constructVisitorName();
  GeneratedTextColumn _constructVisitorName() {
    return GeneratedTextColumn(
      'visitor_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorEmailMeta =
      const VerificationMeta('visitorEmail');
  GeneratedTextColumn _visitorEmail;
  @override
  GeneratedTextColumn get visitorEmail =>
      _visitorEmail ??= _constructVisitorEmail();
  GeneratedTextColumn _constructVisitorEmail() {
    return GeneratedTextColumn(
      'visitor_email',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorPhoneNumberMeta =
      const VerificationMeta('visitorPhoneNumber');
  GeneratedTextColumn _visitorPhoneNumber;
  @override
  GeneratedTextColumn get visitorPhoneNumber =>
      _visitorPhoneNumber ??= _constructVisitorPhoneNumber();
  GeneratedTextColumn _constructVisitorPhoneNumber() {
    return GeneratedTextColumn(
      'visitor_phone_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorTypeMeta =
      const VerificationMeta('visitorType');
  GeneratedTextColumn _visitorType;
  @override
  GeneratedTextColumn get visitorType =>
      _visitorType ??= _constructVisitorType();
  GeneratedTextColumn _constructVisitorType() {
    return GeneratedTextColumn(
      'visitor_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _branchIdMeta = const VerificationMeta('branchId');
  GeneratedRealColumn _branchId;
  @override
  GeneratedRealColumn get branchId => _branchId ??= _constructBranchId();
  GeneratedRealColumn _constructBranchId() {
    return GeneratedRealColumn(
      'branch_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _inviteCodeMeta = const VerificationMeta('inviteCode');
  GeneratedTextColumn _inviteCode;
  @override
  GeneratedTextColumn get inviteCode => _inviteCode ??= _constructInviteCode();
  GeneratedTextColumn _constructInviteCode() {
    return GeneratedTextColumn(
      'invite_code',
      $tableName,
      true,
    );
  }

  final VerificationMeta _signInMeta = const VerificationMeta('signIn');
  GeneratedDateTimeColumn _signIn;
  @override
  GeneratedDateTimeColumn get signIn => _signIn ??= _constructSignIn();
  GeneratedDateTimeColumn _constructSignIn() {
    return GeneratedDateTimeColumn(
      'sign_in',
      $tableName,
      true,
    );
  }

  final VerificationMeta _signOutMeta = const VerificationMeta('signOut');
  GeneratedDateTimeColumn _signOut;
  @override
  GeneratedDateTimeColumn get signOut => _signOut ??= _constructSignOut();
  GeneratedDateTimeColumn _constructSignOut() {
    return GeneratedDateTimeColumn(
      'sign_out',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        idSync,
        guestId,
        eventId,
        isSync,
        statusSync,
        timeZone,
        contactPersonId,
        visitorName,
        visitorEmail,
        visitorPhoneNumber,
        visitorType,
        branchId,
        inviteCode,
        signIn,
        signOut
      ];
  @override
  $EventCheckInSyncEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_event_checkin_sync';
  @override
  final String actualTableName = 'cip_today_event_checkin_sync';
  @override
  VerificationContext validateIntegrity(
      Insertable<EventCheckInSyncEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id_sync')) {
      context.handle(_idSyncMeta,
          idSync.isAcceptableOrUnknown(data['id_sync'], _idSyncMeta));
    }
    if (data.containsKey('guest_id')) {
      context.handle(_guestIdMeta,
          guestId.isAcceptableOrUnknown(data['guest_id'], _guestIdMeta));
    } else if (isInserting) {
      context.missing(_guestIdMeta);
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id'], _eventIdMeta));
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('is_sync')) {
      context.handle(_isSyncMeta,
          isSync.isAcceptableOrUnknown(data['is_sync'], _isSyncMeta));
    }
    if (data.containsKey('status_sync')) {
      context.handle(
          _statusSyncMeta,
          statusSync.isAcceptableOrUnknown(
              data['status_sync'], _statusSyncMeta));
    }
    if (data.containsKey('time_zone')) {
      context.handle(_timeZoneMeta,
          timeZone.isAcceptableOrUnknown(data['time_zone'], _timeZoneMeta));
    }
    if (data.containsKey('contact_person_id')) {
      context.handle(
          _contactPersonIdMeta,
          contactPersonId.isAcceptableOrUnknown(
              data['contact_person_id'], _contactPersonIdMeta));
    }
    if (data.containsKey('visitor_name')) {
      context.handle(
          _visitorNameMeta,
          visitorName.isAcceptableOrUnknown(
              data['visitor_name'], _visitorNameMeta));
    }
    if (data.containsKey('visitor_email')) {
      context.handle(
          _visitorEmailMeta,
          visitorEmail.isAcceptableOrUnknown(
              data['visitor_email'], _visitorEmailMeta));
    }
    if (data.containsKey('visitor_phone_number')) {
      context.handle(
          _visitorPhoneNumberMeta,
          visitorPhoneNumber.isAcceptableOrUnknown(
              data['visitor_phone_number'], _visitorPhoneNumberMeta));
    }
    if (data.containsKey('visitor_type')) {
      context.handle(
          _visitorTypeMeta,
          visitorType.isAcceptableOrUnknown(
              data['visitor_type'], _visitorTypeMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id'], _branchIdMeta));
    }
    if (data.containsKey('invite_code')) {
      context.handle(
          _inviteCodeMeta,
          inviteCode.isAcceptableOrUnknown(
              data['invite_code'], _inviteCodeMeta));
    }
    if (data.containsKey('sign_in')) {
      context.handle(_signInMeta,
          signIn.isAcceptableOrUnknown(data['sign_in'], _signInMeta));
    }
    if (data.containsKey('sign_out')) {
      context.handle(_signOutMeta,
          signOut.isAcceptableOrUnknown(data['sign_out'], _signOutMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idSync};
  @override
  EventCheckInSyncEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return EventCheckInSyncEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $EventCheckInSyncEntityTable createAlias(String alias) {
    return $EventCheckInSyncEntityTable(_db, alias);
  }
}

class EventGuestAllEntry extends DataClass
    implements Insertable<EventGuestAllEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final int id;
  final double guestId;
  final double eventId;
  final String visitorName;
  final String visitorEmail;
  final String visitorPhoneNumber;
  final String visitorCompany;
  final String visitorType;
  final String inviteCode;
  final double emailLogId;
  final String description;
  final double visitorLogId;
  final String timeZone;
  final DateTime signIn;
  final DateTime signOut;
  final int totalCount;
  final int checkinStatus;
  EventGuestAllEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      @required this.id,
      @required this.guestId,
      @required this.eventId,
      this.visitorName,
      this.visitorEmail,
      this.visitorPhoneNumber,
      this.visitorCompany,
      this.visitorType,
      this.inviteCode,
      this.emailLogId,
      this.description,
      this.visitorLogId,
      this.timeZone,
      this.signIn,
      this.signOut,
      this.totalCount,
      this.checkinStatus});
  factory EventGuestAllEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    return EventGuestAllEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      guestId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}guest_id']),
      eventId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}event_id']),
      visitorName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_name']),
      visitorEmail: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_email']),
      visitorPhoneNumber: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}visitor_phone_number']),
      visitorCompany: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_company']),
      visitorType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_type']),
      inviteCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}invite_code']),
      emailLogId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}email_log_id']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      visitorLogId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_log_id']),
      timeZone: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}time_zone']),
      signIn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sign_in']),
      signOut: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sign_out']),
      totalCount: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_count']),
      checkinStatus: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}checkin_status']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || guestId != null) {
      map['guest_id'] = Variable<double>(guestId);
    }
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<double>(eventId);
    }
    if (!nullToAbsent || visitorName != null) {
      map['visitor_name'] = Variable<String>(visitorName);
    }
    if (!nullToAbsent || visitorEmail != null) {
      map['visitor_email'] = Variable<String>(visitorEmail);
    }
    if (!nullToAbsent || visitorPhoneNumber != null) {
      map['visitor_phone_number'] = Variable<String>(visitorPhoneNumber);
    }
    if (!nullToAbsent || visitorCompany != null) {
      map['visitor_company'] = Variable<String>(visitorCompany);
    }
    if (!nullToAbsent || visitorType != null) {
      map['visitor_type'] = Variable<String>(visitorType);
    }
    if (!nullToAbsent || inviteCode != null) {
      map['invite_code'] = Variable<String>(inviteCode);
    }
    if (!nullToAbsent || emailLogId != null) {
      map['email_log_id'] = Variable<double>(emailLogId);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || visitorLogId != null) {
      map['visitor_log_id'] = Variable<double>(visitorLogId);
    }
    if (!nullToAbsent || timeZone != null) {
      map['time_zone'] = Variable<String>(timeZone);
    }
    if (!nullToAbsent || signIn != null) {
      map['sign_in'] = Variable<DateTime>(signIn);
    }
    if (!nullToAbsent || signOut != null) {
      map['sign_out'] = Variable<DateTime>(signOut);
    }
    if (!nullToAbsent || totalCount != null) {
      map['total_count'] = Variable<int>(totalCount);
    }
    if (!nullToAbsent || checkinStatus != null) {
      map['checkin_status'] = Variable<int>(checkinStatus);
    }
    return map;
  }

  EventGuestAllEntityCompanion toCompanion(bool nullToAbsent) {
    return EventGuestAllEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      guestId: guestId == null && nullToAbsent
          ? const Value.absent()
          : Value(guestId),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      visitorName: visitorName == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorName),
      visitorEmail: visitorEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorEmail),
      visitorPhoneNumber: visitorPhoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorPhoneNumber),
      visitorCompany: visitorCompany == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorCompany),
      visitorType: visitorType == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorType),
      inviteCode: inviteCode == null && nullToAbsent
          ? const Value.absent()
          : Value(inviteCode),
      emailLogId: emailLogId == null && nullToAbsent
          ? const Value.absent()
          : Value(emailLogId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      visitorLogId: visitorLogId == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorLogId),
      timeZone: timeZone == null && nullToAbsent
          ? const Value.absent()
          : Value(timeZone),
      signIn:
          signIn == null && nullToAbsent ? const Value.absent() : Value(signIn),
      signOut: signOut == null && nullToAbsent
          ? const Value.absent()
          : Value(signOut),
      totalCount: totalCount == null && nullToAbsent
          ? const Value.absent()
          : Value(totalCount),
      checkinStatus: checkinStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(checkinStatus),
    );
  }

  factory EventGuestAllEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return EventGuestAllEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      id: serializer.fromJson<int>(json['id']),
      guestId: serializer.fromJson<double>(json['guestId']),
      eventId: serializer.fromJson<double>(json['eventId']),
      visitorName: serializer.fromJson<String>(json['visitorName']),
      visitorEmail: serializer.fromJson<String>(json['visitorEmail']),
      visitorPhoneNumber:
          serializer.fromJson<String>(json['visitorPhoneNumber']),
      visitorCompany: serializer.fromJson<String>(json['visitorCompany']),
      visitorType: serializer.fromJson<String>(json['visitorType']),
      inviteCode: serializer.fromJson<String>(json['inviteCode']),
      emailLogId: serializer.fromJson<double>(json['emailLogId']),
      description: serializer.fromJson<String>(json['description']),
      visitorLogId: serializer.fromJson<double>(json['visitorLogId']),
      timeZone: serializer.fromJson<String>(json['timeZone']),
      signIn: serializer.fromJson<DateTime>(json['signIn']),
      signOut: serializer.fromJson<DateTime>(json['signOut']),
      totalCount: serializer.fromJson<int>(json['totalCount']),
      checkinStatus: serializer.fromJson<int>(json['checkinStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'id': serializer.toJson<int>(id),
      'guestId': serializer.toJson<double>(guestId),
      'eventId': serializer.toJson<double>(eventId),
      'visitorName': serializer.toJson<String>(visitorName),
      'visitorEmail': serializer.toJson<String>(visitorEmail),
      'visitorPhoneNumber': serializer.toJson<String>(visitorPhoneNumber),
      'visitorCompany': serializer.toJson<String>(visitorCompany),
      'visitorType': serializer.toJson<String>(visitorType),
      'inviteCode': serializer.toJson<String>(inviteCode),
      'emailLogId': serializer.toJson<double>(emailLogId),
      'description': serializer.toJson<String>(description),
      'visitorLogId': serializer.toJson<double>(visitorLogId),
      'timeZone': serializer.toJson<String>(timeZone),
      'signIn': serializer.toJson<DateTime>(signIn),
      'signOut': serializer.toJson<DateTime>(signOut),
      'totalCount': serializer.toJson<int>(totalCount),
      'checkinStatus': serializer.toJson<int>(checkinStatus),
    };
  }

  EventGuestAllEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          int id,
          double guestId,
          double eventId,
          String visitorName,
          String visitorEmail,
          String visitorPhoneNumber,
          String visitorCompany,
          String visitorType,
          String inviteCode,
          double emailLogId,
          String description,
          double visitorLogId,
          String timeZone,
          DateTime signIn,
          DateTime signOut,
          int totalCount,
          int checkinStatus}) =>
      EventGuestAllEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        id: id ?? this.id,
        guestId: guestId ?? this.guestId,
        eventId: eventId ?? this.eventId,
        visitorName: visitorName ?? this.visitorName,
        visitorEmail: visitorEmail ?? this.visitorEmail,
        visitorPhoneNumber: visitorPhoneNumber ?? this.visitorPhoneNumber,
        visitorCompany: visitorCompany ?? this.visitorCompany,
        visitorType: visitorType ?? this.visitorType,
        inviteCode: inviteCode ?? this.inviteCode,
        emailLogId: emailLogId ?? this.emailLogId,
        description: description ?? this.description,
        visitorLogId: visitorLogId ?? this.visitorLogId,
        timeZone: timeZone ?? this.timeZone,
        signIn: signIn ?? this.signIn,
        signOut: signOut ?? this.signOut,
        totalCount: totalCount ?? this.totalCount,
        checkinStatus: checkinStatus ?? this.checkinStatus,
      );
  @override
  String toString() {
    return (StringBuffer('EventGuestAllEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('guestId: $guestId, ')
          ..write('eventId: $eventId, ')
          ..write('visitorName: $visitorName, ')
          ..write('visitorEmail: $visitorEmail, ')
          ..write('visitorPhoneNumber: $visitorPhoneNumber, ')
          ..write('visitorCompany: $visitorCompany, ')
          ..write('visitorType: $visitorType, ')
          ..write('inviteCode: $inviteCode, ')
          ..write('emailLogId: $emailLogId, ')
          ..write('description: $description, ')
          ..write('visitorLogId: $visitorLogId, ')
          ..write('timeZone: $timeZone, ')
          ..write('signIn: $signIn, ')
          ..write('signOut: $signOut, ')
          ..write('totalCount: $totalCount, ')
          ..write('checkinStatus: $checkinStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              id.hashCode,
                              $mrjc(
                                  guestId.hashCode,
                                  $mrjc(
                                      eventId.hashCode,
                                      $mrjc(
                                          visitorName.hashCode,
                                          $mrjc(
                                              visitorEmail.hashCode,
                                              $mrjc(
                                                  visitorPhoneNumber.hashCode,
                                                  $mrjc(
                                                      visitorCompany.hashCode,
                                                      $mrjc(
                                                          visitorType.hashCode,
                                                          $mrjc(
                                                              inviteCode
                                                                  .hashCode,
                                                              $mrjc(
                                                                  emailLogId
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      description
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          visitorLogId
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              timeZone.hashCode,
                                                                              $mrjc(signIn.hashCode, $mrjc(signOut.hashCode, $mrjc(totalCount.hashCode, checkinStatus.hashCode)))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is EventGuestAllEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.id == this.id &&
          other.guestId == this.guestId &&
          other.eventId == this.eventId &&
          other.visitorName == this.visitorName &&
          other.visitorEmail == this.visitorEmail &&
          other.visitorPhoneNumber == this.visitorPhoneNumber &&
          other.visitorCompany == this.visitorCompany &&
          other.visitorType == this.visitorType &&
          other.inviteCode == this.inviteCode &&
          other.emailLogId == this.emailLogId &&
          other.description == this.description &&
          other.visitorLogId == this.visitorLogId &&
          other.timeZone == this.timeZone &&
          other.signIn == this.signIn &&
          other.signOut == this.signOut &&
          other.totalCount == this.totalCount &&
          other.checkinStatus == this.checkinStatus);
}

class EventGuestAllEntityCompanion extends UpdateCompanion<EventGuestAllEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<int> id;
  final Value<double> guestId;
  final Value<double> eventId;
  final Value<String> visitorName;
  final Value<String> visitorEmail;
  final Value<String> visitorPhoneNumber;
  final Value<String> visitorCompany;
  final Value<String> visitorType;
  final Value<String> inviteCode;
  final Value<double> emailLogId;
  final Value<String> description;
  final Value<double> visitorLogId;
  final Value<String> timeZone;
  final Value<DateTime> signIn;
  final Value<DateTime> signOut;
  final Value<int> totalCount;
  final Value<int> checkinStatus;
  const EventGuestAllEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.guestId = const Value.absent(),
    this.eventId = const Value.absent(),
    this.visitorName = const Value.absent(),
    this.visitorEmail = const Value.absent(),
    this.visitorPhoneNumber = const Value.absent(),
    this.visitorCompany = const Value.absent(),
    this.visitorType = const Value.absent(),
    this.inviteCode = const Value.absent(),
    this.emailLogId = const Value.absent(),
    this.description = const Value.absent(),
    this.visitorLogId = const Value.absent(),
    this.timeZone = const Value.absent(),
    this.signIn = const Value.absent(),
    this.signOut = const Value.absent(),
    this.totalCount = const Value.absent(),
    this.checkinStatus = const Value.absent(),
  });
  EventGuestAllEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    @required double guestId,
    @required double eventId,
    this.visitorName = const Value.absent(),
    this.visitorEmail = const Value.absent(),
    this.visitorPhoneNumber = const Value.absent(),
    this.visitorCompany = const Value.absent(),
    this.visitorType = const Value.absent(),
    this.inviteCode = const Value.absent(),
    this.emailLogId = const Value.absent(),
    this.description = const Value.absent(),
    this.visitorLogId = const Value.absent(),
    this.timeZone = const Value.absent(),
    this.signIn = const Value.absent(),
    this.signOut = const Value.absent(),
    this.totalCount = const Value.absent(),
    this.checkinStatus = const Value.absent(),
  })  : guestId = Value(guestId),
        eventId = Value(eventId);
  static Insertable<EventGuestAllEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<int> id,
    Expression<double> guestId,
    Expression<double> eventId,
    Expression<String> visitorName,
    Expression<String> visitorEmail,
    Expression<String> visitorPhoneNumber,
    Expression<String> visitorCompany,
    Expression<String> visitorType,
    Expression<String> inviteCode,
    Expression<double> emailLogId,
    Expression<String> description,
    Expression<double> visitorLogId,
    Expression<String> timeZone,
    Expression<DateTime> signIn,
    Expression<DateTime> signOut,
    Expression<int> totalCount,
    Expression<int> checkinStatus,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (id != null) 'id': id,
      if (guestId != null) 'guest_id': guestId,
      if (eventId != null) 'event_id': eventId,
      if (visitorName != null) 'visitor_name': visitorName,
      if (visitorEmail != null) 'visitor_email': visitorEmail,
      if (visitorPhoneNumber != null)
        'visitor_phone_number': visitorPhoneNumber,
      if (visitorCompany != null) 'visitor_company': visitorCompany,
      if (visitorType != null) 'visitor_type': visitorType,
      if (inviteCode != null) 'invite_code': inviteCode,
      if (emailLogId != null) 'email_log_id': emailLogId,
      if (description != null) 'description': description,
      if (visitorLogId != null) 'visitor_log_id': visitorLogId,
      if (timeZone != null) 'time_zone': timeZone,
      if (signIn != null) 'sign_in': signIn,
      if (signOut != null) 'sign_out': signOut,
      if (totalCount != null) 'total_count': totalCount,
      if (checkinStatus != null) 'checkin_status': checkinStatus,
    });
  }

  EventGuestAllEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<int> id,
      Value<double> guestId,
      Value<double> eventId,
      Value<String> visitorName,
      Value<String> visitorEmail,
      Value<String> visitorPhoneNumber,
      Value<String> visitorCompany,
      Value<String> visitorType,
      Value<String> inviteCode,
      Value<double> emailLogId,
      Value<String> description,
      Value<double> visitorLogId,
      Value<String> timeZone,
      Value<DateTime> signIn,
      Value<DateTime> signOut,
      Value<int> totalCount,
      Value<int> checkinStatus}) {
    return EventGuestAllEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      id: id ?? this.id,
      guestId: guestId ?? this.guestId,
      eventId: eventId ?? this.eventId,
      visitorName: visitorName ?? this.visitorName,
      visitorEmail: visitorEmail ?? this.visitorEmail,
      visitorPhoneNumber: visitorPhoneNumber ?? this.visitorPhoneNumber,
      visitorCompany: visitorCompany ?? this.visitorCompany,
      visitorType: visitorType ?? this.visitorType,
      inviteCode: inviteCode ?? this.inviteCode,
      emailLogId: emailLogId ?? this.emailLogId,
      description: description ?? this.description,
      visitorLogId: visitorLogId ?? this.visitorLogId,
      timeZone: timeZone ?? this.timeZone,
      signIn: signIn ?? this.signIn,
      signOut: signOut ?? this.signOut,
      totalCount: totalCount ?? this.totalCount,
      checkinStatus: checkinStatus ?? this.checkinStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (guestId.present) {
      map['guest_id'] = Variable<double>(guestId.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<double>(eventId.value);
    }
    if (visitorName.present) {
      map['visitor_name'] = Variable<String>(visitorName.value);
    }
    if (visitorEmail.present) {
      map['visitor_email'] = Variable<String>(visitorEmail.value);
    }
    if (visitorPhoneNumber.present) {
      map['visitor_phone_number'] = Variable<String>(visitorPhoneNumber.value);
    }
    if (visitorCompany.present) {
      map['visitor_company'] = Variable<String>(visitorCompany.value);
    }
    if (visitorType.present) {
      map['visitor_type'] = Variable<String>(visitorType.value);
    }
    if (inviteCode.present) {
      map['invite_code'] = Variable<String>(inviteCode.value);
    }
    if (emailLogId.present) {
      map['email_log_id'] = Variable<double>(emailLogId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (visitorLogId.present) {
      map['visitor_log_id'] = Variable<double>(visitorLogId.value);
    }
    if (timeZone.present) {
      map['time_zone'] = Variable<String>(timeZone.value);
    }
    if (signIn.present) {
      map['sign_in'] = Variable<DateTime>(signIn.value);
    }
    if (signOut.present) {
      map['sign_out'] = Variable<DateTime>(signOut.value);
    }
    if (totalCount.present) {
      map['total_count'] = Variable<int>(totalCount.value);
    }
    if (checkinStatus.present) {
      map['checkin_status'] = Variable<int>(checkinStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventGuestAllEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('guestId: $guestId, ')
          ..write('eventId: $eventId, ')
          ..write('visitorName: $visitorName, ')
          ..write('visitorEmail: $visitorEmail, ')
          ..write('visitorPhoneNumber: $visitorPhoneNumber, ')
          ..write('visitorCompany: $visitorCompany, ')
          ..write('visitorType: $visitorType, ')
          ..write('inviteCode: $inviteCode, ')
          ..write('emailLogId: $emailLogId, ')
          ..write('description: $description, ')
          ..write('visitorLogId: $visitorLogId, ')
          ..write('timeZone: $timeZone, ')
          ..write('signIn: $signIn, ')
          ..write('signOut: $signOut, ')
          ..write('totalCount: $totalCount, ')
          ..write('checkinStatus: $checkinStatus')
          ..write(')'))
        .toString();
  }
}

class $EventGuestAllEntityTable extends EventGuestAllEntity
    with TableInfo<$EventGuestAllEntityTable, EventGuestAllEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $EventGuestAllEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _guestIdMeta = const VerificationMeta('guestId');
  GeneratedRealColumn _guestId;
  @override
  GeneratedRealColumn get guestId => _guestId ??= _constructGuestId();
  GeneratedRealColumn _constructGuestId() {
    return GeneratedRealColumn(
      'guest_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _eventIdMeta = const VerificationMeta('eventId');
  GeneratedRealColumn _eventId;
  @override
  GeneratedRealColumn get eventId => _eventId ??= _constructEventId();
  GeneratedRealColumn _constructEventId() {
    return GeneratedRealColumn(
      'event_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _visitorNameMeta =
      const VerificationMeta('visitorName');
  GeneratedTextColumn _visitorName;
  @override
  GeneratedTextColumn get visitorName =>
      _visitorName ??= _constructVisitorName();
  GeneratedTextColumn _constructVisitorName() {
    return GeneratedTextColumn(
      'visitor_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorEmailMeta =
      const VerificationMeta('visitorEmail');
  GeneratedTextColumn _visitorEmail;
  @override
  GeneratedTextColumn get visitorEmail =>
      _visitorEmail ??= _constructVisitorEmail();
  GeneratedTextColumn _constructVisitorEmail() {
    return GeneratedTextColumn(
      'visitor_email',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorPhoneNumberMeta =
      const VerificationMeta('visitorPhoneNumber');
  GeneratedTextColumn _visitorPhoneNumber;
  @override
  GeneratedTextColumn get visitorPhoneNumber =>
      _visitorPhoneNumber ??= _constructVisitorPhoneNumber();
  GeneratedTextColumn _constructVisitorPhoneNumber() {
    return GeneratedTextColumn(
      'visitor_phone_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorCompanyMeta =
      const VerificationMeta('visitorCompany');
  GeneratedTextColumn _visitorCompany;
  @override
  GeneratedTextColumn get visitorCompany =>
      _visitorCompany ??= _constructVisitorCompany();
  GeneratedTextColumn _constructVisitorCompany() {
    return GeneratedTextColumn(
      'visitor_company',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorTypeMeta =
      const VerificationMeta('visitorType');
  GeneratedTextColumn _visitorType;
  @override
  GeneratedTextColumn get visitorType =>
      _visitorType ??= _constructVisitorType();
  GeneratedTextColumn _constructVisitorType() {
    return GeneratedTextColumn(
      'visitor_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _inviteCodeMeta = const VerificationMeta('inviteCode');
  GeneratedTextColumn _inviteCode;
  @override
  GeneratedTextColumn get inviteCode => _inviteCode ??= _constructInviteCode();
  GeneratedTextColumn _constructInviteCode() {
    return GeneratedTextColumn(
      'invite_code',
      $tableName,
      true,
    );
  }

  final VerificationMeta _emailLogIdMeta = const VerificationMeta('emailLogId');
  GeneratedRealColumn _emailLogId;
  @override
  GeneratedRealColumn get emailLogId => _emailLogId ??= _constructEmailLogId();
  GeneratedRealColumn _constructEmailLogId() {
    return GeneratedRealColumn(
      'email_log_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorLogIdMeta =
      const VerificationMeta('visitorLogId');
  GeneratedRealColumn _visitorLogId;
  @override
  GeneratedRealColumn get visitorLogId =>
      _visitorLogId ??= _constructVisitorLogId();
  GeneratedRealColumn _constructVisitorLogId() {
    return GeneratedRealColumn(
      'visitor_log_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _timeZoneMeta = const VerificationMeta('timeZone');
  GeneratedTextColumn _timeZone;
  @override
  GeneratedTextColumn get timeZone => _timeZone ??= _constructTimeZone();
  GeneratedTextColumn _constructTimeZone() {
    return GeneratedTextColumn(
      'time_zone',
      $tableName,
      true,
    );
  }

  final VerificationMeta _signInMeta = const VerificationMeta('signIn');
  GeneratedDateTimeColumn _signIn;
  @override
  GeneratedDateTimeColumn get signIn => _signIn ??= _constructSignIn();
  GeneratedDateTimeColumn _constructSignIn() {
    return GeneratedDateTimeColumn(
      'sign_in',
      $tableName,
      true,
    );
  }

  final VerificationMeta _signOutMeta = const VerificationMeta('signOut');
  GeneratedDateTimeColumn _signOut;
  @override
  GeneratedDateTimeColumn get signOut => _signOut ??= _constructSignOut();
  GeneratedDateTimeColumn _constructSignOut() {
    return GeneratedDateTimeColumn(
      'sign_out',
      $tableName,
      true,
    );
  }

  final VerificationMeta _totalCountMeta = const VerificationMeta('totalCount');
  GeneratedIntColumn _totalCount;
  @override
  GeneratedIntColumn get totalCount => _totalCount ??= _constructTotalCount();
  GeneratedIntColumn _constructTotalCount() {
    return GeneratedIntColumn(
      'total_count',
      $tableName,
      true,
    );
  }

  final VerificationMeta _checkinStatusMeta =
      const VerificationMeta('checkinStatus');
  GeneratedIntColumn _checkinStatus;
  @override
  GeneratedIntColumn get checkinStatus =>
      _checkinStatus ??= _constructCheckinStatus();
  GeneratedIntColumn _constructCheckinStatus() {
    return GeneratedIntColumn(
      'checkin_status',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        id,
        guestId,
        eventId,
        visitorName,
        visitorEmail,
        visitorPhoneNumber,
        visitorCompany,
        visitorType,
        inviteCode,
        emailLogId,
        description,
        visitorLogId,
        timeZone,
        signIn,
        signOut,
        totalCount,
        checkinStatus
      ];
  @override
  $EventGuestAllEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_event_guest_all';
  @override
  final String actualTableName = 'cip_today_event_guest_all';
  @override
  VerificationContext validateIntegrity(Insertable<EventGuestAllEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('guest_id')) {
      context.handle(_guestIdMeta,
          guestId.isAcceptableOrUnknown(data['guest_id'], _guestIdMeta));
    } else if (isInserting) {
      context.missing(_guestIdMeta);
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id'], _eventIdMeta));
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('visitor_name')) {
      context.handle(
          _visitorNameMeta,
          visitorName.isAcceptableOrUnknown(
              data['visitor_name'], _visitorNameMeta));
    }
    if (data.containsKey('visitor_email')) {
      context.handle(
          _visitorEmailMeta,
          visitorEmail.isAcceptableOrUnknown(
              data['visitor_email'], _visitorEmailMeta));
    }
    if (data.containsKey('visitor_phone_number')) {
      context.handle(
          _visitorPhoneNumberMeta,
          visitorPhoneNumber.isAcceptableOrUnknown(
              data['visitor_phone_number'], _visitorPhoneNumberMeta));
    }
    if (data.containsKey('visitor_company')) {
      context.handle(
          _visitorCompanyMeta,
          visitorCompany.isAcceptableOrUnknown(
              data['visitor_company'], _visitorCompanyMeta));
    }
    if (data.containsKey('visitor_type')) {
      context.handle(
          _visitorTypeMeta,
          visitorType.isAcceptableOrUnknown(
              data['visitor_type'], _visitorTypeMeta));
    }
    if (data.containsKey('invite_code')) {
      context.handle(
          _inviteCodeMeta,
          inviteCode.isAcceptableOrUnknown(
              data['invite_code'], _inviteCodeMeta));
    }
    if (data.containsKey('email_log_id')) {
      context.handle(
          _emailLogIdMeta,
          emailLogId.isAcceptableOrUnknown(
              data['email_log_id'], _emailLogIdMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('visitor_log_id')) {
      context.handle(
          _visitorLogIdMeta,
          visitorLogId.isAcceptableOrUnknown(
              data['visitor_log_id'], _visitorLogIdMeta));
    }
    if (data.containsKey('time_zone')) {
      context.handle(_timeZoneMeta,
          timeZone.isAcceptableOrUnknown(data['time_zone'], _timeZoneMeta));
    }
    if (data.containsKey('sign_in')) {
      context.handle(_signInMeta,
          signIn.isAcceptableOrUnknown(data['sign_in'], _signInMeta));
    }
    if (data.containsKey('sign_out')) {
      context.handle(_signOutMeta,
          signOut.isAcceptableOrUnknown(data['sign_out'], _signOutMeta));
    }
    if (data.containsKey('total_count')) {
      context.handle(
          _totalCountMeta,
          totalCount.isAcceptableOrUnknown(
              data['total_count'], _totalCountMeta));
    }
    if (data.containsKey('checkin_status')) {
      context.handle(
          _checkinStatusMeta,
          checkinStatus.isAcceptableOrUnknown(
              data['checkin_status'], _checkinStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EventGuestAllEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return EventGuestAllEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $EventGuestAllEntityTable createAlias(String alias) {
    return $EventGuestAllEntityTable(_db, alias);
  }
}

class InvitationExpectedEntry extends DataClass
    implements Insertable<InvitationExpectedEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final int id;
  final String eventName;
  final double branchId;
  final double contactPersonId;
  final String visitorType;
  final DateTime startDate;
  final DateTime endDate;
  final String description;
  final String coverPathFile;
  final double companyId;
  final String visitorName;
  final String visitorTypeValue;
  final String contactPersonName;
  final String contactPersonPhone;
  final String contactPersonEmail;
  final String timeZone;
  final String branchName;
  final String branchAddress;
  final double preRegisterId;
  final String visitorEmail;
  final int invitationId;
  final String hostInfo;
  final String visitorPhoneNumber;
  final String visitorCompany;
  final String inviteCode;
  final DateTime signIn;
  InvitationExpectedEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      @required this.id,
      this.eventName,
      this.branchId,
      this.contactPersonId,
      this.visitorType,
      this.startDate,
      this.endDate,
      this.description,
      this.coverPathFile,
      this.companyId,
      this.visitorName,
      this.visitorTypeValue,
      this.contactPersonName,
      this.contactPersonPhone,
      this.contactPersonEmail,
      this.timeZone,
      this.branchName,
      this.branchAddress,
      this.preRegisterId,
      this.visitorEmail,
      this.invitationId,
      this.hostInfo,
      this.visitorPhoneNumber,
      this.visitorCompany,
      this.inviteCode,
      this.signIn});
  factory InvitationExpectedEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    return InvitationExpectedEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      eventName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}event_name']),
      branchId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_id']),
      contactPersonId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}contact_person_id']),
      visitorType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_type']),
      startDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date']),
      endDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}end_date']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      coverPathFile: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}cover_path_file']),
      companyId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}company_id']),
      visitorName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_name']),
      visitorTypeValue: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}visitor_type_value']),
      contactPersonName: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}contact_person_name']),
      contactPersonPhone: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}contact_person_phone']),
      contactPersonEmail: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}contact_person_email']),
      timeZone: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}time_zone']),
      branchName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_name']),
      branchAddress: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_address']),
      preRegisterId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}pre_register_id']),
      visitorEmail: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_email']),
      invitationId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}invitation_id']),
      hostInfo: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}host_info']),
      visitorPhoneNumber: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}visitor_phone_number']),
      visitorCompany: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_company']),
      inviteCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}invite_code']),
      signIn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sign_in']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || eventName != null) {
      map['event_name'] = Variable<String>(eventName);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<double>(branchId);
    }
    if (!nullToAbsent || contactPersonId != null) {
      map['contact_person_id'] = Variable<double>(contactPersonId);
    }
    if (!nullToAbsent || visitorType != null) {
      map['visitor_type'] = Variable<String>(visitorType);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || coverPathFile != null) {
      map['cover_path_file'] = Variable<String>(coverPathFile);
    }
    if (!nullToAbsent || companyId != null) {
      map['company_id'] = Variable<double>(companyId);
    }
    if (!nullToAbsent || visitorName != null) {
      map['visitor_name'] = Variable<String>(visitorName);
    }
    if (!nullToAbsent || visitorTypeValue != null) {
      map['visitor_type_value'] = Variable<String>(visitorTypeValue);
    }
    if (!nullToAbsent || contactPersonName != null) {
      map['contact_person_name'] = Variable<String>(contactPersonName);
    }
    if (!nullToAbsent || contactPersonPhone != null) {
      map['contact_person_phone'] = Variable<String>(contactPersonPhone);
    }
    if (!nullToAbsent || contactPersonEmail != null) {
      map['contact_person_email'] = Variable<String>(contactPersonEmail);
    }
    if (!nullToAbsent || timeZone != null) {
      map['time_zone'] = Variable<String>(timeZone);
    }
    if (!nullToAbsent || branchName != null) {
      map['branch_name'] = Variable<String>(branchName);
    }
    if (!nullToAbsent || branchAddress != null) {
      map['branch_address'] = Variable<String>(branchAddress);
    }
    if (!nullToAbsent || preRegisterId != null) {
      map['pre_register_id'] = Variable<double>(preRegisterId);
    }
    if (!nullToAbsent || visitorEmail != null) {
      map['visitor_email'] = Variable<String>(visitorEmail);
    }
    if (!nullToAbsent || invitationId != null) {
      map['invitation_id'] = Variable<int>(invitationId);
    }
    if (!nullToAbsent || hostInfo != null) {
      map['host_info'] = Variable<String>(hostInfo);
    }
    if (!nullToAbsent || visitorPhoneNumber != null) {
      map['visitor_phone_number'] = Variable<String>(visitorPhoneNumber);
    }
    if (!nullToAbsent || visitorCompany != null) {
      map['visitor_company'] = Variable<String>(visitorCompany);
    }
    if (!nullToAbsent || inviteCode != null) {
      map['invite_code'] = Variable<String>(inviteCode);
    }
    if (!nullToAbsent || signIn != null) {
      map['sign_in'] = Variable<DateTime>(signIn);
    }
    return map;
  }

  InvitationExpectedEntityCompanion toCompanion(bool nullToAbsent) {
    return InvitationExpectedEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      eventName: eventName == null && nullToAbsent
          ? const Value.absent()
          : Value(eventName),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      contactPersonId: contactPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(contactPersonId),
      visitorType: visitorType == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorType),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      coverPathFile: coverPathFile == null && nullToAbsent
          ? const Value.absent()
          : Value(coverPathFile),
      companyId: companyId == null && nullToAbsent
          ? const Value.absent()
          : Value(companyId),
      visitorName: visitorName == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorName),
      visitorTypeValue: visitorTypeValue == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorTypeValue),
      contactPersonName: contactPersonName == null && nullToAbsent
          ? const Value.absent()
          : Value(contactPersonName),
      contactPersonPhone: contactPersonPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(contactPersonPhone),
      contactPersonEmail: contactPersonEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(contactPersonEmail),
      timeZone: timeZone == null && nullToAbsent
          ? const Value.absent()
          : Value(timeZone),
      branchName: branchName == null && nullToAbsent
          ? const Value.absent()
          : Value(branchName),
      branchAddress: branchAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(branchAddress),
      preRegisterId: preRegisterId == null && nullToAbsent
          ? const Value.absent()
          : Value(preRegisterId),
      visitorEmail: visitorEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorEmail),
      invitationId: invitationId == null && nullToAbsent
          ? const Value.absent()
          : Value(invitationId),
      hostInfo: hostInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(hostInfo),
      visitorPhoneNumber: visitorPhoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorPhoneNumber),
      visitorCompany: visitorCompany == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorCompany),
      inviteCode: inviteCode == null && nullToAbsent
          ? const Value.absent()
          : Value(inviteCode),
      signIn:
          signIn == null && nullToAbsent ? const Value.absent() : Value(signIn),
    );
  }

  factory InvitationExpectedEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return InvitationExpectedEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      id: serializer.fromJson<int>(json['id']),
      eventName: serializer.fromJson<String>(json['eventName']),
      branchId: serializer.fromJson<double>(json['branchId']),
      contactPersonId: serializer.fromJson<double>(json['contactPersonId']),
      visitorType: serializer.fromJson<String>(json['visitorType']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      description: serializer.fromJson<String>(json['description']),
      coverPathFile: serializer.fromJson<String>(json['coverPathFile']),
      companyId: serializer.fromJson<double>(json['companyId']),
      visitorName: serializer.fromJson<String>(json['visitorName']),
      visitorTypeValue: serializer.fromJson<String>(json['visitorTypeValue']),
      contactPersonName: serializer.fromJson<String>(json['contactPersonName']),
      contactPersonPhone:
          serializer.fromJson<String>(json['contactPersonPhone']),
      contactPersonEmail:
          serializer.fromJson<String>(json['contactPersonEmail']),
      timeZone: serializer.fromJson<String>(json['timeZone']),
      branchName: serializer.fromJson<String>(json['branchName']),
      branchAddress: serializer.fromJson<String>(json['branchAddress']),
      preRegisterId: serializer.fromJson<double>(json['preRegisterId']),
      visitorEmail: serializer.fromJson<String>(json['visitorEmail']),
      invitationId: serializer.fromJson<int>(json['invitationId']),
      hostInfo: serializer.fromJson<String>(json['hostInfo']),
      visitorPhoneNumber:
          serializer.fromJson<String>(json['visitorPhoneNumber']),
      visitorCompany: serializer.fromJson<String>(json['visitorCompany']),
      inviteCode: serializer.fromJson<String>(json['inviteCode']),
      signIn: serializer.fromJson<DateTime>(json['signIn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'id': serializer.toJson<int>(id),
      'eventName': serializer.toJson<String>(eventName),
      'branchId': serializer.toJson<double>(branchId),
      'contactPersonId': serializer.toJson<double>(contactPersonId),
      'visitorType': serializer.toJson<String>(visitorType),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'description': serializer.toJson<String>(description),
      'coverPathFile': serializer.toJson<String>(coverPathFile),
      'companyId': serializer.toJson<double>(companyId),
      'visitorName': serializer.toJson<String>(visitorName),
      'visitorTypeValue': serializer.toJson<String>(visitorTypeValue),
      'contactPersonName': serializer.toJson<String>(contactPersonName),
      'contactPersonPhone': serializer.toJson<String>(contactPersonPhone),
      'contactPersonEmail': serializer.toJson<String>(contactPersonEmail),
      'timeZone': serializer.toJson<String>(timeZone),
      'branchName': serializer.toJson<String>(branchName),
      'branchAddress': serializer.toJson<String>(branchAddress),
      'preRegisterId': serializer.toJson<double>(preRegisterId),
      'visitorEmail': serializer.toJson<String>(visitorEmail),
      'invitationId': serializer.toJson<int>(invitationId),
      'hostInfo': serializer.toJson<String>(hostInfo),
      'visitorPhoneNumber': serializer.toJson<String>(visitorPhoneNumber),
      'visitorCompany': serializer.toJson<String>(visitorCompany),
      'inviteCode': serializer.toJson<String>(inviteCode),
      'signIn': serializer.toJson<DateTime>(signIn),
    };
  }

  InvitationExpectedEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          int id,
          String eventName,
          double branchId,
          double contactPersonId,
          String visitorType,
          DateTime startDate,
          DateTime endDate,
          String description,
          String coverPathFile,
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
          String inviteCode,
          DateTime signIn}) =>
      InvitationExpectedEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        id: id ?? this.id,
        eventName: eventName ?? this.eventName,
        branchId: branchId ?? this.branchId,
        contactPersonId: contactPersonId ?? this.contactPersonId,
        visitorType: visitorType ?? this.visitorType,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        description: description ?? this.description,
        coverPathFile: coverPathFile ?? this.coverPathFile,
        companyId: companyId ?? this.companyId,
        visitorName: visitorName ?? this.visitorName,
        visitorTypeValue: visitorTypeValue ?? this.visitorTypeValue,
        contactPersonName: contactPersonName ?? this.contactPersonName,
        contactPersonPhone: contactPersonPhone ?? this.contactPersonPhone,
        contactPersonEmail: contactPersonEmail ?? this.contactPersonEmail,
        timeZone: timeZone ?? this.timeZone,
        branchName: branchName ?? this.branchName,
        branchAddress: branchAddress ?? this.branchAddress,
        preRegisterId: preRegisterId ?? this.preRegisterId,
        visitorEmail: visitorEmail ?? this.visitorEmail,
        invitationId: invitationId ?? this.invitationId,
        hostInfo: hostInfo ?? this.hostInfo,
        visitorPhoneNumber: visitorPhoneNumber ?? this.visitorPhoneNumber,
        visitorCompany: visitorCompany ?? this.visitorCompany,
        inviteCode: inviteCode ?? this.inviteCode,
        signIn: signIn ?? this.signIn,
      );
  @override
  String toString() {
    return (StringBuffer('InvitationExpectedEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('eventName: $eventName, ')
          ..write('branchId: $branchId, ')
          ..write('contactPersonId: $contactPersonId, ')
          ..write('visitorType: $visitorType, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('description: $description, ')
          ..write('coverPathFile: $coverPathFile, ')
          ..write('companyId: $companyId, ')
          ..write('visitorName: $visitorName, ')
          ..write('visitorTypeValue: $visitorTypeValue, ')
          ..write('contactPersonName: $contactPersonName, ')
          ..write('contactPersonPhone: $contactPersonPhone, ')
          ..write('contactPersonEmail: $contactPersonEmail, ')
          ..write('timeZone: $timeZone, ')
          ..write('branchName: $branchName, ')
          ..write('branchAddress: $branchAddress, ')
          ..write('preRegisterId: $preRegisterId, ')
          ..write('visitorEmail: $visitorEmail, ')
          ..write('invitationId: $invitationId, ')
          ..write('hostInfo: $hostInfo, ')
          ..write('visitorPhoneNumber: $visitorPhoneNumber, ')
          ..write('visitorCompany: $visitorCompany, ')
          ..write('inviteCode: $inviteCode, ')
          ..write('signIn: $signIn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              id.hashCode,
                              $mrjc(
                                  eventName.hashCode,
                                  $mrjc(
                                      branchId.hashCode,
                                      $mrjc(
                                          contactPersonId.hashCode,
                                          $mrjc(
                                              visitorType.hashCode,
                                              $mrjc(
                                                  startDate.hashCode,
                                                  $mrjc(
                                                      endDate.hashCode,
                                                      $mrjc(
                                                          description.hashCode,
                                                          $mrjc(
                                                              coverPathFile
                                                                  .hashCode,
                                                              $mrjc(
                                                                  companyId
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      visitorName
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          visitorTypeValue
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              contactPersonName.hashCode,
                                                                              $mrjc(contactPersonPhone.hashCode, $mrjc(contactPersonEmail.hashCode, $mrjc(timeZone.hashCode, $mrjc(branchName.hashCode, $mrjc(branchAddress.hashCode, $mrjc(preRegisterId.hashCode, $mrjc(visitorEmail.hashCode, $mrjc(invitationId.hashCode, $mrjc(hostInfo.hashCode, $mrjc(visitorPhoneNumber.hashCode, $mrjc(visitorCompany.hashCode, $mrjc(inviteCode.hashCode, signIn.hashCode))))))))))))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is InvitationExpectedEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.id == this.id &&
          other.eventName == this.eventName &&
          other.branchId == this.branchId &&
          other.contactPersonId == this.contactPersonId &&
          other.visitorType == this.visitorType &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.description == this.description &&
          other.coverPathFile == this.coverPathFile &&
          other.companyId == this.companyId &&
          other.visitorName == this.visitorName &&
          other.visitorTypeValue == this.visitorTypeValue &&
          other.contactPersonName == this.contactPersonName &&
          other.contactPersonPhone == this.contactPersonPhone &&
          other.contactPersonEmail == this.contactPersonEmail &&
          other.timeZone == this.timeZone &&
          other.branchName == this.branchName &&
          other.branchAddress == this.branchAddress &&
          other.preRegisterId == this.preRegisterId &&
          other.visitorEmail == this.visitorEmail &&
          other.invitationId == this.invitationId &&
          other.hostInfo == this.hostInfo &&
          other.visitorPhoneNumber == this.visitorPhoneNumber &&
          other.visitorCompany == this.visitorCompany &&
          other.inviteCode == this.inviteCode &&
          other.signIn == this.signIn);
}

class InvitationExpectedEntityCompanion
    extends UpdateCompanion<InvitationExpectedEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<int> id;
  final Value<String> eventName;
  final Value<double> branchId;
  final Value<double> contactPersonId;
  final Value<String> visitorType;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<String> description;
  final Value<String> coverPathFile;
  final Value<double> companyId;
  final Value<String> visitorName;
  final Value<String> visitorTypeValue;
  final Value<String> contactPersonName;
  final Value<String> contactPersonPhone;
  final Value<String> contactPersonEmail;
  final Value<String> timeZone;
  final Value<String> branchName;
  final Value<String> branchAddress;
  final Value<double> preRegisterId;
  final Value<String> visitorEmail;
  final Value<int> invitationId;
  final Value<String> hostInfo;
  final Value<String> visitorPhoneNumber;
  final Value<String> visitorCompany;
  final Value<String> inviteCode;
  final Value<DateTime> signIn;
  const InvitationExpectedEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.eventName = const Value.absent(),
    this.branchId = const Value.absent(),
    this.contactPersonId = const Value.absent(),
    this.visitorType = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.description = const Value.absent(),
    this.coverPathFile = const Value.absent(),
    this.companyId = const Value.absent(),
    this.visitorName = const Value.absent(),
    this.visitorTypeValue = const Value.absent(),
    this.contactPersonName = const Value.absent(),
    this.contactPersonPhone = const Value.absent(),
    this.contactPersonEmail = const Value.absent(),
    this.timeZone = const Value.absent(),
    this.branchName = const Value.absent(),
    this.branchAddress = const Value.absent(),
    this.preRegisterId = const Value.absent(),
    this.visitorEmail = const Value.absent(),
    this.invitationId = const Value.absent(),
    this.hostInfo = const Value.absent(),
    this.visitorPhoneNumber = const Value.absent(),
    this.visitorCompany = const Value.absent(),
    this.inviteCode = const Value.absent(),
    this.signIn = const Value.absent(),
  });
  InvitationExpectedEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.eventName = const Value.absent(),
    this.branchId = const Value.absent(),
    this.contactPersonId = const Value.absent(),
    this.visitorType = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.description = const Value.absent(),
    this.coverPathFile = const Value.absent(),
    this.companyId = const Value.absent(),
    this.visitorName = const Value.absent(),
    this.visitorTypeValue = const Value.absent(),
    this.contactPersonName = const Value.absent(),
    this.contactPersonPhone = const Value.absent(),
    this.contactPersonEmail = const Value.absent(),
    this.timeZone = const Value.absent(),
    this.branchName = const Value.absent(),
    this.branchAddress = const Value.absent(),
    this.preRegisterId = const Value.absent(),
    this.visitorEmail = const Value.absent(),
    this.invitationId = const Value.absent(),
    this.hostInfo = const Value.absent(),
    this.visitorPhoneNumber = const Value.absent(),
    this.visitorCompany = const Value.absent(),
    this.inviteCode = const Value.absent(),
    this.signIn = const Value.absent(),
  });
  static Insertable<InvitationExpectedEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<int> id,
    Expression<String> eventName,
    Expression<double> branchId,
    Expression<double> contactPersonId,
    Expression<String> visitorType,
    Expression<DateTime> startDate,
    Expression<DateTime> endDate,
    Expression<String> description,
    Expression<String> coverPathFile,
    Expression<double> companyId,
    Expression<String> visitorName,
    Expression<String> visitorTypeValue,
    Expression<String> contactPersonName,
    Expression<String> contactPersonPhone,
    Expression<String> contactPersonEmail,
    Expression<String> timeZone,
    Expression<String> branchName,
    Expression<String> branchAddress,
    Expression<double> preRegisterId,
    Expression<String> visitorEmail,
    Expression<int> invitationId,
    Expression<String> hostInfo,
    Expression<String> visitorPhoneNumber,
    Expression<String> visitorCompany,
    Expression<String> inviteCode,
    Expression<DateTime> signIn,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (id != null) 'id': id,
      if (eventName != null) 'event_name': eventName,
      if (branchId != null) 'branch_id': branchId,
      if (contactPersonId != null) 'contact_person_id': contactPersonId,
      if (visitorType != null) 'visitor_type': visitorType,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (description != null) 'description': description,
      if (coverPathFile != null) 'cover_path_file': coverPathFile,
      if (companyId != null) 'company_id': companyId,
      if (visitorName != null) 'visitor_name': visitorName,
      if (visitorTypeValue != null) 'visitor_type_value': visitorTypeValue,
      if (contactPersonName != null) 'contact_person_name': contactPersonName,
      if (contactPersonPhone != null)
        'contact_person_phone': contactPersonPhone,
      if (contactPersonEmail != null)
        'contact_person_email': contactPersonEmail,
      if (timeZone != null) 'time_zone': timeZone,
      if (branchName != null) 'branch_name': branchName,
      if (branchAddress != null) 'branch_address': branchAddress,
      if (preRegisterId != null) 'pre_register_id': preRegisterId,
      if (visitorEmail != null) 'visitor_email': visitorEmail,
      if (invitationId != null) 'invitation_id': invitationId,
      if (hostInfo != null) 'host_info': hostInfo,
      if (visitorPhoneNumber != null)
        'visitor_phone_number': visitorPhoneNumber,
      if (visitorCompany != null) 'visitor_company': visitorCompany,
      if (inviteCode != null) 'invite_code': inviteCode,
      if (signIn != null) 'sign_in': signIn,
    });
  }

  InvitationExpectedEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<int> id,
      Value<String> eventName,
      Value<double> branchId,
      Value<double> contactPersonId,
      Value<String> visitorType,
      Value<DateTime> startDate,
      Value<DateTime> endDate,
      Value<String> description,
      Value<String> coverPathFile,
      Value<double> companyId,
      Value<String> visitorName,
      Value<String> visitorTypeValue,
      Value<String> contactPersonName,
      Value<String> contactPersonPhone,
      Value<String> contactPersonEmail,
      Value<String> timeZone,
      Value<String> branchName,
      Value<String> branchAddress,
      Value<double> preRegisterId,
      Value<String> visitorEmail,
      Value<int> invitationId,
      Value<String> hostInfo,
      Value<String> visitorPhoneNumber,
      Value<String> visitorCompany,
      Value<String> inviteCode,
      Value<DateTime> signIn}) {
    return InvitationExpectedEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      id: id ?? this.id,
      eventName: eventName ?? this.eventName,
      branchId: branchId ?? this.branchId,
      contactPersonId: contactPersonId ?? this.contactPersonId,
      visitorType: visitorType ?? this.visitorType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      coverPathFile: coverPathFile ?? this.coverPathFile,
      companyId: companyId ?? this.companyId,
      visitorName: visitorName ?? this.visitorName,
      visitorTypeValue: visitorTypeValue ?? this.visitorTypeValue,
      contactPersonName: contactPersonName ?? this.contactPersonName,
      contactPersonPhone: contactPersonPhone ?? this.contactPersonPhone,
      contactPersonEmail: contactPersonEmail ?? this.contactPersonEmail,
      timeZone: timeZone ?? this.timeZone,
      branchName: branchName ?? this.branchName,
      branchAddress: branchAddress ?? this.branchAddress,
      preRegisterId: preRegisterId ?? this.preRegisterId,
      visitorEmail: visitorEmail ?? this.visitorEmail,
      invitationId: invitationId ?? this.invitationId,
      hostInfo: hostInfo ?? this.hostInfo,
      visitorPhoneNumber: visitorPhoneNumber ?? this.visitorPhoneNumber,
      visitorCompany: visitorCompany ?? this.visitorCompany,
      inviteCode: inviteCode ?? this.inviteCode,
      signIn: signIn ?? this.signIn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (eventName.present) {
      map['event_name'] = Variable<String>(eventName.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<double>(branchId.value);
    }
    if (contactPersonId.present) {
      map['contact_person_id'] = Variable<double>(contactPersonId.value);
    }
    if (visitorType.present) {
      map['visitor_type'] = Variable<String>(visitorType.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (coverPathFile.present) {
      map['cover_path_file'] = Variable<String>(coverPathFile.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<double>(companyId.value);
    }
    if (visitorName.present) {
      map['visitor_name'] = Variable<String>(visitorName.value);
    }
    if (visitorTypeValue.present) {
      map['visitor_type_value'] = Variable<String>(visitorTypeValue.value);
    }
    if (contactPersonName.present) {
      map['contact_person_name'] = Variable<String>(contactPersonName.value);
    }
    if (contactPersonPhone.present) {
      map['contact_person_phone'] = Variable<String>(contactPersonPhone.value);
    }
    if (contactPersonEmail.present) {
      map['contact_person_email'] = Variable<String>(contactPersonEmail.value);
    }
    if (timeZone.present) {
      map['time_zone'] = Variable<String>(timeZone.value);
    }
    if (branchName.present) {
      map['branch_name'] = Variable<String>(branchName.value);
    }
    if (branchAddress.present) {
      map['branch_address'] = Variable<String>(branchAddress.value);
    }
    if (preRegisterId.present) {
      map['pre_register_id'] = Variable<double>(preRegisterId.value);
    }
    if (visitorEmail.present) {
      map['visitor_email'] = Variable<String>(visitorEmail.value);
    }
    if (invitationId.present) {
      map['invitation_id'] = Variable<int>(invitationId.value);
    }
    if (hostInfo.present) {
      map['host_info'] = Variable<String>(hostInfo.value);
    }
    if (visitorPhoneNumber.present) {
      map['visitor_phone_number'] = Variable<String>(visitorPhoneNumber.value);
    }
    if (visitorCompany.present) {
      map['visitor_company'] = Variable<String>(visitorCompany.value);
    }
    if (inviteCode.present) {
      map['invite_code'] = Variable<String>(inviteCode.value);
    }
    if (signIn.present) {
      map['sign_in'] = Variable<DateTime>(signIn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvitationExpectedEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('eventName: $eventName, ')
          ..write('branchId: $branchId, ')
          ..write('contactPersonId: $contactPersonId, ')
          ..write('visitorType: $visitorType, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('description: $description, ')
          ..write('coverPathFile: $coverPathFile, ')
          ..write('companyId: $companyId, ')
          ..write('visitorName: $visitorName, ')
          ..write('visitorTypeValue: $visitorTypeValue, ')
          ..write('contactPersonName: $contactPersonName, ')
          ..write('contactPersonPhone: $contactPersonPhone, ')
          ..write('contactPersonEmail: $contactPersonEmail, ')
          ..write('timeZone: $timeZone, ')
          ..write('branchName: $branchName, ')
          ..write('branchAddress: $branchAddress, ')
          ..write('preRegisterId: $preRegisterId, ')
          ..write('visitorEmail: $visitorEmail, ')
          ..write('invitationId: $invitationId, ')
          ..write('hostInfo: $hostInfo, ')
          ..write('visitorPhoneNumber: $visitorPhoneNumber, ')
          ..write('visitorCompany: $visitorCompany, ')
          ..write('inviteCode: $inviteCode, ')
          ..write('signIn: $signIn')
          ..write(')'))
        .toString();
  }
}

class $InvitationExpectedEntityTable extends InvitationExpectedEntity
    with TableInfo<$InvitationExpectedEntityTable, InvitationExpectedEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $InvitationExpectedEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _eventNameMeta = const VerificationMeta('eventName');
  GeneratedTextColumn _eventName;
  @override
  GeneratedTextColumn get eventName => _eventName ??= _constructEventName();
  GeneratedTextColumn _constructEventName() {
    return GeneratedTextColumn(
      'event_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _branchIdMeta = const VerificationMeta('branchId');
  GeneratedRealColumn _branchId;
  @override
  GeneratedRealColumn get branchId => _branchId ??= _constructBranchId();
  GeneratedRealColumn _constructBranchId() {
    return GeneratedRealColumn(
      'branch_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _contactPersonIdMeta =
      const VerificationMeta('contactPersonId');
  GeneratedRealColumn _contactPersonId;
  @override
  GeneratedRealColumn get contactPersonId =>
      _contactPersonId ??= _constructContactPersonId();
  GeneratedRealColumn _constructContactPersonId() {
    return GeneratedRealColumn(
      'contact_person_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorTypeMeta =
      const VerificationMeta('visitorType');
  GeneratedTextColumn _visitorType;
  @override
  GeneratedTextColumn get visitorType =>
      _visitorType ??= _constructVisitorType();
  GeneratedTextColumn _constructVisitorType() {
    return GeneratedTextColumn(
      'visitor_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _startDateMeta = const VerificationMeta('startDate');
  GeneratedDateTimeColumn _startDate;
  @override
  GeneratedDateTimeColumn get startDate => _startDate ??= _constructStartDate();
  GeneratedDateTimeColumn _constructStartDate() {
    return GeneratedDateTimeColumn(
      'start_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _endDateMeta = const VerificationMeta('endDate');
  GeneratedDateTimeColumn _endDate;
  @override
  GeneratedDateTimeColumn get endDate => _endDate ??= _constructEndDate();
  GeneratedDateTimeColumn _constructEndDate() {
    return GeneratedDateTimeColumn(
      'end_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _coverPathFileMeta =
      const VerificationMeta('coverPathFile');
  GeneratedTextColumn _coverPathFile;
  @override
  GeneratedTextColumn get coverPathFile =>
      _coverPathFile ??= _constructCoverPathFile();
  GeneratedTextColumn _constructCoverPathFile() {
    return GeneratedTextColumn(
      'cover_path_file',
      $tableName,
      true,
    );
  }

  final VerificationMeta _companyIdMeta = const VerificationMeta('companyId');
  GeneratedRealColumn _companyId;
  @override
  GeneratedRealColumn get companyId => _companyId ??= _constructCompanyId();
  GeneratedRealColumn _constructCompanyId() {
    return GeneratedRealColumn(
      'company_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorNameMeta =
      const VerificationMeta('visitorName');
  GeneratedTextColumn _visitorName;
  @override
  GeneratedTextColumn get visitorName =>
      _visitorName ??= _constructVisitorName();
  GeneratedTextColumn _constructVisitorName() {
    return GeneratedTextColumn(
      'visitor_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorTypeValueMeta =
      const VerificationMeta('visitorTypeValue');
  GeneratedTextColumn _visitorTypeValue;
  @override
  GeneratedTextColumn get visitorTypeValue =>
      _visitorTypeValue ??= _constructVisitorTypeValue();
  GeneratedTextColumn _constructVisitorTypeValue() {
    return GeneratedTextColumn(
      'visitor_type_value',
      $tableName,
      true,
    );
  }

  final VerificationMeta _contactPersonNameMeta =
      const VerificationMeta('contactPersonName');
  GeneratedTextColumn _contactPersonName;
  @override
  GeneratedTextColumn get contactPersonName =>
      _contactPersonName ??= _constructContactPersonName();
  GeneratedTextColumn _constructContactPersonName() {
    return GeneratedTextColumn(
      'contact_person_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _contactPersonPhoneMeta =
      const VerificationMeta('contactPersonPhone');
  GeneratedTextColumn _contactPersonPhone;
  @override
  GeneratedTextColumn get contactPersonPhone =>
      _contactPersonPhone ??= _constructContactPersonPhone();
  GeneratedTextColumn _constructContactPersonPhone() {
    return GeneratedTextColumn(
      'contact_person_phone',
      $tableName,
      true,
    );
  }

  final VerificationMeta _contactPersonEmailMeta =
      const VerificationMeta('contactPersonEmail');
  GeneratedTextColumn _contactPersonEmail;
  @override
  GeneratedTextColumn get contactPersonEmail =>
      _contactPersonEmail ??= _constructContactPersonEmail();
  GeneratedTextColumn _constructContactPersonEmail() {
    return GeneratedTextColumn(
      'contact_person_email',
      $tableName,
      true,
    );
  }

  final VerificationMeta _timeZoneMeta = const VerificationMeta('timeZone');
  GeneratedTextColumn _timeZone;
  @override
  GeneratedTextColumn get timeZone => _timeZone ??= _constructTimeZone();
  GeneratedTextColumn _constructTimeZone() {
    return GeneratedTextColumn(
      'time_zone',
      $tableName,
      true,
    );
  }

  final VerificationMeta _branchNameMeta = const VerificationMeta('branchName');
  GeneratedTextColumn _branchName;
  @override
  GeneratedTextColumn get branchName => _branchName ??= _constructBranchName();
  GeneratedTextColumn _constructBranchName() {
    return GeneratedTextColumn(
      'branch_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _branchAddressMeta =
      const VerificationMeta('branchAddress');
  GeneratedTextColumn _branchAddress;
  @override
  GeneratedTextColumn get branchAddress =>
      _branchAddress ??= _constructBranchAddress();
  GeneratedTextColumn _constructBranchAddress() {
    return GeneratedTextColumn(
      'branch_address',
      $tableName,
      true,
    );
  }

  final VerificationMeta _preRegisterIdMeta =
      const VerificationMeta('preRegisterId');
  GeneratedRealColumn _preRegisterId;
  @override
  GeneratedRealColumn get preRegisterId =>
      _preRegisterId ??= _constructPreRegisterId();
  GeneratedRealColumn _constructPreRegisterId() {
    return GeneratedRealColumn(
      'pre_register_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorEmailMeta =
      const VerificationMeta('visitorEmail');
  GeneratedTextColumn _visitorEmail;
  @override
  GeneratedTextColumn get visitorEmail =>
      _visitorEmail ??= _constructVisitorEmail();
  GeneratedTextColumn _constructVisitorEmail() {
    return GeneratedTextColumn(
      'visitor_email',
      $tableName,
      true,
    );
  }

  final VerificationMeta _invitationIdMeta =
      const VerificationMeta('invitationId');
  GeneratedIntColumn _invitationId;
  @override
  GeneratedIntColumn get invitationId =>
      _invitationId ??= _constructInvitationId();
  GeneratedIntColumn _constructInvitationId() {
    return GeneratedIntColumn(
      'invitation_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _hostInfoMeta = const VerificationMeta('hostInfo');
  GeneratedTextColumn _hostInfo;
  @override
  GeneratedTextColumn get hostInfo => _hostInfo ??= _constructHostInfo();
  GeneratedTextColumn _constructHostInfo() {
    return GeneratedTextColumn(
      'host_info',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorPhoneNumberMeta =
      const VerificationMeta('visitorPhoneNumber');
  GeneratedTextColumn _visitorPhoneNumber;
  @override
  GeneratedTextColumn get visitorPhoneNumber =>
      _visitorPhoneNumber ??= _constructVisitorPhoneNumber();
  GeneratedTextColumn _constructVisitorPhoneNumber() {
    return GeneratedTextColumn(
      'visitor_phone_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorCompanyMeta =
      const VerificationMeta('visitorCompany');
  GeneratedTextColumn _visitorCompany;
  @override
  GeneratedTextColumn get visitorCompany =>
      _visitorCompany ??= _constructVisitorCompany();
  GeneratedTextColumn _constructVisitorCompany() {
    return GeneratedTextColumn(
      'visitor_company',
      $tableName,
      true,
    );
  }

  final VerificationMeta _inviteCodeMeta = const VerificationMeta('inviteCode');
  GeneratedTextColumn _inviteCode;
  @override
  GeneratedTextColumn get inviteCode => _inviteCode ??= _constructInviteCode();
  GeneratedTextColumn _constructInviteCode() {
    return GeneratedTextColumn(
      'invite_code',
      $tableName,
      true,
    );
  }

  final VerificationMeta _signInMeta = const VerificationMeta('signIn');
  GeneratedDateTimeColumn _signIn;
  @override
  GeneratedDateTimeColumn get signIn => _signIn ??= _constructSignIn();
  GeneratedDateTimeColumn _constructSignIn() {
    return GeneratedDateTimeColumn(
      'sign_in',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        id,
        eventName,
        branchId,
        contactPersonId,
        visitorType,
        startDate,
        endDate,
        description,
        coverPathFile,
        companyId,
        visitorName,
        visitorTypeValue,
        contactPersonName,
        contactPersonPhone,
        contactPersonEmail,
        timeZone,
        branchName,
        branchAddress,
        preRegisterId,
        visitorEmail,
        invitationId,
        hostInfo,
        visitorPhoneNumber,
        visitorCompany,
        inviteCode,
        signIn
      ];
  @override
  $InvitationExpectedEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_invitation_Expected';
  @override
  final String actualTableName = 'cip_today_invitation_Expected';
  @override
  VerificationContext validateIntegrity(
      Insertable<InvitationExpectedEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('event_name')) {
      context.handle(_eventNameMeta,
          eventName.isAcceptableOrUnknown(data['event_name'], _eventNameMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id'], _branchIdMeta));
    }
    if (data.containsKey('contact_person_id')) {
      context.handle(
          _contactPersonIdMeta,
          contactPersonId.isAcceptableOrUnknown(
              data['contact_person_id'], _contactPersonIdMeta));
    }
    if (data.containsKey('visitor_type')) {
      context.handle(
          _visitorTypeMeta,
          visitorType.isAcceptableOrUnknown(
              data['visitor_type'], _visitorTypeMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date'], _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date'], _endDateMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('cover_path_file')) {
      context.handle(
          _coverPathFileMeta,
          coverPathFile.isAcceptableOrUnknown(
              data['cover_path_file'], _coverPathFileMeta));
    }
    if (data.containsKey('company_id')) {
      context.handle(_companyIdMeta,
          companyId.isAcceptableOrUnknown(data['company_id'], _companyIdMeta));
    }
    if (data.containsKey('visitor_name')) {
      context.handle(
          _visitorNameMeta,
          visitorName.isAcceptableOrUnknown(
              data['visitor_name'], _visitorNameMeta));
    }
    if (data.containsKey('visitor_type_value')) {
      context.handle(
          _visitorTypeValueMeta,
          visitorTypeValue.isAcceptableOrUnknown(
              data['visitor_type_value'], _visitorTypeValueMeta));
    }
    if (data.containsKey('contact_person_name')) {
      context.handle(
          _contactPersonNameMeta,
          contactPersonName.isAcceptableOrUnknown(
              data['contact_person_name'], _contactPersonNameMeta));
    }
    if (data.containsKey('contact_person_phone')) {
      context.handle(
          _contactPersonPhoneMeta,
          contactPersonPhone.isAcceptableOrUnknown(
              data['contact_person_phone'], _contactPersonPhoneMeta));
    }
    if (data.containsKey('contact_person_email')) {
      context.handle(
          _contactPersonEmailMeta,
          contactPersonEmail.isAcceptableOrUnknown(
              data['contact_person_email'], _contactPersonEmailMeta));
    }
    if (data.containsKey('time_zone')) {
      context.handle(_timeZoneMeta,
          timeZone.isAcceptableOrUnknown(data['time_zone'], _timeZoneMeta));
    }
    if (data.containsKey('branch_name')) {
      context.handle(
          _branchNameMeta,
          branchName.isAcceptableOrUnknown(
              data['branch_name'], _branchNameMeta));
    }
    if (data.containsKey('branch_address')) {
      context.handle(
          _branchAddressMeta,
          branchAddress.isAcceptableOrUnknown(
              data['branch_address'], _branchAddressMeta));
    }
    if (data.containsKey('pre_register_id')) {
      context.handle(
          _preRegisterIdMeta,
          preRegisterId.isAcceptableOrUnknown(
              data['pre_register_id'], _preRegisterIdMeta));
    }
    if (data.containsKey('visitor_email')) {
      context.handle(
          _visitorEmailMeta,
          visitorEmail.isAcceptableOrUnknown(
              data['visitor_email'], _visitorEmailMeta));
    }
    if (data.containsKey('invitation_id')) {
      context.handle(
          _invitationIdMeta,
          invitationId.isAcceptableOrUnknown(
              data['invitation_id'], _invitationIdMeta));
    }
    if (data.containsKey('host_info')) {
      context.handle(_hostInfoMeta,
          hostInfo.isAcceptableOrUnknown(data['host_info'], _hostInfoMeta));
    }
    if (data.containsKey('visitor_phone_number')) {
      context.handle(
          _visitorPhoneNumberMeta,
          visitorPhoneNumber.isAcceptableOrUnknown(
              data['visitor_phone_number'], _visitorPhoneNumberMeta));
    }
    if (data.containsKey('visitor_company')) {
      context.handle(
          _visitorCompanyMeta,
          visitorCompany.isAcceptableOrUnknown(
              data['visitor_company'], _visitorCompanyMeta));
    }
    if (data.containsKey('invite_code')) {
      context.handle(
          _inviteCodeMeta,
          inviteCode.isAcceptableOrUnknown(
              data['invite_code'], _inviteCodeMeta));
    }
    if (data.containsKey('sign_in')) {
      context.handle(_signInMeta,
          signIn.isAcceptableOrUnknown(data['sign_in'], _signInMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvitationExpectedEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return InvitationExpectedEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $InvitationExpectedEntityTable createAlias(String alias) {
    return $InvitationExpectedEntityTable(_db, alias);
  }
}

class MyVisitorLogTodayEntry extends DataClass
    implements Insertable<MyVisitorLogTodayEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final int id;
  final double idVistor;
  final String fullName;
  final String email;
  final String phoneNumber;
  final DateTime signIn;
  final DateTime signOut;
  final String toCompany;
  final String fromCompany;
  final String visitorTypeValue;
  final String purpose;
  final String feedback;
  final int rating;
  final String branchName;
  final String eventName;
  final double totalCount;
  final String typeDescription;
  final String faceCaptureFile;
  final String inviteCode;
  MyVisitorLogTodayEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      @required this.id,
      @required this.idVistor,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.signIn,
      this.signOut,
      this.toCompany,
      this.fromCompany,
      this.visitorTypeValue,
      this.purpose,
      this.feedback,
      this.rating,
      this.branchName,
      this.eventName,
      this.totalCount,
      this.typeDescription,
      this.faceCaptureFile,
      this.inviteCode});
  factory MyVisitorLogTodayEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    return MyVisitorLogTodayEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idVistor: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}id_vistor']),
      fullName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}full_name']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      phoneNumber: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}phone_number']),
      signIn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sign_in']),
      signOut: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sign_out']),
      toCompany: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}to_company']),
      fromCompany: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}from_company']),
      visitorTypeValue: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}visitor_type_value']),
      purpose:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}purpose']),
      feedback: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}feedback']),
      rating: intType.mapFromDatabaseResponse(data['${effectivePrefix}rating']),
      branchName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_name']),
      eventName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}event_name']),
      totalCount: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_count']),
      typeDescription: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}type_description']),
      faceCaptureFile: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}face_capture_file']),
      inviteCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}invite_code']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idVistor != null) {
      map['id_vistor'] = Variable<double>(idVistor);
    }
    if (!nullToAbsent || fullName != null) {
      map['full_name'] = Variable<String>(fullName);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || signIn != null) {
      map['sign_in'] = Variable<DateTime>(signIn);
    }
    if (!nullToAbsent || signOut != null) {
      map['sign_out'] = Variable<DateTime>(signOut);
    }
    if (!nullToAbsent || toCompany != null) {
      map['to_company'] = Variable<String>(toCompany);
    }
    if (!nullToAbsent || fromCompany != null) {
      map['from_company'] = Variable<String>(fromCompany);
    }
    if (!nullToAbsent || visitorTypeValue != null) {
      map['visitor_type_value'] = Variable<String>(visitorTypeValue);
    }
    if (!nullToAbsent || purpose != null) {
      map['purpose'] = Variable<String>(purpose);
    }
    if (!nullToAbsent || feedback != null) {
      map['feedback'] = Variable<String>(feedback);
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<int>(rating);
    }
    if (!nullToAbsent || branchName != null) {
      map['branch_name'] = Variable<String>(branchName);
    }
    if (!nullToAbsent || eventName != null) {
      map['event_name'] = Variable<String>(eventName);
    }
    if (!nullToAbsent || totalCount != null) {
      map['total_count'] = Variable<double>(totalCount);
    }
    if (!nullToAbsent || typeDescription != null) {
      map['type_description'] = Variable<String>(typeDescription);
    }
    if (!nullToAbsent || faceCaptureFile != null) {
      map['face_capture_file'] = Variable<String>(faceCaptureFile);
    }
    if (!nullToAbsent || inviteCode != null) {
      map['invite_code'] = Variable<String>(inviteCode);
    }
    return map;
  }

  MyVisitorLogTodayEntityCompanion toCompanion(bool nullToAbsent) {
    return MyVisitorLogTodayEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idVistor: idVistor == null && nullToAbsent
          ? const Value.absent()
          : Value(idVistor),
      fullName: fullName == null && nullToAbsent
          ? const Value.absent()
          : Value(fullName),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      signIn:
          signIn == null && nullToAbsent ? const Value.absent() : Value(signIn),
      signOut: signOut == null && nullToAbsent
          ? const Value.absent()
          : Value(signOut),
      toCompany: toCompany == null && nullToAbsent
          ? const Value.absent()
          : Value(toCompany),
      fromCompany: fromCompany == null && nullToAbsent
          ? const Value.absent()
          : Value(fromCompany),
      visitorTypeValue: visitorTypeValue == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorTypeValue),
      purpose: purpose == null && nullToAbsent
          ? const Value.absent()
          : Value(purpose),
      feedback: feedback == null && nullToAbsent
          ? const Value.absent()
          : Value(feedback),
      rating:
          rating == null && nullToAbsent ? const Value.absent() : Value(rating),
      branchName: branchName == null && nullToAbsent
          ? const Value.absent()
          : Value(branchName),
      eventName: eventName == null && nullToAbsent
          ? const Value.absent()
          : Value(eventName),
      totalCount: totalCount == null && nullToAbsent
          ? const Value.absent()
          : Value(totalCount),
      typeDescription: typeDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(typeDescription),
      faceCaptureFile: faceCaptureFile == null && nullToAbsent
          ? const Value.absent()
          : Value(faceCaptureFile),
      inviteCode: inviteCode == null && nullToAbsent
          ? const Value.absent()
          : Value(inviteCode),
    );
  }

  factory MyVisitorLogTodayEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MyVisitorLogTodayEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      id: serializer.fromJson<int>(json['id']),
      idVistor: serializer.fromJson<double>(json['idVistor']),
      fullName: serializer.fromJson<String>(json['fullName']),
      email: serializer.fromJson<String>(json['email']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      signIn: serializer.fromJson<DateTime>(json['signIn']),
      signOut: serializer.fromJson<DateTime>(json['signOut']),
      toCompany: serializer.fromJson<String>(json['toCompany']),
      fromCompany: serializer.fromJson<String>(json['fromCompany']),
      visitorTypeValue: serializer.fromJson<String>(json['visitorTypeValue']),
      purpose: serializer.fromJson<String>(json['purpose']),
      feedback: serializer.fromJson<String>(json['feedback']),
      rating: serializer.fromJson<int>(json['rating']),
      branchName: serializer.fromJson<String>(json['branchName']),
      eventName: serializer.fromJson<String>(json['eventName']),
      totalCount: serializer.fromJson<double>(json['totalCount']),
      typeDescription: serializer.fromJson<String>(json['typeDescription']),
      faceCaptureFile: serializer.fromJson<String>(json['faceCaptureFile']),
      inviteCode: serializer.fromJson<String>(json['inviteCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'id': serializer.toJson<int>(id),
      'idVistor': serializer.toJson<double>(idVistor),
      'fullName': serializer.toJson<String>(fullName),
      'email': serializer.toJson<String>(email),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'signIn': serializer.toJson<DateTime>(signIn),
      'signOut': serializer.toJson<DateTime>(signOut),
      'toCompany': serializer.toJson<String>(toCompany),
      'fromCompany': serializer.toJson<String>(fromCompany),
      'visitorTypeValue': serializer.toJson<String>(visitorTypeValue),
      'purpose': serializer.toJson<String>(purpose),
      'feedback': serializer.toJson<String>(feedback),
      'rating': serializer.toJson<int>(rating),
      'branchName': serializer.toJson<String>(branchName),
      'eventName': serializer.toJson<String>(eventName),
      'totalCount': serializer.toJson<double>(totalCount),
      'typeDescription': serializer.toJson<String>(typeDescription),
      'faceCaptureFile': serializer.toJson<String>(faceCaptureFile),
      'inviteCode': serializer.toJson<String>(inviteCode),
    };
  }

  MyVisitorLogTodayEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          int id,
          double idVistor,
          String fullName,
          String email,
          String phoneNumber,
          DateTime signIn,
          DateTime signOut,
          String toCompany,
          String fromCompany,
          String visitorTypeValue,
          String purpose,
          String feedback,
          int rating,
          String branchName,
          String eventName,
          double totalCount,
          String typeDescription,
          String faceCaptureFile,
          String inviteCode}) =>
      MyVisitorLogTodayEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        id: id ?? this.id,
        idVistor: idVistor ?? this.idVistor,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        signIn: signIn ?? this.signIn,
        signOut: signOut ?? this.signOut,
        toCompany: toCompany ?? this.toCompany,
        fromCompany: fromCompany ?? this.fromCompany,
        visitorTypeValue: visitorTypeValue ?? this.visitorTypeValue,
        purpose: purpose ?? this.purpose,
        feedback: feedback ?? this.feedback,
        rating: rating ?? this.rating,
        branchName: branchName ?? this.branchName,
        eventName: eventName ?? this.eventName,
        totalCount: totalCount ?? this.totalCount,
        typeDescription: typeDescription ?? this.typeDescription,
        faceCaptureFile: faceCaptureFile ?? this.faceCaptureFile,
        inviteCode: inviteCode ?? this.inviteCode,
      );
  @override
  String toString() {
    return (StringBuffer('MyVisitorLogTodayEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('idVistor: $idVistor, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('signIn: $signIn, ')
          ..write('signOut: $signOut, ')
          ..write('toCompany: $toCompany, ')
          ..write('fromCompany: $fromCompany, ')
          ..write('visitorTypeValue: $visitorTypeValue, ')
          ..write('purpose: $purpose, ')
          ..write('feedback: $feedback, ')
          ..write('rating: $rating, ')
          ..write('branchName: $branchName, ')
          ..write('eventName: $eventName, ')
          ..write('totalCount: $totalCount, ')
          ..write('typeDescription: $typeDescription, ')
          ..write('faceCaptureFile: $faceCaptureFile, ')
          ..write('inviteCode: $inviteCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              id.hashCode,
                              $mrjc(
                                  idVistor.hashCode,
                                  $mrjc(
                                      fullName.hashCode,
                                      $mrjc(
                                          email.hashCode,
                                          $mrjc(
                                              phoneNumber.hashCode,
                                              $mrjc(
                                                  signIn.hashCode,
                                                  $mrjc(
                                                      signOut.hashCode,
                                                      $mrjc(
                                                          toCompany.hashCode,
                                                          $mrjc(
                                                              fromCompany
                                                                  .hashCode,
                                                              $mrjc(
                                                                  visitorTypeValue
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      purpose
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          feedback
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              rating.hashCode,
                                                                              $mrjc(branchName.hashCode, $mrjc(eventName.hashCode, $mrjc(totalCount.hashCode, $mrjc(typeDescription.hashCode, $mrjc(faceCaptureFile.hashCode, inviteCode.hashCode)))))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MyVisitorLogTodayEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.id == this.id &&
          other.idVistor == this.idVistor &&
          other.fullName == this.fullName &&
          other.email == this.email &&
          other.phoneNumber == this.phoneNumber &&
          other.signIn == this.signIn &&
          other.signOut == this.signOut &&
          other.toCompany == this.toCompany &&
          other.fromCompany == this.fromCompany &&
          other.visitorTypeValue == this.visitorTypeValue &&
          other.purpose == this.purpose &&
          other.feedback == this.feedback &&
          other.rating == this.rating &&
          other.branchName == this.branchName &&
          other.eventName == this.eventName &&
          other.totalCount == this.totalCount &&
          other.typeDescription == this.typeDescription &&
          other.faceCaptureFile == this.faceCaptureFile &&
          other.inviteCode == this.inviteCode);
}

class MyVisitorLogTodayEntityCompanion
    extends UpdateCompanion<MyVisitorLogTodayEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<int> id;
  final Value<double> idVistor;
  final Value<String> fullName;
  final Value<String> email;
  final Value<String> phoneNumber;
  final Value<DateTime> signIn;
  final Value<DateTime> signOut;
  final Value<String> toCompany;
  final Value<String> fromCompany;
  final Value<String> visitorTypeValue;
  final Value<String> purpose;
  final Value<String> feedback;
  final Value<int> rating;
  final Value<String> branchName;
  final Value<String> eventName;
  final Value<double> totalCount;
  final Value<String> typeDescription;
  final Value<String> faceCaptureFile;
  final Value<String> inviteCode;
  const MyVisitorLogTodayEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.idVistor = const Value.absent(),
    this.fullName = const Value.absent(),
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.signIn = const Value.absent(),
    this.signOut = const Value.absent(),
    this.toCompany = const Value.absent(),
    this.fromCompany = const Value.absent(),
    this.visitorTypeValue = const Value.absent(),
    this.purpose = const Value.absent(),
    this.feedback = const Value.absent(),
    this.rating = const Value.absent(),
    this.branchName = const Value.absent(),
    this.eventName = const Value.absent(),
    this.totalCount = const Value.absent(),
    this.typeDescription = const Value.absent(),
    this.faceCaptureFile = const Value.absent(),
    this.inviteCode = const Value.absent(),
  });
  MyVisitorLogTodayEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    @required double idVistor,
    this.fullName = const Value.absent(),
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.signIn = const Value.absent(),
    this.signOut = const Value.absent(),
    this.toCompany = const Value.absent(),
    this.fromCompany = const Value.absent(),
    this.visitorTypeValue = const Value.absent(),
    this.purpose = const Value.absent(),
    this.feedback = const Value.absent(),
    this.rating = const Value.absent(),
    this.branchName = const Value.absent(),
    this.eventName = const Value.absent(),
    this.totalCount = const Value.absent(),
    this.typeDescription = const Value.absent(),
    this.faceCaptureFile = const Value.absent(),
    this.inviteCode = const Value.absent(),
  }) : idVistor = Value(idVistor);
  static Insertable<MyVisitorLogTodayEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<int> id,
    Expression<double> idVistor,
    Expression<String> fullName,
    Expression<String> email,
    Expression<String> phoneNumber,
    Expression<DateTime> signIn,
    Expression<DateTime> signOut,
    Expression<String> toCompany,
    Expression<String> fromCompany,
    Expression<String> visitorTypeValue,
    Expression<String> purpose,
    Expression<String> feedback,
    Expression<int> rating,
    Expression<String> branchName,
    Expression<String> eventName,
    Expression<double> totalCount,
    Expression<String> typeDescription,
    Expression<String> faceCaptureFile,
    Expression<String> inviteCode,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (id != null) 'id': id,
      if (idVistor != null) 'id_vistor': idVistor,
      if (fullName != null) 'full_name': fullName,
      if (email != null) 'email': email,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (signIn != null) 'sign_in': signIn,
      if (signOut != null) 'sign_out': signOut,
      if (toCompany != null) 'to_company': toCompany,
      if (fromCompany != null) 'from_company': fromCompany,
      if (visitorTypeValue != null) 'visitor_type_value': visitorTypeValue,
      if (purpose != null) 'purpose': purpose,
      if (feedback != null) 'feedback': feedback,
      if (rating != null) 'rating': rating,
      if (branchName != null) 'branch_name': branchName,
      if (eventName != null) 'event_name': eventName,
      if (totalCount != null) 'total_count': totalCount,
      if (typeDescription != null) 'type_description': typeDescription,
      if (faceCaptureFile != null) 'face_capture_file': faceCaptureFile,
      if (inviteCode != null) 'invite_code': inviteCode,
    });
  }

  MyVisitorLogTodayEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<int> id,
      Value<double> idVistor,
      Value<String> fullName,
      Value<String> email,
      Value<String> phoneNumber,
      Value<DateTime> signIn,
      Value<DateTime> signOut,
      Value<String> toCompany,
      Value<String> fromCompany,
      Value<String> visitorTypeValue,
      Value<String> purpose,
      Value<String> feedback,
      Value<int> rating,
      Value<String> branchName,
      Value<String> eventName,
      Value<double> totalCount,
      Value<String> typeDescription,
      Value<String> faceCaptureFile,
      Value<String> inviteCode}) {
    return MyVisitorLogTodayEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      id: id ?? this.id,
      idVistor: idVistor ?? this.idVistor,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      signIn: signIn ?? this.signIn,
      signOut: signOut ?? this.signOut,
      toCompany: toCompany ?? this.toCompany,
      fromCompany: fromCompany ?? this.fromCompany,
      visitorTypeValue: visitorTypeValue ?? this.visitorTypeValue,
      purpose: purpose ?? this.purpose,
      feedback: feedback ?? this.feedback,
      rating: rating ?? this.rating,
      branchName: branchName ?? this.branchName,
      eventName: eventName ?? this.eventName,
      totalCount: totalCount ?? this.totalCount,
      typeDescription: typeDescription ?? this.typeDescription,
      faceCaptureFile: faceCaptureFile ?? this.faceCaptureFile,
      inviteCode: inviteCode ?? this.inviteCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idVistor.present) {
      map['id_vistor'] = Variable<double>(idVistor.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (signIn.present) {
      map['sign_in'] = Variable<DateTime>(signIn.value);
    }
    if (signOut.present) {
      map['sign_out'] = Variable<DateTime>(signOut.value);
    }
    if (toCompany.present) {
      map['to_company'] = Variable<String>(toCompany.value);
    }
    if (fromCompany.present) {
      map['from_company'] = Variable<String>(fromCompany.value);
    }
    if (visitorTypeValue.present) {
      map['visitor_type_value'] = Variable<String>(visitorTypeValue.value);
    }
    if (purpose.present) {
      map['purpose'] = Variable<String>(purpose.value);
    }
    if (feedback.present) {
      map['feedback'] = Variable<String>(feedback.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (branchName.present) {
      map['branch_name'] = Variable<String>(branchName.value);
    }
    if (eventName.present) {
      map['event_name'] = Variable<String>(eventName.value);
    }
    if (totalCount.present) {
      map['total_count'] = Variable<double>(totalCount.value);
    }
    if (typeDescription.present) {
      map['type_description'] = Variable<String>(typeDescription.value);
    }
    if (faceCaptureFile.present) {
      map['face_capture_file'] = Variable<String>(faceCaptureFile.value);
    }
    if (inviteCode.present) {
      map['invite_code'] = Variable<String>(inviteCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyVisitorLogTodayEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('idVistor: $idVistor, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('signIn: $signIn, ')
          ..write('signOut: $signOut, ')
          ..write('toCompany: $toCompany, ')
          ..write('fromCompany: $fromCompany, ')
          ..write('visitorTypeValue: $visitorTypeValue, ')
          ..write('purpose: $purpose, ')
          ..write('feedback: $feedback, ')
          ..write('rating: $rating, ')
          ..write('branchName: $branchName, ')
          ..write('eventName: $eventName, ')
          ..write('totalCount: $totalCount, ')
          ..write('typeDescription: $typeDescription, ')
          ..write('faceCaptureFile: $faceCaptureFile, ')
          ..write('inviteCode: $inviteCode')
          ..write(')'))
        .toString();
  }
}

class $MyVisitorLogTodayEntityTable extends MyVisitorLogTodayEntity
    with TableInfo<$MyVisitorLogTodayEntityTable, MyVisitorLogTodayEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $MyVisitorLogTodayEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _idVistorMeta = const VerificationMeta('idVistor');
  GeneratedRealColumn _idVistor;
  @override
  GeneratedRealColumn get idVistor => _idVistor ??= _constructIdVistor();
  GeneratedRealColumn _constructIdVistor() {
    return GeneratedRealColumn(
      'id_vistor',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fullNameMeta = const VerificationMeta('fullName');
  GeneratedTextColumn _fullName;
  @override
  GeneratedTextColumn get fullName => _fullName ??= _constructFullName();
  GeneratedTextColumn _constructFullName() {
    return GeneratedTextColumn(
      'full_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      true,
    );
  }

  final VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  GeneratedTextColumn _phoneNumber;
  @override
  GeneratedTextColumn get phoneNumber =>
      _phoneNumber ??= _constructPhoneNumber();
  GeneratedTextColumn _constructPhoneNumber() {
    return GeneratedTextColumn(
      'phone_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _signInMeta = const VerificationMeta('signIn');
  GeneratedDateTimeColumn _signIn;
  @override
  GeneratedDateTimeColumn get signIn => _signIn ??= _constructSignIn();
  GeneratedDateTimeColumn _constructSignIn() {
    return GeneratedDateTimeColumn(
      'sign_in',
      $tableName,
      true,
    );
  }

  final VerificationMeta _signOutMeta = const VerificationMeta('signOut');
  GeneratedDateTimeColumn _signOut;
  @override
  GeneratedDateTimeColumn get signOut => _signOut ??= _constructSignOut();
  GeneratedDateTimeColumn _constructSignOut() {
    return GeneratedDateTimeColumn(
      'sign_out',
      $tableName,
      true,
    );
  }

  final VerificationMeta _toCompanyMeta = const VerificationMeta('toCompany');
  GeneratedTextColumn _toCompany;
  @override
  GeneratedTextColumn get toCompany => _toCompany ??= _constructToCompany();
  GeneratedTextColumn _constructToCompany() {
    return GeneratedTextColumn(
      'to_company',
      $tableName,
      true,
    );
  }

  final VerificationMeta _fromCompanyMeta =
      const VerificationMeta('fromCompany');
  GeneratedTextColumn _fromCompany;
  @override
  GeneratedTextColumn get fromCompany =>
      _fromCompany ??= _constructFromCompany();
  GeneratedTextColumn _constructFromCompany() {
    return GeneratedTextColumn(
      'from_company',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorTypeValueMeta =
      const VerificationMeta('visitorTypeValue');
  GeneratedTextColumn _visitorTypeValue;
  @override
  GeneratedTextColumn get visitorTypeValue =>
      _visitorTypeValue ??= _constructVisitorTypeValue();
  GeneratedTextColumn _constructVisitorTypeValue() {
    return GeneratedTextColumn(
      'visitor_type_value',
      $tableName,
      true,
    );
  }

  final VerificationMeta _purposeMeta = const VerificationMeta('purpose');
  GeneratedTextColumn _purpose;
  @override
  GeneratedTextColumn get purpose => _purpose ??= _constructPurpose();
  GeneratedTextColumn _constructPurpose() {
    return GeneratedTextColumn(
      'purpose',
      $tableName,
      true,
    );
  }

  final VerificationMeta _feedbackMeta = const VerificationMeta('feedback');
  GeneratedTextColumn _feedback;
  @override
  GeneratedTextColumn get feedback => _feedback ??= _constructFeedback();
  GeneratedTextColumn _constructFeedback() {
    return GeneratedTextColumn(
      'feedback',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  GeneratedIntColumn _rating;
  @override
  GeneratedIntColumn get rating => _rating ??= _constructRating();
  GeneratedIntColumn _constructRating() {
    return GeneratedIntColumn(
      'rating',
      $tableName,
      true,
    );
  }

  final VerificationMeta _branchNameMeta = const VerificationMeta('branchName');
  GeneratedTextColumn _branchName;
  @override
  GeneratedTextColumn get branchName => _branchName ??= _constructBranchName();
  GeneratedTextColumn _constructBranchName() {
    return GeneratedTextColumn(
      'branch_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _eventNameMeta = const VerificationMeta('eventName');
  GeneratedTextColumn _eventName;
  @override
  GeneratedTextColumn get eventName => _eventName ??= _constructEventName();
  GeneratedTextColumn _constructEventName() {
    return GeneratedTextColumn(
      'event_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _totalCountMeta = const VerificationMeta('totalCount');
  GeneratedRealColumn _totalCount;
  @override
  GeneratedRealColumn get totalCount => _totalCount ??= _constructTotalCount();
  GeneratedRealColumn _constructTotalCount() {
    return GeneratedRealColumn(
      'total_count',
      $tableName,
      true,
    );
  }

  final VerificationMeta _typeDescriptionMeta =
      const VerificationMeta('typeDescription');
  GeneratedTextColumn _typeDescription;
  @override
  GeneratedTextColumn get typeDescription =>
      _typeDescription ??= _constructTypeDescription();
  GeneratedTextColumn _constructTypeDescription() {
    return GeneratedTextColumn(
      'type_description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _faceCaptureFileMeta =
      const VerificationMeta('faceCaptureFile');
  GeneratedTextColumn _faceCaptureFile;
  @override
  GeneratedTextColumn get faceCaptureFile =>
      _faceCaptureFile ??= _constructFaceCaptureFile();
  GeneratedTextColumn _constructFaceCaptureFile() {
    return GeneratedTextColumn(
      'face_capture_file',
      $tableName,
      true,
    );
  }

  final VerificationMeta _inviteCodeMeta = const VerificationMeta('inviteCode');
  GeneratedTextColumn _inviteCode;
  @override
  GeneratedTextColumn get inviteCode => _inviteCode ??= _constructInviteCode();
  GeneratedTextColumn _constructInviteCode() {
    return GeneratedTextColumn(
      'invite_code',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        id,
        idVistor,
        fullName,
        email,
        phoneNumber,
        signIn,
        signOut,
        toCompany,
        fromCompany,
        visitorTypeValue,
        purpose,
        feedback,
        rating,
        branchName,
        eventName,
        totalCount,
        typeDescription,
        faceCaptureFile,
        inviteCode
      ];
  @override
  $MyVisitorLogTodayEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_my_visitor_log_today';
  @override
  final String actualTableName = 'cip_today_my_visitor_log_today';
  @override
  VerificationContext validateIntegrity(
      Insertable<MyVisitorLogTodayEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_vistor')) {
      context.handle(_idVistorMeta,
          idVistor.isAcceptableOrUnknown(data['id_vistor'], _idVistorMeta));
    } else if (isInserting) {
      context.missing(_idVistorMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name'], _fullNameMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email'], _emailMeta));
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number'], _phoneNumberMeta));
    }
    if (data.containsKey('sign_in')) {
      context.handle(_signInMeta,
          signIn.isAcceptableOrUnknown(data['sign_in'], _signInMeta));
    }
    if (data.containsKey('sign_out')) {
      context.handle(_signOutMeta,
          signOut.isAcceptableOrUnknown(data['sign_out'], _signOutMeta));
    }
    if (data.containsKey('to_company')) {
      context.handle(_toCompanyMeta,
          toCompany.isAcceptableOrUnknown(data['to_company'], _toCompanyMeta));
    }
    if (data.containsKey('from_company')) {
      context.handle(
          _fromCompanyMeta,
          fromCompany.isAcceptableOrUnknown(
              data['from_company'], _fromCompanyMeta));
    }
    if (data.containsKey('visitor_type_value')) {
      context.handle(
          _visitorTypeValueMeta,
          visitorTypeValue.isAcceptableOrUnknown(
              data['visitor_type_value'], _visitorTypeValueMeta));
    }
    if (data.containsKey('purpose')) {
      context.handle(_purposeMeta,
          purpose.isAcceptableOrUnknown(data['purpose'], _purposeMeta));
    }
    if (data.containsKey('feedback')) {
      context.handle(_feedbackMeta,
          feedback.isAcceptableOrUnknown(data['feedback'], _feedbackMeta));
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating'], _ratingMeta));
    }
    if (data.containsKey('branch_name')) {
      context.handle(
          _branchNameMeta,
          branchName.isAcceptableOrUnknown(
              data['branch_name'], _branchNameMeta));
    }
    if (data.containsKey('event_name')) {
      context.handle(_eventNameMeta,
          eventName.isAcceptableOrUnknown(data['event_name'], _eventNameMeta));
    }
    if (data.containsKey('total_count')) {
      context.handle(
          _totalCountMeta,
          totalCount.isAcceptableOrUnknown(
              data['total_count'], _totalCountMeta));
    }
    if (data.containsKey('type_description')) {
      context.handle(
          _typeDescriptionMeta,
          typeDescription.isAcceptableOrUnknown(
              data['type_description'], _typeDescriptionMeta));
    }
    if (data.containsKey('face_capture_file')) {
      context.handle(
          _faceCaptureFileMeta,
          faceCaptureFile.isAcceptableOrUnknown(
              data['face_capture_file'], _faceCaptureFileMeta));
    }
    if (data.containsKey('invite_code')) {
      context.handle(
          _inviteCodeMeta,
          inviteCode.isAcceptableOrUnknown(
              data['invite_code'], _inviteCodeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyVisitorLogTodayEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MyVisitorLogTodayEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MyVisitorLogTodayEntityTable createAlias(String alias) {
    return $MyVisitorLogTodayEntityTable(_db, alias);
  }
}

class CheckInTimeTodayEntry extends DataClass
    implements Insertable<CheckInTimeTodayEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final int id;
  final DateTime checkIn;
  final DateTime checkOut;
  final DateTime date;
  CheckInTimeTodayEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      @required this.id,
      this.checkIn,
      this.checkOut,
      this.date});
  factory CheckInTimeTodayEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    return CheckInTimeTodayEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      checkIn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}check_in']),
      checkOut: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}check_out']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || checkIn != null) {
      map['check_in'] = Variable<DateTime>(checkIn);
    }
    if (!nullToAbsent || checkOut != null) {
      map['check_out'] = Variable<DateTime>(checkOut);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  CheckInTimeTodayEntityCompanion toCompanion(bool nullToAbsent) {
    return CheckInTimeTodayEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      checkIn: checkIn == null && nullToAbsent
          ? const Value.absent()
          : Value(checkIn),
      checkOut: checkOut == null && nullToAbsent
          ? const Value.absent()
          : Value(checkOut),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory CheckInTimeTodayEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CheckInTimeTodayEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      id: serializer.fromJson<int>(json['id']),
      checkIn: serializer.fromJson<DateTime>(json['checkIn']),
      checkOut: serializer.fromJson<DateTime>(json['checkOut']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'id': serializer.toJson<int>(id),
      'checkIn': serializer.toJson<DateTime>(checkIn),
      'checkOut': serializer.toJson<DateTime>(checkOut),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  CheckInTimeTodayEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          int id,
          DateTime checkIn,
          DateTime checkOut,
          DateTime date}) =>
      CheckInTimeTodayEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        id: id ?? this.id,
        checkIn: checkIn ?? this.checkIn,
        checkOut: checkOut ?? this.checkOut,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('CheckInTimeTodayEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('checkIn: $checkIn, ')
          ..write('checkOut: $checkOut, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              id.hashCode,
                              $mrjc(
                                  checkIn.hashCode,
                                  $mrjc(checkOut.hashCode,
                                      date.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CheckInTimeTodayEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.id == this.id &&
          other.checkIn == this.checkIn &&
          other.checkOut == this.checkOut &&
          other.date == this.date);
}

class CheckInTimeTodayEntityCompanion
    extends UpdateCompanion<CheckInTimeTodayEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<int> id;
  final Value<DateTime> checkIn;
  final Value<DateTime> checkOut;
  final Value<DateTime> date;
  const CheckInTimeTodayEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.checkIn = const Value.absent(),
    this.checkOut = const Value.absent(),
    this.date = const Value.absent(),
  });
  CheckInTimeTodayEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.checkIn = const Value.absent(),
    this.checkOut = const Value.absent(),
    this.date = const Value.absent(),
  });
  static Insertable<CheckInTimeTodayEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<int> id,
    Expression<DateTime> checkIn,
    Expression<DateTime> checkOut,
    Expression<DateTime> date,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (id != null) 'id': id,
      if (checkIn != null) 'check_in': checkIn,
      if (checkOut != null) 'check_out': checkOut,
      if (date != null) 'date': date,
    });
  }

  CheckInTimeTodayEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<int> id,
      Value<DateTime> checkIn,
      Value<DateTime> checkOut,
      Value<DateTime> date}) {
    return CheckInTimeTodayEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      id: id ?? this.id,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (checkIn.present) {
      map['check_in'] = Variable<DateTime>(checkIn.value);
    }
    if (checkOut.present) {
      map['check_out'] = Variable<DateTime>(checkOut.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CheckInTimeTodayEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('checkIn: $checkIn, ')
          ..write('checkOut: $checkOut, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $CheckInTimeTodayEntityTable extends CheckInTimeTodayEntity
    with TableInfo<$CheckInTimeTodayEntityTable, CheckInTimeTodayEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $CheckInTimeTodayEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _checkInMeta = const VerificationMeta('checkIn');
  GeneratedDateTimeColumn _checkIn;
  @override
  GeneratedDateTimeColumn get checkIn => _checkIn ??= _constructCheckIn();
  GeneratedDateTimeColumn _constructCheckIn() {
    return GeneratedDateTimeColumn(
      'check_in',
      $tableName,
      true,
    );
  }

  final VerificationMeta _checkOutMeta = const VerificationMeta('checkOut');
  GeneratedDateTimeColumn _checkOut;
  @override
  GeneratedDateTimeColumn get checkOut => _checkOut ??= _constructCheckOut();
  GeneratedDateTimeColumn _constructCheckOut() {
    return GeneratedDateTimeColumn(
      'check_out',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        id,
        checkIn,
        checkOut,
        date
      ];
  @override
  $CheckInTimeTodayEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_checkin_time_today';
  @override
  final String actualTableName = 'cip_today_checkin_time_today';
  @override
  VerificationContext validateIntegrity(
      Insertable<CheckInTimeTodayEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('check_in')) {
      context.handle(_checkInMeta,
          checkIn.isAcceptableOrUnknown(data['check_in'], _checkInMeta));
    }
    if (data.containsKey('check_out')) {
      context.handle(_checkOutMeta,
          checkOut.isAcceptableOrUnknown(data['check_out'], _checkOutMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CheckInTimeTodayEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CheckInTimeTodayEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CheckInTimeTodayEntityTable createAlias(String alias) {
    return $CheckInTimeTodayEntityTable(_db, alias);
  }
}

class WorkingTimeEntry extends DataClass
    implements Insertable<WorkingTimeEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final int id;
  final double totalHourOfMonth;
  final double totalhourOfWeek;
  final int totalLateDayInMonth;
  final int totalNotCheckoutDayInMonth;
  final int totalNotEnoughInMonth;
  WorkingTimeEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      @required this.id,
      this.totalHourOfMonth,
      this.totalhourOfWeek,
      this.totalLateDayInMonth,
      this.totalNotCheckoutDayInMonth,
      this.totalNotEnoughInMonth});
  factory WorkingTimeEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    return WorkingTimeEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      totalHourOfMonth: doubleType.mapFromDatabaseResponse(
          data['${effectivePrefix}total_hour_of_month']),
      totalhourOfWeek: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}totalhour_of_week']),
      totalLateDayInMonth: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}total_late_day_in_month']),
      totalNotCheckoutDayInMonth: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}total_not_checkout_day_in_month']),
      totalNotEnoughInMonth: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}total_not_enough_in_month']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || totalHourOfMonth != null) {
      map['total_hour_of_month'] = Variable<double>(totalHourOfMonth);
    }
    if (!nullToAbsent || totalhourOfWeek != null) {
      map['totalhour_of_week'] = Variable<double>(totalhourOfWeek);
    }
    if (!nullToAbsent || totalLateDayInMonth != null) {
      map['total_late_day_in_month'] = Variable<int>(totalLateDayInMonth);
    }
    if (!nullToAbsent || totalNotCheckoutDayInMonth != null) {
      map['total_not_checkout_day_in_month'] =
          Variable<int>(totalNotCheckoutDayInMonth);
    }
    if (!nullToAbsent || totalNotEnoughInMonth != null) {
      map['total_not_enough_in_month'] = Variable<int>(totalNotEnoughInMonth);
    }
    return map;
  }

  WorkingTimeEntityCompanion toCompanion(bool nullToAbsent) {
    return WorkingTimeEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      totalHourOfMonth: totalHourOfMonth == null && nullToAbsent
          ? const Value.absent()
          : Value(totalHourOfMonth),
      totalhourOfWeek: totalhourOfWeek == null && nullToAbsent
          ? const Value.absent()
          : Value(totalhourOfWeek),
      totalLateDayInMonth: totalLateDayInMonth == null && nullToAbsent
          ? const Value.absent()
          : Value(totalLateDayInMonth),
      totalNotCheckoutDayInMonth:
          totalNotCheckoutDayInMonth == null && nullToAbsent
              ? const Value.absent()
              : Value(totalNotCheckoutDayInMonth),
      totalNotEnoughInMonth: totalNotEnoughInMonth == null && nullToAbsent
          ? const Value.absent()
          : Value(totalNotEnoughInMonth),
    );
  }

  factory WorkingTimeEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WorkingTimeEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      id: serializer.fromJson<int>(json['id']),
      totalHourOfMonth: serializer.fromJson<double>(json['totalHourOfMonth']),
      totalhourOfWeek: serializer.fromJson<double>(json['totalhourOfWeek']),
      totalLateDayInMonth:
          serializer.fromJson<int>(json['totalLateDayInMonth']),
      totalNotCheckoutDayInMonth:
          serializer.fromJson<int>(json['totalNotCheckoutDayInMonth']),
      totalNotEnoughInMonth:
          serializer.fromJson<int>(json['totalNotEnoughInMonth']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'id': serializer.toJson<int>(id),
      'totalHourOfMonth': serializer.toJson<double>(totalHourOfMonth),
      'totalhourOfWeek': serializer.toJson<double>(totalhourOfWeek),
      'totalLateDayInMonth': serializer.toJson<int>(totalLateDayInMonth),
      'totalNotCheckoutDayInMonth':
          serializer.toJson<int>(totalNotCheckoutDayInMonth),
      'totalNotEnoughInMonth': serializer.toJson<int>(totalNotEnoughInMonth),
    };
  }

  WorkingTimeEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          int id,
          double totalHourOfMonth,
          double totalhourOfWeek,
          int totalLateDayInMonth,
          int totalNotCheckoutDayInMonth,
          int totalNotEnoughInMonth}) =>
      WorkingTimeEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        id: id ?? this.id,
        totalHourOfMonth: totalHourOfMonth ?? this.totalHourOfMonth,
        totalhourOfWeek: totalhourOfWeek ?? this.totalhourOfWeek,
        totalLateDayInMonth: totalLateDayInMonth ?? this.totalLateDayInMonth,
        totalNotCheckoutDayInMonth:
            totalNotCheckoutDayInMonth ?? this.totalNotCheckoutDayInMonth,
        totalNotEnoughInMonth:
            totalNotEnoughInMonth ?? this.totalNotEnoughInMonth,
      );
  @override
  String toString() {
    return (StringBuffer('WorkingTimeEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('totalHourOfMonth: $totalHourOfMonth, ')
          ..write('totalhourOfWeek: $totalhourOfWeek, ')
          ..write('totalLateDayInMonth: $totalLateDayInMonth, ')
          ..write('totalNotCheckoutDayInMonth: $totalNotCheckoutDayInMonth, ')
          ..write('totalNotEnoughInMonth: $totalNotEnoughInMonth')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              id.hashCode,
                              $mrjc(
                                  totalHourOfMonth.hashCode,
                                  $mrjc(
                                      totalhourOfWeek.hashCode,
                                      $mrjc(
                                          totalLateDayInMonth.hashCode,
                                          $mrjc(
                                              totalNotCheckoutDayInMonth
                                                  .hashCode,
                                              totalNotEnoughInMonth
                                                  .hashCode))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is WorkingTimeEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.id == this.id &&
          other.totalHourOfMonth == this.totalHourOfMonth &&
          other.totalhourOfWeek == this.totalhourOfWeek &&
          other.totalLateDayInMonth == this.totalLateDayInMonth &&
          other.totalNotCheckoutDayInMonth == this.totalNotCheckoutDayInMonth &&
          other.totalNotEnoughInMonth == this.totalNotEnoughInMonth);
}

class WorkingTimeEntityCompanion extends UpdateCompanion<WorkingTimeEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<int> id;
  final Value<double> totalHourOfMonth;
  final Value<double> totalhourOfWeek;
  final Value<int> totalLateDayInMonth;
  final Value<int> totalNotCheckoutDayInMonth;
  final Value<int> totalNotEnoughInMonth;
  const WorkingTimeEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.totalHourOfMonth = const Value.absent(),
    this.totalhourOfWeek = const Value.absent(),
    this.totalLateDayInMonth = const Value.absent(),
    this.totalNotCheckoutDayInMonth = const Value.absent(),
    this.totalNotEnoughInMonth = const Value.absent(),
  });
  WorkingTimeEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.totalHourOfMonth = const Value.absent(),
    this.totalhourOfWeek = const Value.absent(),
    this.totalLateDayInMonth = const Value.absent(),
    this.totalNotCheckoutDayInMonth = const Value.absent(),
    this.totalNotEnoughInMonth = const Value.absent(),
  });
  static Insertable<WorkingTimeEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<int> id,
    Expression<double> totalHourOfMonth,
    Expression<double> totalhourOfWeek,
    Expression<int> totalLateDayInMonth,
    Expression<int> totalNotCheckoutDayInMonth,
    Expression<int> totalNotEnoughInMonth,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (id != null) 'id': id,
      if (totalHourOfMonth != null) 'total_hour_of_month': totalHourOfMonth,
      if (totalhourOfWeek != null) 'totalhour_of_week': totalhourOfWeek,
      if (totalLateDayInMonth != null)
        'total_late_day_in_month': totalLateDayInMonth,
      if (totalNotCheckoutDayInMonth != null)
        'total_not_checkout_day_in_month': totalNotCheckoutDayInMonth,
      if (totalNotEnoughInMonth != null)
        'total_not_enough_in_month': totalNotEnoughInMonth,
    });
  }

  WorkingTimeEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<int> id,
      Value<double> totalHourOfMonth,
      Value<double> totalhourOfWeek,
      Value<int> totalLateDayInMonth,
      Value<int> totalNotCheckoutDayInMonth,
      Value<int> totalNotEnoughInMonth}) {
    return WorkingTimeEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      id: id ?? this.id,
      totalHourOfMonth: totalHourOfMonth ?? this.totalHourOfMonth,
      totalhourOfWeek: totalhourOfWeek ?? this.totalhourOfWeek,
      totalLateDayInMonth: totalLateDayInMonth ?? this.totalLateDayInMonth,
      totalNotCheckoutDayInMonth:
          totalNotCheckoutDayInMonth ?? this.totalNotCheckoutDayInMonth,
      totalNotEnoughInMonth:
          totalNotEnoughInMonth ?? this.totalNotEnoughInMonth,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (totalHourOfMonth.present) {
      map['total_hour_of_month'] = Variable<double>(totalHourOfMonth.value);
    }
    if (totalhourOfWeek.present) {
      map['totalhour_of_week'] = Variable<double>(totalhourOfWeek.value);
    }
    if (totalLateDayInMonth.present) {
      map['total_late_day_in_month'] = Variable<int>(totalLateDayInMonth.value);
    }
    if (totalNotCheckoutDayInMonth.present) {
      map['total_not_checkout_day_in_month'] =
          Variable<int>(totalNotCheckoutDayInMonth.value);
    }
    if (totalNotEnoughInMonth.present) {
      map['total_not_enough_in_month'] =
          Variable<int>(totalNotEnoughInMonth.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkingTimeEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('totalHourOfMonth: $totalHourOfMonth, ')
          ..write('totalhourOfWeek: $totalhourOfWeek, ')
          ..write('totalLateDayInMonth: $totalLateDayInMonth, ')
          ..write('totalNotCheckoutDayInMonth: $totalNotCheckoutDayInMonth, ')
          ..write('totalNotEnoughInMonth: $totalNotEnoughInMonth')
          ..write(')'))
        .toString();
  }
}

class $WorkingTimeEntityTable extends WorkingTimeEntity
    with TableInfo<$WorkingTimeEntityTable, WorkingTimeEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $WorkingTimeEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _totalHourOfMonthMeta =
      const VerificationMeta('totalHourOfMonth');
  GeneratedRealColumn _totalHourOfMonth;
  @override
  GeneratedRealColumn get totalHourOfMonth =>
      _totalHourOfMonth ??= _constructTotalHourOfMonth();
  GeneratedRealColumn _constructTotalHourOfMonth() {
    return GeneratedRealColumn(
      'total_hour_of_month',
      $tableName,
      true,
    );
  }

  final VerificationMeta _totalhourOfWeekMeta =
      const VerificationMeta('totalhourOfWeek');
  GeneratedRealColumn _totalhourOfWeek;
  @override
  GeneratedRealColumn get totalhourOfWeek =>
      _totalhourOfWeek ??= _constructTotalhourOfWeek();
  GeneratedRealColumn _constructTotalhourOfWeek() {
    return GeneratedRealColumn(
      'totalhour_of_week',
      $tableName,
      true,
    );
  }

  final VerificationMeta _totalLateDayInMonthMeta =
      const VerificationMeta('totalLateDayInMonth');
  GeneratedIntColumn _totalLateDayInMonth;
  @override
  GeneratedIntColumn get totalLateDayInMonth =>
      _totalLateDayInMonth ??= _constructTotalLateDayInMonth();
  GeneratedIntColumn _constructTotalLateDayInMonth() {
    return GeneratedIntColumn(
      'total_late_day_in_month',
      $tableName,
      true,
    );
  }

  final VerificationMeta _totalNotCheckoutDayInMonthMeta =
      const VerificationMeta('totalNotCheckoutDayInMonth');
  GeneratedIntColumn _totalNotCheckoutDayInMonth;
  @override
  GeneratedIntColumn get totalNotCheckoutDayInMonth =>
      _totalNotCheckoutDayInMonth ??= _constructTotalNotCheckoutDayInMonth();
  GeneratedIntColumn _constructTotalNotCheckoutDayInMonth() {
    return GeneratedIntColumn(
      'total_not_checkout_day_in_month',
      $tableName,
      true,
    );
  }

  final VerificationMeta _totalNotEnoughInMonthMeta =
      const VerificationMeta('totalNotEnoughInMonth');
  GeneratedIntColumn _totalNotEnoughInMonth;
  @override
  GeneratedIntColumn get totalNotEnoughInMonth =>
      _totalNotEnoughInMonth ??= _constructTotalNotEnoughInMonth();
  GeneratedIntColumn _constructTotalNotEnoughInMonth() {
    return GeneratedIntColumn(
      'total_not_enough_in_month',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        id,
        totalHourOfMonth,
        totalhourOfWeek,
        totalLateDayInMonth,
        totalNotCheckoutDayInMonth,
        totalNotEnoughInMonth
      ];
  @override
  $WorkingTimeEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_working_time';
  @override
  final String actualTableName = 'cip_today_working_time';
  @override
  VerificationContext validateIntegrity(Insertable<WorkingTimeEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('total_hour_of_month')) {
      context.handle(
          _totalHourOfMonthMeta,
          totalHourOfMonth.isAcceptableOrUnknown(
              data['total_hour_of_month'], _totalHourOfMonthMeta));
    }
    if (data.containsKey('totalhour_of_week')) {
      context.handle(
          _totalhourOfWeekMeta,
          totalhourOfWeek.isAcceptableOrUnknown(
              data['totalhour_of_week'], _totalhourOfWeekMeta));
    }
    if (data.containsKey('total_late_day_in_month')) {
      context.handle(
          _totalLateDayInMonthMeta,
          totalLateDayInMonth.isAcceptableOrUnknown(
              data['total_late_day_in_month'], _totalLateDayInMonthMeta));
    }
    if (data.containsKey('total_not_checkout_day_in_month')) {
      context.handle(
          _totalNotCheckoutDayInMonthMeta,
          totalNotCheckoutDayInMonth.isAcceptableOrUnknown(
              data['total_not_checkout_day_in_month'],
              _totalNotCheckoutDayInMonthMeta));
    }
    if (data.containsKey('total_not_enough_in_month')) {
      context.handle(
          _totalNotEnoughInMonthMeta,
          totalNotEnoughInMonth.isAcceptableOrUnknown(
              data['total_not_enough_in_month'], _totalNotEnoughInMonthMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkingTimeEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return WorkingTimeEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WorkingTimeEntityTable createAlias(String alias) {
    return $WorkingTimeEntityTable(_db, alias);
  }
}

class MyVisitorLogEntry extends DataClass
    implements Insertable<MyVisitorLogEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final int id;
  final double idVistor;
  final String fullName;
  final String phoneNumber;
  final String email;
  final DateTime signIn;
  final DateTime signOut;
  final String fromCompany;
  final int branchId;
  final String branchName;
  final String visitorType;
  final String visitorTypeValue;
  final String faceCaptureFile;
  final int rating;
  final String feedback;
  final String inviteCode;
  MyVisitorLogEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      @required this.id,
      @required this.idVistor,
      this.fullName,
      this.phoneNumber,
      this.email,
      this.signIn,
      this.signOut,
      this.fromCompany,
      this.branchId,
      this.branchName,
      this.visitorType,
      this.visitorTypeValue,
      this.faceCaptureFile,
      this.rating,
      this.feedback,
      this.inviteCode});
  factory MyVisitorLogEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    return MyVisitorLogEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idVistor: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}id_vistor']),
      fullName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}full_name']),
      phoneNumber: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}phone_number']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      signIn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sign_in']),
      signOut: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sign_out']),
      fromCompany: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}from_company']),
      branchId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}branch_id']),
      branchName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_name']),
      visitorType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_type']),
      visitorTypeValue: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}visitor_type_value']),
      faceCaptureFile: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}face_capture_file']),
      rating: intType.mapFromDatabaseResponse(data['${effectivePrefix}rating']),
      feedback: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}feedback']),
      inviteCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}invite_code']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idVistor != null) {
      map['id_vistor'] = Variable<double>(idVistor);
    }
    if (!nullToAbsent || fullName != null) {
      map['full_name'] = Variable<String>(fullName);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || signIn != null) {
      map['sign_in'] = Variable<DateTime>(signIn);
    }
    if (!nullToAbsent || signOut != null) {
      map['sign_out'] = Variable<DateTime>(signOut);
    }
    if (!nullToAbsent || fromCompany != null) {
      map['from_company'] = Variable<String>(fromCompany);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<int>(branchId);
    }
    if (!nullToAbsent || branchName != null) {
      map['branch_name'] = Variable<String>(branchName);
    }
    if (!nullToAbsent || visitorType != null) {
      map['visitor_type'] = Variable<String>(visitorType);
    }
    if (!nullToAbsent || visitorTypeValue != null) {
      map['visitor_type_value'] = Variable<String>(visitorTypeValue);
    }
    if (!nullToAbsent || faceCaptureFile != null) {
      map['face_capture_file'] = Variable<String>(faceCaptureFile);
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<int>(rating);
    }
    if (!nullToAbsent || feedback != null) {
      map['feedback'] = Variable<String>(feedback);
    }
    if (!nullToAbsent || inviteCode != null) {
      map['invite_code'] = Variable<String>(inviteCode);
    }
    return map;
  }

  MyVisitorLogEntityCompanion toCompanion(bool nullToAbsent) {
    return MyVisitorLogEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idVistor: idVistor == null && nullToAbsent
          ? const Value.absent()
          : Value(idVistor),
      fullName: fullName == null && nullToAbsent
          ? const Value.absent()
          : Value(fullName),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      signIn:
          signIn == null && nullToAbsent ? const Value.absent() : Value(signIn),
      signOut: signOut == null && nullToAbsent
          ? const Value.absent()
          : Value(signOut),
      fromCompany: fromCompany == null && nullToAbsent
          ? const Value.absent()
          : Value(fromCompany),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      branchName: branchName == null && nullToAbsent
          ? const Value.absent()
          : Value(branchName),
      visitorType: visitorType == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorType),
      visitorTypeValue: visitorTypeValue == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorTypeValue),
      faceCaptureFile: faceCaptureFile == null && nullToAbsent
          ? const Value.absent()
          : Value(faceCaptureFile),
      rating:
          rating == null && nullToAbsent ? const Value.absent() : Value(rating),
      feedback: feedback == null && nullToAbsent
          ? const Value.absent()
          : Value(feedback),
      inviteCode: inviteCode == null && nullToAbsent
          ? const Value.absent()
          : Value(inviteCode),
    );
  }

  factory MyVisitorLogEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MyVisitorLogEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      id: serializer.fromJson<int>(json['id']),
      idVistor: serializer.fromJson<double>(json['idVistor']),
      fullName: serializer.fromJson<String>(json['fullName']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      email: serializer.fromJson<String>(json['email']),
      signIn: serializer.fromJson<DateTime>(json['signIn']),
      signOut: serializer.fromJson<DateTime>(json['signOut']),
      fromCompany: serializer.fromJson<String>(json['fromCompany']),
      branchId: serializer.fromJson<int>(json['branchId']),
      branchName: serializer.fromJson<String>(json['branchName']),
      visitorType: serializer.fromJson<String>(json['visitorType']),
      visitorTypeValue: serializer.fromJson<String>(json['visitorTypeValue']),
      faceCaptureFile: serializer.fromJson<String>(json['faceCaptureFile']),
      rating: serializer.fromJson<int>(json['rating']),
      feedback: serializer.fromJson<String>(json['feedback']),
      inviteCode: serializer.fromJson<String>(json['inviteCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'id': serializer.toJson<int>(id),
      'idVistor': serializer.toJson<double>(idVistor),
      'fullName': serializer.toJson<String>(fullName),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'email': serializer.toJson<String>(email),
      'signIn': serializer.toJson<DateTime>(signIn),
      'signOut': serializer.toJson<DateTime>(signOut),
      'fromCompany': serializer.toJson<String>(fromCompany),
      'branchId': serializer.toJson<int>(branchId),
      'branchName': serializer.toJson<String>(branchName),
      'visitorType': serializer.toJson<String>(visitorType),
      'visitorTypeValue': serializer.toJson<String>(visitorTypeValue),
      'faceCaptureFile': serializer.toJson<String>(faceCaptureFile),
      'rating': serializer.toJson<int>(rating),
      'feedback': serializer.toJson<String>(feedback),
      'inviteCode': serializer.toJson<String>(inviteCode),
    };
  }

  MyVisitorLogEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          int id,
          double idVistor,
          String fullName,
          String phoneNumber,
          String email,
          DateTime signIn,
          DateTime signOut,
          String fromCompany,
          int branchId,
          String branchName,
          String visitorType,
          String visitorTypeValue,
          String faceCaptureFile,
          int rating,
          String feedback,
          String inviteCode}) =>
      MyVisitorLogEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        id: id ?? this.id,
        idVistor: idVistor ?? this.idVistor,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        signIn: signIn ?? this.signIn,
        signOut: signOut ?? this.signOut,
        fromCompany: fromCompany ?? this.fromCompany,
        branchId: branchId ?? this.branchId,
        branchName: branchName ?? this.branchName,
        visitorType: visitorType ?? this.visitorType,
        visitorTypeValue: visitorTypeValue ?? this.visitorTypeValue,
        faceCaptureFile: faceCaptureFile ?? this.faceCaptureFile,
        rating: rating ?? this.rating,
        feedback: feedback ?? this.feedback,
        inviteCode: inviteCode ?? this.inviteCode,
      );
  @override
  String toString() {
    return (StringBuffer('MyVisitorLogEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('idVistor: $idVistor, ')
          ..write('fullName: $fullName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('email: $email, ')
          ..write('signIn: $signIn, ')
          ..write('signOut: $signOut, ')
          ..write('fromCompany: $fromCompany, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('visitorType: $visitorType, ')
          ..write('visitorTypeValue: $visitorTypeValue, ')
          ..write('faceCaptureFile: $faceCaptureFile, ')
          ..write('rating: $rating, ')
          ..write('feedback: $feedback, ')
          ..write('inviteCode: $inviteCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              id.hashCode,
                              $mrjc(
                                  idVistor.hashCode,
                                  $mrjc(
                                      fullName.hashCode,
                                      $mrjc(
                                          phoneNumber.hashCode,
                                          $mrjc(
                                              email.hashCode,
                                              $mrjc(
                                                  signIn.hashCode,
                                                  $mrjc(
                                                      signOut.hashCode,
                                                      $mrjc(
                                                          fromCompany.hashCode,
                                                          $mrjc(
                                                              branchId.hashCode,
                                                              $mrjc(
                                                                  branchName
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      visitorType
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          visitorTypeValue
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              faceCaptureFile.hashCode,
                                                                              $mrjc(rating.hashCode, $mrjc(feedback.hashCode, inviteCode.hashCode))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MyVisitorLogEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.id == this.id &&
          other.idVistor == this.idVistor &&
          other.fullName == this.fullName &&
          other.phoneNumber == this.phoneNumber &&
          other.email == this.email &&
          other.signIn == this.signIn &&
          other.signOut == this.signOut &&
          other.fromCompany == this.fromCompany &&
          other.branchId == this.branchId &&
          other.branchName == this.branchName &&
          other.visitorType == this.visitorType &&
          other.visitorTypeValue == this.visitorTypeValue &&
          other.faceCaptureFile == this.faceCaptureFile &&
          other.rating == this.rating &&
          other.feedback == this.feedback &&
          other.inviteCode == this.inviteCode);
}

class MyVisitorLogEntityCompanion extends UpdateCompanion<MyVisitorLogEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<int> id;
  final Value<double> idVistor;
  final Value<String> fullName;
  final Value<String> phoneNumber;
  final Value<String> email;
  final Value<DateTime> signIn;
  final Value<DateTime> signOut;
  final Value<String> fromCompany;
  final Value<int> branchId;
  final Value<String> branchName;
  final Value<String> visitorType;
  final Value<String> visitorTypeValue;
  final Value<String> faceCaptureFile;
  final Value<int> rating;
  final Value<String> feedback;
  final Value<String> inviteCode;
  const MyVisitorLogEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.idVistor = const Value.absent(),
    this.fullName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.signIn = const Value.absent(),
    this.signOut = const Value.absent(),
    this.fromCompany = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.visitorType = const Value.absent(),
    this.visitorTypeValue = const Value.absent(),
    this.faceCaptureFile = const Value.absent(),
    this.rating = const Value.absent(),
    this.feedback = const Value.absent(),
    this.inviteCode = const Value.absent(),
  });
  MyVisitorLogEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    @required double idVistor,
    this.fullName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.signIn = const Value.absent(),
    this.signOut = const Value.absent(),
    this.fromCompany = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.visitorType = const Value.absent(),
    this.visitorTypeValue = const Value.absent(),
    this.faceCaptureFile = const Value.absent(),
    this.rating = const Value.absent(),
    this.feedback = const Value.absent(),
    this.inviteCode = const Value.absent(),
  }) : idVistor = Value(idVistor);
  static Insertable<MyVisitorLogEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<int> id,
    Expression<double> idVistor,
    Expression<String> fullName,
    Expression<String> phoneNumber,
    Expression<String> email,
    Expression<DateTime> signIn,
    Expression<DateTime> signOut,
    Expression<String> fromCompany,
    Expression<int> branchId,
    Expression<String> branchName,
    Expression<String> visitorType,
    Expression<String> visitorTypeValue,
    Expression<String> faceCaptureFile,
    Expression<int> rating,
    Expression<String> feedback,
    Expression<String> inviteCode,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (id != null) 'id': id,
      if (idVistor != null) 'id_vistor': idVistor,
      if (fullName != null) 'full_name': fullName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (email != null) 'email': email,
      if (signIn != null) 'sign_in': signIn,
      if (signOut != null) 'sign_out': signOut,
      if (fromCompany != null) 'from_company': fromCompany,
      if (branchId != null) 'branch_id': branchId,
      if (branchName != null) 'branch_name': branchName,
      if (visitorType != null) 'visitor_type': visitorType,
      if (visitorTypeValue != null) 'visitor_type_value': visitorTypeValue,
      if (faceCaptureFile != null) 'face_capture_file': faceCaptureFile,
      if (rating != null) 'rating': rating,
      if (feedback != null) 'feedback': feedback,
      if (inviteCode != null) 'invite_code': inviteCode,
    });
  }

  MyVisitorLogEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<int> id,
      Value<double> idVistor,
      Value<String> fullName,
      Value<String> phoneNumber,
      Value<String> email,
      Value<DateTime> signIn,
      Value<DateTime> signOut,
      Value<String> fromCompany,
      Value<int> branchId,
      Value<String> branchName,
      Value<String> visitorType,
      Value<String> visitorTypeValue,
      Value<String> faceCaptureFile,
      Value<int> rating,
      Value<String> feedback,
      Value<String> inviteCode}) {
    return MyVisitorLogEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      id: id ?? this.id,
      idVistor: idVistor ?? this.idVistor,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      signIn: signIn ?? this.signIn,
      signOut: signOut ?? this.signOut,
      fromCompany: fromCompany ?? this.fromCompany,
      branchId: branchId ?? this.branchId,
      branchName: branchName ?? this.branchName,
      visitorType: visitorType ?? this.visitorType,
      visitorTypeValue: visitorTypeValue ?? this.visitorTypeValue,
      faceCaptureFile: faceCaptureFile ?? this.faceCaptureFile,
      rating: rating ?? this.rating,
      feedback: feedback ?? this.feedback,
      inviteCode: inviteCode ?? this.inviteCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idVistor.present) {
      map['id_vistor'] = Variable<double>(idVistor.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (signIn.present) {
      map['sign_in'] = Variable<DateTime>(signIn.value);
    }
    if (signOut.present) {
      map['sign_out'] = Variable<DateTime>(signOut.value);
    }
    if (fromCompany.present) {
      map['from_company'] = Variable<String>(fromCompany.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<int>(branchId.value);
    }
    if (branchName.present) {
      map['branch_name'] = Variable<String>(branchName.value);
    }
    if (visitorType.present) {
      map['visitor_type'] = Variable<String>(visitorType.value);
    }
    if (visitorTypeValue.present) {
      map['visitor_type_value'] = Variable<String>(visitorTypeValue.value);
    }
    if (faceCaptureFile.present) {
      map['face_capture_file'] = Variable<String>(faceCaptureFile.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (feedback.present) {
      map['feedback'] = Variable<String>(feedback.value);
    }
    if (inviteCode.present) {
      map['invite_code'] = Variable<String>(inviteCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyVisitorLogEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('idVistor: $idVistor, ')
          ..write('fullName: $fullName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('email: $email, ')
          ..write('signIn: $signIn, ')
          ..write('signOut: $signOut, ')
          ..write('fromCompany: $fromCompany, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('visitorType: $visitorType, ')
          ..write('visitorTypeValue: $visitorTypeValue, ')
          ..write('faceCaptureFile: $faceCaptureFile, ')
          ..write('rating: $rating, ')
          ..write('feedback: $feedback, ')
          ..write('inviteCode: $inviteCode')
          ..write(')'))
        .toString();
  }
}

class $MyVisitorLogEntityTable extends MyVisitorLogEntity
    with TableInfo<$MyVisitorLogEntityTable, MyVisitorLogEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $MyVisitorLogEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _idVistorMeta = const VerificationMeta('idVistor');
  GeneratedRealColumn _idVistor;
  @override
  GeneratedRealColumn get idVistor => _idVistor ??= _constructIdVistor();
  GeneratedRealColumn _constructIdVistor() {
    return GeneratedRealColumn(
      'id_vistor',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fullNameMeta = const VerificationMeta('fullName');
  GeneratedTextColumn _fullName;
  @override
  GeneratedTextColumn get fullName => _fullName ??= _constructFullName();
  GeneratedTextColumn _constructFullName() {
    return GeneratedTextColumn(
      'full_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  GeneratedTextColumn _phoneNumber;
  @override
  GeneratedTextColumn get phoneNumber =>
      _phoneNumber ??= _constructPhoneNumber();
  GeneratedTextColumn _constructPhoneNumber() {
    return GeneratedTextColumn(
      'phone_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      true,
    );
  }

  final VerificationMeta _signInMeta = const VerificationMeta('signIn');
  GeneratedDateTimeColumn _signIn;
  @override
  GeneratedDateTimeColumn get signIn => _signIn ??= _constructSignIn();
  GeneratedDateTimeColumn _constructSignIn() {
    return GeneratedDateTimeColumn(
      'sign_in',
      $tableName,
      true,
    );
  }

  final VerificationMeta _signOutMeta = const VerificationMeta('signOut');
  GeneratedDateTimeColumn _signOut;
  @override
  GeneratedDateTimeColumn get signOut => _signOut ??= _constructSignOut();
  GeneratedDateTimeColumn _constructSignOut() {
    return GeneratedDateTimeColumn(
      'sign_out',
      $tableName,
      true,
    );
  }

  final VerificationMeta _fromCompanyMeta =
      const VerificationMeta('fromCompany');
  GeneratedTextColumn _fromCompany;
  @override
  GeneratedTextColumn get fromCompany =>
      _fromCompany ??= _constructFromCompany();
  GeneratedTextColumn _constructFromCompany() {
    return GeneratedTextColumn(
      'from_company',
      $tableName,
      true,
    );
  }

  final VerificationMeta _branchIdMeta = const VerificationMeta('branchId');
  GeneratedIntColumn _branchId;
  @override
  GeneratedIntColumn get branchId => _branchId ??= _constructBranchId();
  GeneratedIntColumn _constructBranchId() {
    return GeneratedIntColumn(
      'branch_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _branchNameMeta = const VerificationMeta('branchName');
  GeneratedTextColumn _branchName;
  @override
  GeneratedTextColumn get branchName => _branchName ??= _constructBranchName();
  GeneratedTextColumn _constructBranchName() {
    return GeneratedTextColumn(
      'branch_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorTypeMeta =
      const VerificationMeta('visitorType');
  GeneratedTextColumn _visitorType;
  @override
  GeneratedTextColumn get visitorType =>
      _visitorType ??= _constructVisitorType();
  GeneratedTextColumn _constructVisitorType() {
    return GeneratedTextColumn(
      'visitor_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorTypeValueMeta =
      const VerificationMeta('visitorTypeValue');
  GeneratedTextColumn _visitorTypeValue;
  @override
  GeneratedTextColumn get visitorTypeValue =>
      _visitorTypeValue ??= _constructVisitorTypeValue();
  GeneratedTextColumn _constructVisitorTypeValue() {
    return GeneratedTextColumn(
      'visitor_type_value',
      $tableName,
      true,
    );
  }

  final VerificationMeta _faceCaptureFileMeta =
      const VerificationMeta('faceCaptureFile');
  GeneratedTextColumn _faceCaptureFile;
  @override
  GeneratedTextColumn get faceCaptureFile =>
      _faceCaptureFile ??= _constructFaceCaptureFile();
  GeneratedTextColumn _constructFaceCaptureFile() {
    return GeneratedTextColumn(
      'face_capture_file',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  GeneratedIntColumn _rating;
  @override
  GeneratedIntColumn get rating => _rating ??= _constructRating();
  GeneratedIntColumn _constructRating() {
    return GeneratedIntColumn(
      'rating',
      $tableName,
      true,
    );
  }

  final VerificationMeta _feedbackMeta = const VerificationMeta('feedback');
  GeneratedTextColumn _feedback;
  @override
  GeneratedTextColumn get feedback => _feedback ??= _constructFeedback();
  GeneratedTextColumn _constructFeedback() {
    return GeneratedTextColumn(
      'feedback',
      $tableName,
      true,
    );
  }

  final VerificationMeta _inviteCodeMeta = const VerificationMeta('inviteCode');
  GeneratedTextColumn _inviteCode;
  @override
  GeneratedTextColumn get inviteCode => _inviteCode ??= _constructInviteCode();
  GeneratedTextColumn _constructInviteCode() {
    return GeneratedTextColumn(
      'invite_code',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        id,
        idVistor,
        fullName,
        phoneNumber,
        email,
        signIn,
        signOut,
        fromCompany,
        branchId,
        branchName,
        visitorType,
        visitorTypeValue,
        faceCaptureFile,
        rating,
        feedback,
        inviteCode
      ];
  @override
  $MyVisitorLogEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_my_visitor_log';
  @override
  final String actualTableName = 'cip_today_my_visitor_log';
  @override
  VerificationContext validateIntegrity(Insertable<MyVisitorLogEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_vistor')) {
      context.handle(_idVistorMeta,
          idVistor.isAcceptableOrUnknown(data['id_vistor'], _idVistorMeta));
    } else if (isInserting) {
      context.missing(_idVistorMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name'], _fullNameMeta));
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number'], _phoneNumberMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email'], _emailMeta));
    }
    if (data.containsKey('sign_in')) {
      context.handle(_signInMeta,
          signIn.isAcceptableOrUnknown(data['sign_in'], _signInMeta));
    }
    if (data.containsKey('sign_out')) {
      context.handle(_signOutMeta,
          signOut.isAcceptableOrUnknown(data['sign_out'], _signOutMeta));
    }
    if (data.containsKey('from_company')) {
      context.handle(
          _fromCompanyMeta,
          fromCompany.isAcceptableOrUnknown(
              data['from_company'], _fromCompanyMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id'], _branchIdMeta));
    }
    if (data.containsKey('branch_name')) {
      context.handle(
          _branchNameMeta,
          branchName.isAcceptableOrUnknown(
              data['branch_name'], _branchNameMeta));
    }
    if (data.containsKey('visitor_type')) {
      context.handle(
          _visitorTypeMeta,
          visitorType.isAcceptableOrUnknown(
              data['visitor_type'], _visitorTypeMeta));
    }
    if (data.containsKey('visitor_type_value')) {
      context.handle(
          _visitorTypeValueMeta,
          visitorTypeValue.isAcceptableOrUnknown(
              data['visitor_type_value'], _visitorTypeValueMeta));
    }
    if (data.containsKey('face_capture_file')) {
      context.handle(
          _faceCaptureFileMeta,
          faceCaptureFile.isAcceptableOrUnknown(
              data['face_capture_file'], _faceCaptureFileMeta));
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating'], _ratingMeta));
    }
    if (data.containsKey('feedback')) {
      context.handle(_feedbackMeta,
          feedback.isAcceptableOrUnknown(data['feedback'], _feedbackMeta));
    }
    if (data.containsKey('invite_code')) {
      context.handle(
          _inviteCodeMeta,
          inviteCode.isAcceptableOrUnknown(
              data['invite_code'], _inviteCodeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyVisitorLogEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MyVisitorLogEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MyVisitorLogEntityTable createAlias(String alias) {
    return $MyVisitorLogEntityTable(_db, alias);
  }
}

class VisitorInvitationEntry extends DataClass
    implements Insertable<VisitorInvitationEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final double idInvitation;
  final String visitorName;
  final String visitorEmail;
  final String visitorPhoneNumber;
  final String visitorCompany;
  final String visitorAvatarFileName;
  final String inviteCode;
  final double id;
  VisitorInvitationEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      @required this.idInvitation,
      this.visitorName,
      this.visitorEmail,
      this.visitorPhoneNumber,
      this.visitorCompany,
      this.visitorAvatarFileName,
      this.inviteCode,
      this.id});
  factory VisitorInvitationEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return VisitorInvitationEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      idInvitation: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}id_invitation']),
      visitorName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_name']),
      visitorEmail: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_email']),
      visitorPhoneNumber: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}visitor_phone_number']),
      visitorCompany: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_company']),
      visitorAvatarFileName: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}visitor_avatar_file_name']),
      inviteCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}invite_code']),
      id: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || idInvitation != null) {
      map['id_invitation'] = Variable<double>(idInvitation);
    }
    if (!nullToAbsent || visitorName != null) {
      map['visitor_name'] = Variable<String>(visitorName);
    }
    if (!nullToAbsent || visitorEmail != null) {
      map['visitor_email'] = Variable<String>(visitorEmail);
    }
    if (!nullToAbsent || visitorPhoneNumber != null) {
      map['visitor_phone_number'] = Variable<String>(visitorPhoneNumber);
    }
    if (!nullToAbsent || visitorCompany != null) {
      map['visitor_company'] = Variable<String>(visitorCompany);
    }
    if (!nullToAbsent || visitorAvatarFileName != null) {
      map['visitor_avatar_file_name'] = Variable<String>(visitorAvatarFileName);
    }
    if (!nullToAbsent || inviteCode != null) {
      map['invite_code'] = Variable<String>(inviteCode);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<double>(id);
    }
    return map;
  }

  VisitorInvitationEntityCompanion toCompanion(bool nullToAbsent) {
    return VisitorInvitationEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      idInvitation: idInvitation == null && nullToAbsent
          ? const Value.absent()
          : Value(idInvitation),
      visitorName: visitorName == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorName),
      visitorEmail: visitorEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorEmail),
      visitorPhoneNumber: visitorPhoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorPhoneNumber),
      visitorCompany: visitorCompany == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorCompany),
      visitorAvatarFileName: visitorAvatarFileName == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorAvatarFileName),
      inviteCode: inviteCode == null && nullToAbsent
          ? const Value.absent()
          : Value(inviteCode),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
    );
  }

  factory VisitorInvitationEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return VisitorInvitationEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      idInvitation: serializer.fromJson<double>(json['idInvitation']),
      visitorName: serializer.fromJson<String>(json['visitorName']),
      visitorEmail: serializer.fromJson<String>(json['visitorEmail']),
      visitorPhoneNumber:
          serializer.fromJson<String>(json['visitorPhoneNumber']),
      visitorCompany: serializer.fromJson<String>(json['visitorCompany']),
      visitorAvatarFileName:
          serializer.fromJson<String>(json['visitorAvatarFileName']),
      inviteCode: serializer.fromJson<String>(json['inviteCode']),
      id: serializer.fromJson<double>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'idInvitation': serializer.toJson<double>(idInvitation),
      'visitorName': serializer.toJson<String>(visitorName),
      'visitorEmail': serializer.toJson<String>(visitorEmail),
      'visitorPhoneNumber': serializer.toJson<String>(visitorPhoneNumber),
      'visitorCompany': serializer.toJson<String>(visitorCompany),
      'visitorAvatarFileName': serializer.toJson<String>(visitorAvatarFileName),
      'inviteCode': serializer.toJson<String>(inviteCode),
      'id': serializer.toJson<double>(id),
    };
  }

  VisitorInvitationEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          double idInvitation,
          String visitorName,
          String visitorEmail,
          String visitorPhoneNumber,
          String visitorCompany,
          String visitorAvatarFileName,
          String inviteCode,
          double id}) =>
      VisitorInvitationEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        idInvitation: idInvitation ?? this.idInvitation,
        visitorName: visitorName ?? this.visitorName,
        visitorEmail: visitorEmail ?? this.visitorEmail,
        visitorPhoneNumber: visitorPhoneNumber ?? this.visitorPhoneNumber,
        visitorCompany: visitorCompany ?? this.visitorCompany,
        visitorAvatarFileName:
            visitorAvatarFileName ?? this.visitorAvatarFileName,
        inviteCode: inviteCode ?? this.inviteCode,
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('VisitorInvitationEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('idInvitation: $idInvitation, ')
          ..write('visitorName: $visitorName, ')
          ..write('visitorEmail: $visitorEmail, ')
          ..write('visitorPhoneNumber: $visitorPhoneNumber, ')
          ..write('visitorCompany: $visitorCompany, ')
          ..write('visitorAvatarFileName: $visitorAvatarFileName, ')
          ..write('inviteCode: $inviteCode, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              idInvitation.hashCode,
                              $mrjc(
                                  visitorName.hashCode,
                                  $mrjc(
                                      visitorEmail.hashCode,
                                      $mrjc(
                                          visitorPhoneNumber.hashCode,
                                          $mrjc(
                                              visitorCompany.hashCode,
                                              $mrjc(
                                                  visitorAvatarFileName
                                                      .hashCode,
                                                  $mrjc(inviteCode.hashCode,
                                                      id.hashCode))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is VisitorInvitationEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.idInvitation == this.idInvitation &&
          other.visitorName == this.visitorName &&
          other.visitorEmail == this.visitorEmail &&
          other.visitorPhoneNumber == this.visitorPhoneNumber &&
          other.visitorCompany == this.visitorCompany &&
          other.visitorAvatarFileName == this.visitorAvatarFileName &&
          other.inviteCode == this.inviteCode &&
          other.id == this.id);
}

class VisitorInvitationEntityCompanion
    extends UpdateCompanion<VisitorInvitationEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<double> idInvitation;
  final Value<String> visitorName;
  final Value<String> visitorEmail;
  final Value<String> visitorPhoneNumber;
  final Value<String> visitorCompany;
  final Value<String> visitorAvatarFileName;
  final Value<String> inviteCode;
  final Value<double> id;
  const VisitorInvitationEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.idInvitation = const Value.absent(),
    this.visitorName = const Value.absent(),
    this.visitorEmail = const Value.absent(),
    this.visitorPhoneNumber = const Value.absent(),
    this.visitorCompany = const Value.absent(),
    this.visitorAvatarFileName = const Value.absent(),
    this.inviteCode = const Value.absent(),
    this.id = const Value.absent(),
  });
  VisitorInvitationEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    @required double idInvitation,
    this.visitorName = const Value.absent(),
    this.visitorEmail = const Value.absent(),
    this.visitorPhoneNumber = const Value.absent(),
    this.visitorCompany = const Value.absent(),
    this.visitorAvatarFileName = const Value.absent(),
    this.inviteCode = const Value.absent(),
    this.id = const Value.absent(),
  }) : idInvitation = Value(idInvitation);
  static Insertable<VisitorInvitationEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<double> idInvitation,
    Expression<String> visitorName,
    Expression<String> visitorEmail,
    Expression<String> visitorPhoneNumber,
    Expression<String> visitorCompany,
    Expression<String> visitorAvatarFileName,
    Expression<String> inviteCode,
    Expression<double> id,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (idInvitation != null) 'id_invitation': idInvitation,
      if (visitorName != null) 'visitor_name': visitorName,
      if (visitorEmail != null) 'visitor_email': visitorEmail,
      if (visitorPhoneNumber != null)
        'visitor_phone_number': visitorPhoneNumber,
      if (visitorCompany != null) 'visitor_company': visitorCompany,
      if (visitorAvatarFileName != null)
        'visitor_avatar_file_name': visitorAvatarFileName,
      if (inviteCode != null) 'invite_code': inviteCode,
      if (id != null) 'id': id,
    });
  }

  VisitorInvitationEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<double> idInvitation,
      Value<String> visitorName,
      Value<String> visitorEmail,
      Value<String> visitorPhoneNumber,
      Value<String> visitorCompany,
      Value<String> visitorAvatarFileName,
      Value<String> inviteCode,
      Value<double> id}) {
    return VisitorInvitationEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      idInvitation: idInvitation ?? this.idInvitation,
      visitorName: visitorName ?? this.visitorName,
      visitorEmail: visitorEmail ?? this.visitorEmail,
      visitorPhoneNumber: visitorPhoneNumber ?? this.visitorPhoneNumber,
      visitorCompany: visitorCompany ?? this.visitorCompany,
      visitorAvatarFileName:
          visitorAvatarFileName ?? this.visitorAvatarFileName,
      inviteCode: inviteCode ?? this.inviteCode,
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (idInvitation.present) {
      map['id_invitation'] = Variable<double>(idInvitation.value);
    }
    if (visitorName.present) {
      map['visitor_name'] = Variable<String>(visitorName.value);
    }
    if (visitorEmail.present) {
      map['visitor_email'] = Variable<String>(visitorEmail.value);
    }
    if (visitorPhoneNumber.present) {
      map['visitor_phone_number'] = Variable<String>(visitorPhoneNumber.value);
    }
    if (visitorCompany.present) {
      map['visitor_company'] = Variable<String>(visitorCompany.value);
    }
    if (visitorAvatarFileName.present) {
      map['visitor_avatar_file_name'] =
          Variable<String>(visitorAvatarFileName.value);
    }
    if (inviteCode.present) {
      map['invite_code'] = Variable<String>(inviteCode.value);
    }
    if (id.present) {
      map['id'] = Variable<double>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VisitorInvitationEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('idInvitation: $idInvitation, ')
          ..write('visitorName: $visitorName, ')
          ..write('visitorEmail: $visitorEmail, ')
          ..write('visitorPhoneNumber: $visitorPhoneNumber, ')
          ..write('visitorCompany: $visitorCompany, ')
          ..write('visitorAvatarFileName: $visitorAvatarFileName, ')
          ..write('inviteCode: $inviteCode, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $VisitorInvitationEntityTable extends VisitorInvitationEntity
    with TableInfo<$VisitorInvitationEntityTable, VisitorInvitationEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $VisitorInvitationEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idInvitationMeta =
      const VerificationMeta('idInvitation');
  GeneratedRealColumn _idInvitation;
  @override
  GeneratedRealColumn get idInvitation =>
      _idInvitation ??= _constructIdInvitation();
  GeneratedRealColumn _constructIdInvitation() {
    return GeneratedRealColumn(
      'id_invitation',
      $tableName,
      false,
    );
  }

  final VerificationMeta _visitorNameMeta =
      const VerificationMeta('visitorName');
  GeneratedTextColumn _visitorName;
  @override
  GeneratedTextColumn get visitorName =>
      _visitorName ??= _constructVisitorName();
  GeneratedTextColumn _constructVisitorName() {
    return GeneratedTextColumn(
      'visitor_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorEmailMeta =
      const VerificationMeta('visitorEmail');
  GeneratedTextColumn _visitorEmail;
  @override
  GeneratedTextColumn get visitorEmail =>
      _visitorEmail ??= _constructVisitorEmail();
  GeneratedTextColumn _constructVisitorEmail() {
    return GeneratedTextColumn(
      'visitor_email',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorPhoneNumberMeta =
      const VerificationMeta('visitorPhoneNumber');
  GeneratedTextColumn _visitorPhoneNumber;
  @override
  GeneratedTextColumn get visitorPhoneNumber =>
      _visitorPhoneNumber ??= _constructVisitorPhoneNumber();
  GeneratedTextColumn _constructVisitorPhoneNumber() {
    return GeneratedTextColumn(
      'visitor_phone_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorCompanyMeta =
      const VerificationMeta('visitorCompany');
  GeneratedTextColumn _visitorCompany;
  @override
  GeneratedTextColumn get visitorCompany =>
      _visitorCompany ??= _constructVisitorCompany();
  GeneratedTextColumn _constructVisitorCompany() {
    return GeneratedTextColumn(
      'visitor_company',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorAvatarFileNameMeta =
      const VerificationMeta('visitorAvatarFileName');
  GeneratedTextColumn _visitorAvatarFileName;
  @override
  GeneratedTextColumn get visitorAvatarFileName =>
      _visitorAvatarFileName ??= _constructVisitorAvatarFileName();
  GeneratedTextColumn _constructVisitorAvatarFileName() {
    return GeneratedTextColumn(
      'visitor_avatar_file_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _inviteCodeMeta = const VerificationMeta('inviteCode');
  GeneratedTextColumn _inviteCode;
  @override
  GeneratedTextColumn get inviteCode => _inviteCode ??= _constructInviteCode();
  GeneratedTextColumn _constructInviteCode() {
    return GeneratedTextColumn(
      'invite_code',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedRealColumn _id;
  @override
  GeneratedRealColumn get id => _id ??= _constructId();
  GeneratedRealColumn _constructId() {
    return GeneratedRealColumn(
      'id',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        idInvitation,
        visitorName,
        visitorEmail,
        visitorPhoneNumber,
        visitorCompany,
        visitorAvatarFileName,
        inviteCode,
        id
      ];
  @override
  $VisitorInvitationEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_visitor_invitation';
  @override
  final String actualTableName = 'cip_today_visitor_invitation';
  @override
  VerificationContext validateIntegrity(
      Insertable<VisitorInvitationEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id_invitation')) {
      context.handle(
          _idInvitationMeta,
          idInvitation.isAcceptableOrUnknown(
              data['id_invitation'], _idInvitationMeta));
    } else if (isInserting) {
      context.missing(_idInvitationMeta);
    }
    if (data.containsKey('visitor_name')) {
      context.handle(
          _visitorNameMeta,
          visitorName.isAcceptableOrUnknown(
              data['visitor_name'], _visitorNameMeta));
    }
    if (data.containsKey('visitor_email')) {
      context.handle(
          _visitorEmailMeta,
          visitorEmail.isAcceptableOrUnknown(
              data['visitor_email'], _visitorEmailMeta));
    }
    if (data.containsKey('visitor_phone_number')) {
      context.handle(
          _visitorPhoneNumberMeta,
          visitorPhoneNumber.isAcceptableOrUnknown(
              data['visitor_phone_number'], _visitorPhoneNumberMeta));
    }
    if (data.containsKey('visitor_company')) {
      context.handle(
          _visitorCompanyMeta,
          visitorCompany.isAcceptableOrUnknown(
              data['visitor_company'], _visitorCompanyMeta));
    }
    if (data.containsKey('visitor_avatar_file_name')) {
      context.handle(
          _visitorAvatarFileNameMeta,
          visitorAvatarFileName.isAcceptableOrUnknown(
              data['visitor_avatar_file_name'], _visitorAvatarFileNameMeta));
    }
    if (data.containsKey('invite_code')) {
      context.handle(
          _inviteCodeMeta,
          inviteCode.isAcceptableOrUnknown(
              data['invite_code'], _inviteCodeMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey =>
      {visitorName, visitorEmail, idInvitation};
  @override
  VisitorInvitationEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return VisitorInvitationEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $VisitorInvitationEntityTable createAlias(String alias) {
    return $VisitorInvitationEntityTable(_db, alias);
  }
}

class MyInvitationEntry extends DataClass
    implements Insertable<MyInvitationEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final double id;
  final String invitationName;
  final double branchId;
  final String branchName;
  final String branchAddress;
  final String visitorType;
  final String visitorTypeValue;
  final DateTime startDate;
  final DateTime endDate;
  final String color;
  final String description;
  final String status;
  MyInvitationEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      @required this.id,
      this.invitationName,
      this.branchId,
      this.branchName,
      this.branchAddress,
      this.visitorType,
      this.visitorTypeValue,
      this.startDate,
      this.endDate,
      this.color,
      this.description,
      this.status});
  factory MyInvitationEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return MyInvitationEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      id: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      invitationName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}invitation_name']),
      branchId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_id']),
      branchName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_name']),
      branchAddress: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_address']),
      visitorType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_type']),
      visitorTypeValue: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}visitor_type_value']),
      startDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date']),
      endDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}end_date']),
      color:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      status:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<double>(id);
    }
    if (!nullToAbsent || invitationName != null) {
      map['invitation_name'] = Variable<String>(invitationName);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<double>(branchId);
    }
    if (!nullToAbsent || branchName != null) {
      map['branch_name'] = Variable<String>(branchName);
    }
    if (!nullToAbsent || branchAddress != null) {
      map['branch_address'] = Variable<String>(branchAddress);
    }
    if (!nullToAbsent || visitorType != null) {
      map['visitor_type'] = Variable<String>(visitorType);
    }
    if (!nullToAbsent || visitorTypeValue != null) {
      map['visitor_type_value'] = Variable<String>(visitorTypeValue);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    return map;
  }

  MyInvitationEntityCompanion toCompanion(bool nullToAbsent) {
    return MyInvitationEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      invitationName: invitationName == null && nullToAbsent
          ? const Value.absent()
          : Value(invitationName),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      branchName: branchName == null && nullToAbsent
          ? const Value.absent()
          : Value(branchName),
      branchAddress: branchAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(branchAddress),
      visitorType: visitorType == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorType),
      visitorTypeValue: visitorTypeValue == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorTypeValue),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
    );
  }

  factory MyInvitationEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MyInvitationEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      id: serializer.fromJson<double>(json['id']),
      invitationName: serializer.fromJson<String>(json['invitationName']),
      branchId: serializer.fromJson<double>(json['branchId']),
      branchName: serializer.fromJson<String>(json['branchName']),
      branchAddress: serializer.fromJson<String>(json['branchAddress']),
      visitorType: serializer.fromJson<String>(json['visitorType']),
      visitorTypeValue: serializer.fromJson<String>(json['visitorTypeValue']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      color: serializer.fromJson<String>(json['color']),
      description: serializer.fromJson<String>(json['description']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'id': serializer.toJson<double>(id),
      'invitationName': serializer.toJson<String>(invitationName),
      'branchId': serializer.toJson<double>(branchId),
      'branchName': serializer.toJson<String>(branchName),
      'branchAddress': serializer.toJson<String>(branchAddress),
      'visitorType': serializer.toJson<String>(visitorType),
      'visitorTypeValue': serializer.toJson<String>(visitorTypeValue),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'color': serializer.toJson<String>(color),
      'description': serializer.toJson<String>(description),
      'status': serializer.toJson<String>(status),
    };
  }

  MyInvitationEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          double id,
          String invitationName,
          double branchId,
          String branchName,
          String branchAddress,
          String visitorType,
          String visitorTypeValue,
          DateTime startDate,
          DateTime endDate,
          String color,
          String description,
          String status}) =>
      MyInvitationEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        id: id ?? this.id,
        invitationName: invitationName ?? this.invitationName,
        branchId: branchId ?? this.branchId,
        branchName: branchName ?? this.branchName,
        branchAddress: branchAddress ?? this.branchAddress,
        visitorType: visitorType ?? this.visitorType,
        visitorTypeValue: visitorTypeValue ?? this.visitorTypeValue,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        color: color ?? this.color,
        description: description ?? this.description,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('MyInvitationEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('invitationName: $invitationName, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('branchAddress: $branchAddress, ')
          ..write('visitorType: $visitorType, ')
          ..write('visitorTypeValue: $visitorTypeValue, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('color: $color, ')
          ..write('description: $description, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              id.hashCode,
                              $mrjc(
                                  invitationName.hashCode,
                                  $mrjc(
                                      branchId.hashCode,
                                      $mrjc(
                                          branchName.hashCode,
                                          $mrjc(
                                              branchAddress.hashCode,
                                              $mrjc(
                                                  visitorType.hashCode,
                                                  $mrjc(
                                                      visitorTypeValue.hashCode,
                                                      $mrjc(
                                                          startDate.hashCode,
                                                          $mrjc(
                                                              endDate.hashCode,
                                                              $mrjc(
                                                                  color
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      description
                                                                          .hashCode,
                                                                      status
                                                                          .hashCode))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MyInvitationEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.id == this.id &&
          other.invitationName == this.invitationName &&
          other.branchId == this.branchId &&
          other.branchName == this.branchName &&
          other.branchAddress == this.branchAddress &&
          other.visitorType == this.visitorType &&
          other.visitorTypeValue == this.visitorTypeValue &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.color == this.color &&
          other.description == this.description &&
          other.status == this.status);
}

class MyInvitationEntityCompanion extends UpdateCompanion<MyInvitationEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<double> id;
  final Value<String> invitationName;
  final Value<double> branchId;
  final Value<String> branchName;
  final Value<String> branchAddress;
  final Value<String> visitorType;
  final Value<String> visitorTypeValue;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<String> color;
  final Value<String> description;
  final Value<String> status;
  const MyInvitationEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.invitationName = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.branchAddress = const Value.absent(),
    this.visitorType = const Value.absent(),
    this.visitorTypeValue = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.color = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
  });
  MyInvitationEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    @required double id,
    this.invitationName = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.branchAddress = const Value.absent(),
    this.visitorType = const Value.absent(),
    this.visitorTypeValue = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.color = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
  }) : id = Value(id);
  static Insertable<MyInvitationEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<double> id,
    Expression<String> invitationName,
    Expression<double> branchId,
    Expression<String> branchName,
    Expression<String> branchAddress,
    Expression<String> visitorType,
    Expression<String> visitorTypeValue,
    Expression<DateTime> startDate,
    Expression<DateTime> endDate,
    Expression<String> color,
    Expression<String> description,
    Expression<String> status,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (id != null) 'id': id,
      if (invitationName != null) 'invitation_name': invitationName,
      if (branchId != null) 'branch_id': branchId,
      if (branchName != null) 'branch_name': branchName,
      if (branchAddress != null) 'branch_address': branchAddress,
      if (visitorType != null) 'visitor_type': visitorType,
      if (visitorTypeValue != null) 'visitor_type_value': visitorTypeValue,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (color != null) 'color': color,
      if (description != null) 'description': description,
      if (status != null) 'status': status,
    });
  }

  MyInvitationEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<double> id,
      Value<String> invitationName,
      Value<double> branchId,
      Value<String> branchName,
      Value<String> branchAddress,
      Value<String> visitorType,
      Value<String> visitorTypeValue,
      Value<DateTime> startDate,
      Value<DateTime> endDate,
      Value<String> color,
      Value<String> description,
      Value<String> status}) {
    return MyInvitationEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      id: id ?? this.id,
      invitationName: invitationName ?? this.invitationName,
      branchId: branchId ?? this.branchId,
      branchName: branchName ?? this.branchName,
      branchAddress: branchAddress ?? this.branchAddress,
      visitorType: visitorType ?? this.visitorType,
      visitorTypeValue: visitorTypeValue ?? this.visitorTypeValue,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      color: color ?? this.color,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (id.present) {
      map['id'] = Variable<double>(id.value);
    }
    if (invitationName.present) {
      map['invitation_name'] = Variable<String>(invitationName.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<double>(branchId.value);
    }
    if (branchName.present) {
      map['branch_name'] = Variable<String>(branchName.value);
    }
    if (branchAddress.present) {
      map['branch_address'] = Variable<String>(branchAddress.value);
    }
    if (visitorType.present) {
      map['visitor_type'] = Variable<String>(visitorType.value);
    }
    if (visitorTypeValue.present) {
      map['visitor_type_value'] = Variable<String>(visitorTypeValue.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyInvitationEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('invitationName: $invitationName, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('branchAddress: $branchAddress, ')
          ..write('visitorType: $visitorType, ')
          ..write('visitorTypeValue: $visitorTypeValue, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('color: $color, ')
          ..write('description: $description, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $MyInvitationEntityTable extends MyInvitationEntity
    with TableInfo<$MyInvitationEntityTable, MyInvitationEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $MyInvitationEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedRealColumn _id;
  @override
  GeneratedRealColumn get id => _id ??= _constructId();
  GeneratedRealColumn _constructId() {
    return GeneratedRealColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _invitationNameMeta =
      const VerificationMeta('invitationName');
  GeneratedTextColumn _invitationName;
  @override
  GeneratedTextColumn get invitationName =>
      _invitationName ??= _constructInvitationName();
  GeneratedTextColumn _constructInvitationName() {
    return GeneratedTextColumn(
      'invitation_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _branchIdMeta = const VerificationMeta('branchId');
  GeneratedRealColumn _branchId;
  @override
  GeneratedRealColumn get branchId => _branchId ??= _constructBranchId();
  GeneratedRealColumn _constructBranchId() {
    return GeneratedRealColumn(
      'branch_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _branchNameMeta = const VerificationMeta('branchName');
  GeneratedTextColumn _branchName;
  @override
  GeneratedTextColumn get branchName => _branchName ??= _constructBranchName();
  GeneratedTextColumn _constructBranchName() {
    return GeneratedTextColumn(
      'branch_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _branchAddressMeta =
      const VerificationMeta('branchAddress');
  GeneratedTextColumn _branchAddress;
  @override
  GeneratedTextColumn get branchAddress =>
      _branchAddress ??= _constructBranchAddress();
  GeneratedTextColumn _constructBranchAddress() {
    return GeneratedTextColumn(
      'branch_address',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorTypeMeta =
      const VerificationMeta('visitorType');
  GeneratedTextColumn _visitorType;
  @override
  GeneratedTextColumn get visitorType =>
      _visitorType ??= _constructVisitorType();
  GeneratedTextColumn _constructVisitorType() {
    return GeneratedTextColumn(
      'visitor_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorTypeValueMeta =
      const VerificationMeta('visitorTypeValue');
  GeneratedTextColumn _visitorTypeValue;
  @override
  GeneratedTextColumn get visitorTypeValue =>
      _visitorTypeValue ??= _constructVisitorTypeValue();
  GeneratedTextColumn _constructVisitorTypeValue() {
    return GeneratedTextColumn(
      'visitor_type_value',
      $tableName,
      true,
    );
  }

  final VerificationMeta _startDateMeta = const VerificationMeta('startDate');
  GeneratedDateTimeColumn _startDate;
  @override
  GeneratedDateTimeColumn get startDate => _startDate ??= _constructStartDate();
  GeneratedDateTimeColumn _constructStartDate() {
    return GeneratedDateTimeColumn(
      'start_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _endDateMeta = const VerificationMeta('endDate');
  GeneratedDateTimeColumn _endDate;
  @override
  GeneratedDateTimeColumn get endDate => _endDate ??= _constructEndDate();
  GeneratedDateTimeColumn _constructEndDate() {
    return GeneratedDateTimeColumn(
      'end_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedTextColumn _color;
  @override
  GeneratedTextColumn get color => _color ??= _constructColor();
  GeneratedTextColumn _constructColor() {
    return GeneratedTextColumn(
      'color',
      $tableName,
      true,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedTextColumn _status;
  @override
  GeneratedTextColumn get status => _status ??= _constructStatus();
  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn(
      'status',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        id,
        invitationName,
        branchId,
        branchName,
        branchAddress,
        visitorType,
        visitorTypeValue,
        startDate,
        endDate,
        color,
        description,
        status
      ];
  @override
  $MyInvitationEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_my_invitation';
  @override
  final String actualTableName = 'cip_today_my_invitation';
  @override
  VerificationContext validateIntegrity(Insertable<MyInvitationEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('invitation_name')) {
      context.handle(
          _invitationNameMeta,
          invitationName.isAcceptableOrUnknown(
              data['invitation_name'], _invitationNameMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id'], _branchIdMeta));
    }
    if (data.containsKey('branch_name')) {
      context.handle(
          _branchNameMeta,
          branchName.isAcceptableOrUnknown(
              data['branch_name'], _branchNameMeta));
    }
    if (data.containsKey('branch_address')) {
      context.handle(
          _branchAddressMeta,
          branchAddress.isAcceptableOrUnknown(
              data['branch_address'], _branchAddressMeta));
    }
    if (data.containsKey('visitor_type')) {
      context.handle(
          _visitorTypeMeta,
          visitorType.isAcceptableOrUnknown(
              data['visitor_type'], _visitorTypeMeta));
    }
    if (data.containsKey('visitor_type_value')) {
      context.handle(
          _visitorTypeValueMeta,
          visitorTypeValue.isAcceptableOrUnknown(
              data['visitor_type_value'], _visitorTypeValueMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date'], _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date'], _endDateMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color'], _colorMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyInvitationEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MyInvitationEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MyInvitationEntityTable createAlias(String alias) {
    return $MyInvitationEntityTable(_db, alias);
  }
}

class VisitorInviteCheckinSyncEntry extends DataClass
    implements Insertable<VisitorInviteCheckinSyncEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final int id;
  final DateTime signIn;
  final DateTime signOut;
  final String inviteCode;
  final String visitorName;
  final String visitorType;
  final String visitorEmail;
  final String visitorPhoneNumber;
  final double branchId;
  final double contactPersonId;
  final String timezone;
  final double invitationId;
  final bool isSync;
  final String statusSync;
  VisitorInviteCheckinSyncEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      @required this.id,
      this.signIn,
      this.signOut,
      @required this.inviteCode,
      this.visitorName,
      this.visitorType,
      this.visitorEmail,
      this.visitorPhoneNumber,
      this.branchId,
      this.contactPersonId,
      this.timezone,
      this.invitationId,
      @required this.isSync,
      this.statusSync});
  factory VisitorInviteCheckinSyncEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final boolType = db.typeSystem.forDartType<bool>();
    return VisitorInviteCheckinSyncEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      signIn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sign_in']),
      signOut: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sign_out']),
      inviteCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}invite_code']),
      visitorName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_name']),
      visitorType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_type']),
      visitorEmail: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visitor_email']),
      visitorPhoneNumber: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}visitor_phone_number']),
      branchId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_id']),
      contactPersonId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}contact_person_id']),
      timezone: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}timezone']),
      invitationId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}invitation_id']),
      isSync:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_sync']),
      statusSync: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}status_sync']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || signIn != null) {
      map['sign_in'] = Variable<DateTime>(signIn);
    }
    if (!nullToAbsent || signOut != null) {
      map['sign_out'] = Variable<DateTime>(signOut);
    }
    if (!nullToAbsent || inviteCode != null) {
      map['invite_code'] = Variable<String>(inviteCode);
    }
    if (!nullToAbsent || visitorName != null) {
      map['visitor_name'] = Variable<String>(visitorName);
    }
    if (!nullToAbsent || visitorType != null) {
      map['visitor_type'] = Variable<String>(visitorType);
    }
    if (!nullToAbsent || visitorEmail != null) {
      map['visitor_email'] = Variable<String>(visitorEmail);
    }
    if (!nullToAbsent || visitorPhoneNumber != null) {
      map['visitor_phone_number'] = Variable<String>(visitorPhoneNumber);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<double>(branchId);
    }
    if (!nullToAbsent || contactPersonId != null) {
      map['contact_person_id'] = Variable<double>(contactPersonId);
    }
    if (!nullToAbsent || timezone != null) {
      map['timezone'] = Variable<String>(timezone);
    }
    if (!nullToAbsent || invitationId != null) {
      map['invitation_id'] = Variable<double>(invitationId);
    }
    if (!nullToAbsent || isSync != null) {
      map['is_sync'] = Variable<bool>(isSync);
    }
    if (!nullToAbsent || statusSync != null) {
      map['status_sync'] = Variable<String>(statusSync);
    }
    return map;
  }

  VisitorInviteCheckinSyncEntityCompanion toCompanion(bool nullToAbsent) {
    return VisitorInviteCheckinSyncEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      signIn:
          signIn == null && nullToAbsent ? const Value.absent() : Value(signIn),
      signOut: signOut == null && nullToAbsent
          ? const Value.absent()
          : Value(signOut),
      inviteCode: inviteCode == null && nullToAbsent
          ? const Value.absent()
          : Value(inviteCode),
      visitorName: visitorName == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorName),
      visitorType: visitorType == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorType),
      visitorEmail: visitorEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorEmail),
      visitorPhoneNumber: visitorPhoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(visitorPhoneNumber),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      contactPersonId: contactPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(contactPersonId),
      timezone: timezone == null && nullToAbsent
          ? const Value.absent()
          : Value(timezone),
      invitationId: invitationId == null && nullToAbsent
          ? const Value.absent()
          : Value(invitationId),
      isSync:
          isSync == null && nullToAbsent ? const Value.absent() : Value(isSync),
      statusSync: statusSync == null && nullToAbsent
          ? const Value.absent()
          : Value(statusSync),
    );
  }

  factory VisitorInviteCheckinSyncEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return VisitorInviteCheckinSyncEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      id: serializer.fromJson<int>(json['id']),
      signIn: serializer.fromJson<DateTime>(json['signIn']),
      signOut: serializer.fromJson<DateTime>(json['signOut']),
      inviteCode: serializer.fromJson<String>(json['inviteCode']),
      visitorName: serializer.fromJson<String>(json['visitorName']),
      visitorType: serializer.fromJson<String>(json['visitorType']),
      visitorEmail: serializer.fromJson<String>(json['visitorEmail']),
      visitorPhoneNumber:
          serializer.fromJson<String>(json['visitorPhoneNumber']),
      branchId: serializer.fromJson<double>(json['branchId']),
      contactPersonId: serializer.fromJson<double>(json['contactPersonId']),
      timezone: serializer.fromJson<String>(json['timezone']),
      invitationId: serializer.fromJson<double>(json['invitationId']),
      isSync: serializer.fromJson<bool>(json['isSync']),
      statusSync: serializer.fromJson<String>(json['statusSync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'id': serializer.toJson<int>(id),
      'signIn': serializer.toJson<DateTime>(signIn),
      'signOut': serializer.toJson<DateTime>(signOut),
      'inviteCode': serializer.toJson<String>(inviteCode),
      'visitorName': serializer.toJson<String>(visitorName),
      'visitorType': serializer.toJson<String>(visitorType),
      'visitorEmail': serializer.toJson<String>(visitorEmail),
      'visitorPhoneNumber': serializer.toJson<String>(visitorPhoneNumber),
      'branchId': serializer.toJson<double>(branchId),
      'contactPersonId': serializer.toJson<double>(contactPersonId),
      'timezone': serializer.toJson<String>(timezone),
      'invitationId': serializer.toJson<double>(invitationId),
      'isSync': serializer.toJson<bool>(isSync),
      'statusSync': serializer.toJson<String>(statusSync),
    };
  }

  VisitorInviteCheckinSyncEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          int id,
          DateTime signIn,
          DateTime signOut,
          String inviteCode,
          String visitorName,
          String visitorType,
          String visitorEmail,
          String visitorPhoneNumber,
          double branchId,
          double contactPersonId,
          String timezone,
          double invitationId,
          bool isSync,
          String statusSync}) =>
      VisitorInviteCheckinSyncEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        id: id ?? this.id,
        signIn: signIn ?? this.signIn,
        signOut: signOut ?? this.signOut,
        inviteCode: inviteCode ?? this.inviteCode,
        visitorName: visitorName ?? this.visitorName,
        visitorType: visitorType ?? this.visitorType,
        visitorEmail: visitorEmail ?? this.visitorEmail,
        visitorPhoneNumber: visitorPhoneNumber ?? this.visitorPhoneNumber,
        branchId: branchId ?? this.branchId,
        contactPersonId: contactPersonId ?? this.contactPersonId,
        timezone: timezone ?? this.timezone,
        invitationId: invitationId ?? this.invitationId,
        isSync: isSync ?? this.isSync,
        statusSync: statusSync ?? this.statusSync,
      );
  @override
  String toString() {
    return (StringBuffer('VisitorInviteCheckinSyncEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('signIn: $signIn, ')
          ..write('signOut: $signOut, ')
          ..write('inviteCode: $inviteCode, ')
          ..write('visitorName: $visitorName, ')
          ..write('visitorType: $visitorType, ')
          ..write('visitorEmail: $visitorEmail, ')
          ..write('visitorPhoneNumber: $visitorPhoneNumber, ')
          ..write('branchId: $branchId, ')
          ..write('contactPersonId: $contactPersonId, ')
          ..write('timezone: $timezone, ')
          ..write('invitationId: $invitationId, ')
          ..write('isSync: $isSync, ')
          ..write('statusSync: $statusSync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              id.hashCode,
                              $mrjc(
                                  signIn.hashCode,
                                  $mrjc(
                                      signOut.hashCode,
                                      $mrjc(
                                          inviteCode.hashCode,
                                          $mrjc(
                                              visitorName.hashCode,
                                              $mrjc(
                                                  visitorType.hashCode,
                                                  $mrjc(
                                                      visitorEmail.hashCode,
                                                      $mrjc(
                                                          visitorPhoneNumber
                                                              .hashCode,
                                                          $mrjc(
                                                              branchId.hashCode,
                                                              $mrjc(
                                                                  contactPersonId
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      timezone
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          invitationId
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              isSync.hashCode,
                                                                              statusSync.hashCode))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is VisitorInviteCheckinSyncEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.id == this.id &&
          other.signIn == this.signIn &&
          other.signOut == this.signOut &&
          other.inviteCode == this.inviteCode &&
          other.visitorName == this.visitorName &&
          other.visitorType == this.visitorType &&
          other.visitorEmail == this.visitorEmail &&
          other.visitorPhoneNumber == this.visitorPhoneNumber &&
          other.branchId == this.branchId &&
          other.contactPersonId == this.contactPersonId &&
          other.timezone == this.timezone &&
          other.invitationId == this.invitationId &&
          other.isSync == this.isSync &&
          other.statusSync == this.statusSync);
}

class VisitorInviteCheckinSyncEntityCompanion
    extends UpdateCompanion<VisitorInviteCheckinSyncEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<int> id;
  final Value<DateTime> signIn;
  final Value<DateTime> signOut;
  final Value<String> inviteCode;
  final Value<String> visitorName;
  final Value<String> visitorType;
  final Value<String> visitorEmail;
  final Value<String> visitorPhoneNumber;
  final Value<double> branchId;
  final Value<double> contactPersonId;
  final Value<String> timezone;
  final Value<double> invitationId;
  final Value<bool> isSync;
  final Value<String> statusSync;
  const VisitorInviteCheckinSyncEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.signIn = const Value.absent(),
    this.signOut = const Value.absent(),
    this.inviteCode = const Value.absent(),
    this.visitorName = const Value.absent(),
    this.visitorType = const Value.absent(),
    this.visitorEmail = const Value.absent(),
    this.visitorPhoneNumber = const Value.absent(),
    this.branchId = const Value.absent(),
    this.contactPersonId = const Value.absent(),
    this.timezone = const Value.absent(),
    this.invitationId = const Value.absent(),
    this.isSync = const Value.absent(),
    this.statusSync = const Value.absent(),
  });
  VisitorInviteCheckinSyncEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.signIn = const Value.absent(),
    this.signOut = const Value.absent(),
    @required String inviteCode,
    this.visitorName = const Value.absent(),
    this.visitorType = const Value.absent(),
    this.visitorEmail = const Value.absent(),
    this.visitorPhoneNumber = const Value.absent(),
    this.branchId = const Value.absent(),
    this.contactPersonId = const Value.absent(),
    this.timezone = const Value.absent(),
    this.invitationId = const Value.absent(),
    this.isSync = const Value.absent(),
    this.statusSync = const Value.absent(),
  }) : inviteCode = Value(inviteCode);
  static Insertable<VisitorInviteCheckinSyncEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<int> id,
    Expression<DateTime> signIn,
    Expression<DateTime> signOut,
    Expression<String> inviteCode,
    Expression<String> visitorName,
    Expression<String> visitorType,
    Expression<String> visitorEmail,
    Expression<String> visitorPhoneNumber,
    Expression<double> branchId,
    Expression<double> contactPersonId,
    Expression<String> timezone,
    Expression<double> invitationId,
    Expression<bool> isSync,
    Expression<String> statusSync,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (id != null) 'id': id,
      if (signIn != null) 'sign_in': signIn,
      if (signOut != null) 'sign_out': signOut,
      if (inviteCode != null) 'invite_code': inviteCode,
      if (visitorName != null) 'visitor_name': visitorName,
      if (visitorType != null) 'visitor_type': visitorType,
      if (visitorEmail != null) 'visitor_email': visitorEmail,
      if (visitorPhoneNumber != null)
        'visitor_phone_number': visitorPhoneNumber,
      if (branchId != null) 'branch_id': branchId,
      if (contactPersonId != null) 'contact_person_id': contactPersonId,
      if (timezone != null) 'timezone': timezone,
      if (invitationId != null) 'invitation_id': invitationId,
      if (isSync != null) 'is_sync': isSync,
      if (statusSync != null) 'status_sync': statusSync,
    });
  }

  VisitorInviteCheckinSyncEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<int> id,
      Value<DateTime> signIn,
      Value<DateTime> signOut,
      Value<String> inviteCode,
      Value<String> visitorName,
      Value<String> visitorType,
      Value<String> visitorEmail,
      Value<String> visitorPhoneNumber,
      Value<double> branchId,
      Value<double> contactPersonId,
      Value<String> timezone,
      Value<double> invitationId,
      Value<bool> isSync,
      Value<String> statusSync}) {
    return VisitorInviteCheckinSyncEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      id: id ?? this.id,
      signIn: signIn ?? this.signIn,
      signOut: signOut ?? this.signOut,
      inviteCode: inviteCode ?? this.inviteCode,
      visitorName: visitorName ?? this.visitorName,
      visitorType: visitorType ?? this.visitorType,
      visitorEmail: visitorEmail ?? this.visitorEmail,
      visitorPhoneNumber: visitorPhoneNumber ?? this.visitorPhoneNumber,
      branchId: branchId ?? this.branchId,
      contactPersonId: contactPersonId ?? this.contactPersonId,
      timezone: timezone ?? this.timezone,
      invitationId: invitationId ?? this.invitationId,
      isSync: isSync ?? this.isSync,
      statusSync: statusSync ?? this.statusSync,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (signIn.present) {
      map['sign_in'] = Variable<DateTime>(signIn.value);
    }
    if (signOut.present) {
      map['sign_out'] = Variable<DateTime>(signOut.value);
    }
    if (inviteCode.present) {
      map['invite_code'] = Variable<String>(inviteCode.value);
    }
    if (visitorName.present) {
      map['visitor_name'] = Variable<String>(visitorName.value);
    }
    if (visitorType.present) {
      map['visitor_type'] = Variable<String>(visitorType.value);
    }
    if (visitorEmail.present) {
      map['visitor_email'] = Variable<String>(visitorEmail.value);
    }
    if (visitorPhoneNumber.present) {
      map['visitor_phone_number'] = Variable<String>(visitorPhoneNumber.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<double>(branchId.value);
    }
    if (contactPersonId.present) {
      map['contact_person_id'] = Variable<double>(contactPersonId.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (invitationId.present) {
      map['invitation_id'] = Variable<double>(invitationId.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    if (statusSync.present) {
      map['status_sync'] = Variable<String>(statusSync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VisitorInviteCheckinSyncEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('signIn: $signIn, ')
          ..write('signOut: $signOut, ')
          ..write('inviteCode: $inviteCode, ')
          ..write('visitorName: $visitorName, ')
          ..write('visitorType: $visitorType, ')
          ..write('visitorEmail: $visitorEmail, ')
          ..write('visitorPhoneNumber: $visitorPhoneNumber, ')
          ..write('branchId: $branchId, ')
          ..write('contactPersonId: $contactPersonId, ')
          ..write('timezone: $timezone, ')
          ..write('invitationId: $invitationId, ')
          ..write('isSync: $isSync, ')
          ..write('statusSync: $statusSync')
          ..write(')'))
        .toString();
  }
}

class $VisitorInviteCheckinSyncEntityTable
    extends VisitorInviteCheckinSyncEntity
    with
        TableInfo<$VisitorInviteCheckinSyncEntityTable,
            VisitorInviteCheckinSyncEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $VisitorInviteCheckinSyncEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _signInMeta = const VerificationMeta('signIn');
  GeneratedDateTimeColumn _signIn;
  @override
  GeneratedDateTimeColumn get signIn => _signIn ??= _constructSignIn();
  GeneratedDateTimeColumn _constructSignIn() {
    return GeneratedDateTimeColumn(
      'sign_in',
      $tableName,
      true,
    );
  }

  final VerificationMeta _signOutMeta = const VerificationMeta('signOut');
  GeneratedDateTimeColumn _signOut;
  @override
  GeneratedDateTimeColumn get signOut => _signOut ??= _constructSignOut();
  GeneratedDateTimeColumn _constructSignOut() {
    return GeneratedDateTimeColumn(
      'sign_out',
      $tableName,
      true,
    );
  }

  final VerificationMeta _inviteCodeMeta = const VerificationMeta('inviteCode');
  GeneratedTextColumn _inviteCode;
  @override
  GeneratedTextColumn get inviteCode => _inviteCode ??= _constructInviteCode();
  GeneratedTextColumn _constructInviteCode() {
    return GeneratedTextColumn(
      'invite_code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _visitorNameMeta =
      const VerificationMeta('visitorName');
  GeneratedTextColumn _visitorName;
  @override
  GeneratedTextColumn get visitorName =>
      _visitorName ??= _constructVisitorName();
  GeneratedTextColumn _constructVisitorName() {
    return GeneratedTextColumn(
      'visitor_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorTypeMeta =
      const VerificationMeta('visitorType');
  GeneratedTextColumn _visitorType;
  @override
  GeneratedTextColumn get visitorType =>
      _visitorType ??= _constructVisitorType();
  GeneratedTextColumn _constructVisitorType() {
    return GeneratedTextColumn(
      'visitor_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorEmailMeta =
      const VerificationMeta('visitorEmail');
  GeneratedTextColumn _visitorEmail;
  @override
  GeneratedTextColumn get visitorEmail =>
      _visitorEmail ??= _constructVisitorEmail();
  GeneratedTextColumn _constructVisitorEmail() {
    return GeneratedTextColumn(
      'visitor_email',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visitorPhoneNumberMeta =
      const VerificationMeta('visitorPhoneNumber');
  GeneratedTextColumn _visitorPhoneNumber;
  @override
  GeneratedTextColumn get visitorPhoneNumber =>
      _visitorPhoneNumber ??= _constructVisitorPhoneNumber();
  GeneratedTextColumn _constructVisitorPhoneNumber() {
    return GeneratedTextColumn(
      'visitor_phone_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _branchIdMeta = const VerificationMeta('branchId');
  GeneratedRealColumn _branchId;
  @override
  GeneratedRealColumn get branchId => _branchId ??= _constructBranchId();
  GeneratedRealColumn _constructBranchId() {
    return GeneratedRealColumn(
      'branch_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _contactPersonIdMeta =
      const VerificationMeta('contactPersonId');
  GeneratedRealColumn _contactPersonId;
  @override
  GeneratedRealColumn get contactPersonId =>
      _contactPersonId ??= _constructContactPersonId();
  GeneratedRealColumn _constructContactPersonId() {
    return GeneratedRealColumn(
      'contact_person_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _timezoneMeta = const VerificationMeta('timezone');
  GeneratedTextColumn _timezone;
  @override
  GeneratedTextColumn get timezone => _timezone ??= _constructTimezone();
  GeneratedTextColumn _constructTimezone() {
    return GeneratedTextColumn(
      'timezone',
      $tableName,
      true,
    );
  }

  final VerificationMeta _invitationIdMeta =
      const VerificationMeta('invitationId');
  GeneratedRealColumn _invitationId;
  @override
  GeneratedRealColumn get invitationId =>
      _invitationId ??= _constructInvitationId();
  GeneratedRealColumn _constructInvitationId() {
    return GeneratedRealColumn(
      'invitation_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  GeneratedBoolColumn _isSync;
  @override
  GeneratedBoolColumn get isSync => _isSync ??= _constructIsSync();
  GeneratedBoolColumn _constructIsSync() {
    return GeneratedBoolColumn('is_sync', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _statusSyncMeta = const VerificationMeta('statusSync');
  GeneratedTextColumn _statusSync;
  @override
  GeneratedTextColumn get statusSync => _statusSync ??= _constructStatusSync();
  GeneratedTextColumn _constructStatusSync() {
    return GeneratedTextColumn(
      'status_sync',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        id,
        signIn,
        signOut,
        inviteCode,
        visitorName,
        visitorType,
        visitorEmail,
        visitorPhoneNumber,
        branchId,
        contactPersonId,
        timezone,
        invitationId,
        isSync,
        statusSync
      ];
  @override
  $VisitorInviteCheckinSyncEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_visitor_invite_checkin_sync';
  @override
  final String actualTableName = 'cip_today_visitor_invite_checkin_sync';
  @override
  VerificationContext validateIntegrity(
      Insertable<VisitorInviteCheckinSyncEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('sign_in')) {
      context.handle(_signInMeta,
          signIn.isAcceptableOrUnknown(data['sign_in'], _signInMeta));
    }
    if (data.containsKey('sign_out')) {
      context.handle(_signOutMeta,
          signOut.isAcceptableOrUnknown(data['sign_out'], _signOutMeta));
    }
    if (data.containsKey('invite_code')) {
      context.handle(
          _inviteCodeMeta,
          inviteCode.isAcceptableOrUnknown(
              data['invite_code'], _inviteCodeMeta));
    } else if (isInserting) {
      context.missing(_inviteCodeMeta);
    }
    if (data.containsKey('visitor_name')) {
      context.handle(
          _visitorNameMeta,
          visitorName.isAcceptableOrUnknown(
              data['visitor_name'], _visitorNameMeta));
    }
    if (data.containsKey('visitor_type')) {
      context.handle(
          _visitorTypeMeta,
          visitorType.isAcceptableOrUnknown(
              data['visitor_type'], _visitorTypeMeta));
    }
    if (data.containsKey('visitor_email')) {
      context.handle(
          _visitorEmailMeta,
          visitorEmail.isAcceptableOrUnknown(
              data['visitor_email'], _visitorEmailMeta));
    }
    if (data.containsKey('visitor_phone_number')) {
      context.handle(
          _visitorPhoneNumberMeta,
          visitorPhoneNumber.isAcceptableOrUnknown(
              data['visitor_phone_number'], _visitorPhoneNumberMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id'], _branchIdMeta));
    }
    if (data.containsKey('contact_person_id')) {
      context.handle(
          _contactPersonIdMeta,
          contactPersonId.isAcceptableOrUnknown(
              data['contact_person_id'], _contactPersonIdMeta));
    }
    if (data.containsKey('timezone')) {
      context.handle(_timezoneMeta,
          timezone.isAcceptableOrUnknown(data['timezone'], _timezoneMeta));
    }
    if (data.containsKey('invitation_id')) {
      context.handle(
          _invitationIdMeta,
          invitationId.isAcceptableOrUnknown(
              data['invitation_id'], _invitationIdMeta));
    }
    if (data.containsKey('is_sync')) {
      context.handle(_isSyncMeta,
          isSync.isAcceptableOrUnknown(data['is_sync'], _isSyncMeta));
    }
    if (data.containsKey('status_sync')) {
      context.handle(
          _statusSyncMeta,
          statusSync.isAcceptableOrUnknown(
              data['status_sync'], _statusSyncMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VisitorInviteCheckinSyncEntry map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return VisitorInviteCheckinSyncEntry.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  $VisitorInviteCheckinSyncEntityTable createAlias(String alias) {
    return $VisitorInviteCheckinSyncEntityTable(_db, alias);
  }
}

class AttendanceDetailEntry extends DataClass
    implements Insertable<AttendanceDetailEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final int id;
  final String dayOfMonth;
  final DateTime checkin;
  final DateTime checkout;
  final bool isLate;
  final bool isEnoughWorkingTime;
  final double totalWorkingTime;
  final String note;
  final String location;
  final String dataJson;
  final String dayOfMonthCompare;
  AttendanceDetailEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      @required this.id,
      this.dayOfMonth,
      this.checkin,
      this.checkout,
      this.isLate,
      this.isEnoughWorkingTime,
      this.totalWorkingTime,
      this.note,
      this.location,
      this.dataJson,
      this.dayOfMonthCompare});
  factory AttendanceDetailEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    final doubleType = db.typeSystem.forDartType<double>();
    return AttendanceDetailEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      dayOfMonth: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}day_of_month']),
      checkin: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}checkin']),
      checkout: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}checkout']),
      isLate:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_late']),
      isEnoughWorkingTime: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}is_enough_working_time']),
      totalWorkingTime: doubleType.mapFromDatabaseResponse(
          data['${effectivePrefix}total_working_time']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
      location: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
      dataJson: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}data_json']),
      dayOfMonthCompare: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}day_of_month_compare']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || dayOfMonth != null) {
      map['day_of_month'] = Variable<String>(dayOfMonth);
    }
    if (!nullToAbsent || checkin != null) {
      map['checkin'] = Variable<DateTime>(checkin);
    }
    if (!nullToAbsent || checkout != null) {
      map['checkout'] = Variable<DateTime>(checkout);
    }
    if (!nullToAbsent || isLate != null) {
      map['is_late'] = Variable<bool>(isLate);
    }
    if (!nullToAbsent || isEnoughWorkingTime != null) {
      map['is_enough_working_time'] = Variable<bool>(isEnoughWorkingTime);
    }
    if (!nullToAbsent || totalWorkingTime != null) {
      map['total_working_time'] = Variable<double>(totalWorkingTime);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || dataJson != null) {
      map['data_json'] = Variable<String>(dataJson);
    }
    if (!nullToAbsent || dayOfMonthCompare != null) {
      map['day_of_month_compare'] = Variable<String>(dayOfMonthCompare);
    }
    return map;
  }

  AttendanceDetailEntityCompanion toCompanion(bool nullToAbsent) {
    return AttendanceDetailEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      dayOfMonth: dayOfMonth == null && nullToAbsent
          ? const Value.absent()
          : Value(dayOfMonth),
      checkin: checkin == null && nullToAbsent
          ? const Value.absent()
          : Value(checkin),
      checkout: checkout == null && nullToAbsent
          ? const Value.absent()
          : Value(checkout),
      isLate:
          isLate == null && nullToAbsent ? const Value.absent() : Value(isLate),
      isEnoughWorkingTime: isEnoughWorkingTime == null && nullToAbsent
          ? const Value.absent()
          : Value(isEnoughWorkingTime),
      totalWorkingTime: totalWorkingTime == null && nullToAbsent
          ? const Value.absent()
          : Value(totalWorkingTime),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      dataJson: dataJson == null && nullToAbsent
          ? const Value.absent()
          : Value(dataJson),
      dayOfMonthCompare: dayOfMonthCompare == null && nullToAbsent
          ? const Value.absent()
          : Value(dayOfMonthCompare),
    );
  }

  factory AttendanceDetailEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AttendanceDetailEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      id: serializer.fromJson<int>(json['id']),
      dayOfMonth: serializer.fromJson<String>(json['dayOfMonth']),
      checkin: serializer.fromJson<DateTime>(json['checkin']),
      checkout: serializer.fromJson<DateTime>(json['checkout']),
      isLate: serializer.fromJson<bool>(json['isLate']),
      isEnoughWorkingTime:
          serializer.fromJson<bool>(json['isEnoughWorkingTime']),
      totalWorkingTime: serializer.fromJson<double>(json['totalWorkingTime']),
      note: serializer.fromJson<String>(json['note']),
      location: serializer.fromJson<String>(json['location']),
      dataJson: serializer.fromJson<String>(json['dataJson']),
      dayOfMonthCompare: serializer.fromJson<String>(json['dayOfMonthCompare']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'id': serializer.toJson<int>(id),
      'dayOfMonth': serializer.toJson<String>(dayOfMonth),
      'checkin': serializer.toJson<DateTime>(checkin),
      'checkout': serializer.toJson<DateTime>(checkout),
      'isLate': serializer.toJson<bool>(isLate),
      'isEnoughWorkingTime': serializer.toJson<bool>(isEnoughWorkingTime),
      'totalWorkingTime': serializer.toJson<double>(totalWorkingTime),
      'note': serializer.toJson<String>(note),
      'location': serializer.toJson<String>(location),
      'dataJson': serializer.toJson<String>(dataJson),
      'dayOfMonthCompare': serializer.toJson<String>(dayOfMonthCompare),
    };
  }

  AttendanceDetailEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          int id,
          String dayOfMonth,
          DateTime checkin,
          DateTime checkout,
          bool isLate,
          bool isEnoughWorkingTime,
          double totalWorkingTime,
          String note,
          String location,
          String dataJson,
          String dayOfMonthCompare}) =>
      AttendanceDetailEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        id: id ?? this.id,
        dayOfMonth: dayOfMonth ?? this.dayOfMonth,
        checkin: checkin ?? this.checkin,
        checkout: checkout ?? this.checkout,
        isLate: isLate ?? this.isLate,
        isEnoughWorkingTime: isEnoughWorkingTime ?? this.isEnoughWorkingTime,
        totalWorkingTime: totalWorkingTime ?? this.totalWorkingTime,
        note: note ?? this.note,
        location: location ?? this.location,
        dataJson: dataJson ?? this.dataJson,
        dayOfMonthCompare: dayOfMonthCompare ?? this.dayOfMonthCompare,
      );
  @override
  String toString() {
    return (StringBuffer('AttendanceDetailEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('dayOfMonth: $dayOfMonth, ')
          ..write('checkin: $checkin, ')
          ..write('checkout: $checkout, ')
          ..write('isLate: $isLate, ')
          ..write('isEnoughWorkingTime: $isEnoughWorkingTime, ')
          ..write('totalWorkingTime: $totalWorkingTime, ')
          ..write('note: $note, ')
          ..write('location: $location, ')
          ..write('dataJson: $dataJson, ')
          ..write('dayOfMonthCompare: $dayOfMonthCompare')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              id.hashCode,
                              $mrjc(
                                  dayOfMonth.hashCode,
                                  $mrjc(
                                      checkin.hashCode,
                                      $mrjc(
                                          checkout.hashCode,
                                          $mrjc(
                                              isLate.hashCode,
                                              $mrjc(
                                                  isEnoughWorkingTime.hashCode,
                                                  $mrjc(
                                                      totalWorkingTime.hashCode,
                                                      $mrjc(
                                                          note.hashCode,
                                                          $mrjc(
                                                              location.hashCode,
                                                              $mrjc(
                                                                  dataJson
                                                                      .hashCode,
                                                                  dayOfMonthCompare
                                                                      .hashCode)))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is AttendanceDetailEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.id == this.id &&
          other.dayOfMonth == this.dayOfMonth &&
          other.checkin == this.checkin &&
          other.checkout == this.checkout &&
          other.isLate == this.isLate &&
          other.isEnoughWorkingTime == this.isEnoughWorkingTime &&
          other.totalWorkingTime == this.totalWorkingTime &&
          other.note == this.note &&
          other.location == this.location &&
          other.dataJson == this.dataJson &&
          other.dayOfMonthCompare == this.dayOfMonthCompare);
}

class AttendanceDetailEntityCompanion
    extends UpdateCompanion<AttendanceDetailEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<int> id;
  final Value<String> dayOfMonth;
  final Value<DateTime> checkin;
  final Value<DateTime> checkout;
  final Value<bool> isLate;
  final Value<bool> isEnoughWorkingTime;
  final Value<double> totalWorkingTime;
  final Value<String> note;
  final Value<String> location;
  final Value<String> dataJson;
  final Value<String> dayOfMonthCompare;
  const AttendanceDetailEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.dayOfMonth = const Value.absent(),
    this.checkin = const Value.absent(),
    this.checkout = const Value.absent(),
    this.isLate = const Value.absent(),
    this.isEnoughWorkingTime = const Value.absent(),
    this.totalWorkingTime = const Value.absent(),
    this.note = const Value.absent(),
    this.location = const Value.absent(),
    this.dataJson = const Value.absent(),
    this.dayOfMonthCompare = const Value.absent(),
  });
  AttendanceDetailEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.dayOfMonth = const Value.absent(),
    this.checkin = const Value.absent(),
    this.checkout = const Value.absent(),
    this.isLate = const Value.absent(),
    this.isEnoughWorkingTime = const Value.absent(),
    this.totalWorkingTime = const Value.absent(),
    this.note = const Value.absent(),
    this.location = const Value.absent(),
    this.dataJson = const Value.absent(),
    this.dayOfMonthCompare = const Value.absent(),
  });
  static Insertable<AttendanceDetailEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<int> id,
    Expression<String> dayOfMonth,
    Expression<DateTime> checkin,
    Expression<DateTime> checkout,
    Expression<bool> isLate,
    Expression<bool> isEnoughWorkingTime,
    Expression<double> totalWorkingTime,
    Expression<String> note,
    Expression<String> location,
    Expression<String> dataJson,
    Expression<String> dayOfMonthCompare,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (id != null) 'id': id,
      if (dayOfMonth != null) 'day_of_month': dayOfMonth,
      if (checkin != null) 'checkin': checkin,
      if (checkout != null) 'checkout': checkout,
      if (isLate != null) 'is_late': isLate,
      if (isEnoughWorkingTime != null)
        'is_enough_working_time': isEnoughWorkingTime,
      if (totalWorkingTime != null) 'total_working_time': totalWorkingTime,
      if (note != null) 'note': note,
      if (location != null) 'location': location,
      if (dataJson != null) 'data_json': dataJson,
      if (dayOfMonthCompare != null) 'day_of_month_compare': dayOfMonthCompare,
    });
  }

  AttendanceDetailEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<int> id,
      Value<String> dayOfMonth,
      Value<DateTime> checkin,
      Value<DateTime> checkout,
      Value<bool> isLate,
      Value<bool> isEnoughWorkingTime,
      Value<double> totalWorkingTime,
      Value<String> note,
      Value<String> location,
      Value<String> dataJson,
      Value<String> dayOfMonthCompare}) {
    return AttendanceDetailEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      id: id ?? this.id,
      dayOfMonth: dayOfMonth ?? this.dayOfMonth,
      checkin: checkin ?? this.checkin,
      checkout: checkout ?? this.checkout,
      isLate: isLate ?? this.isLate,
      isEnoughWorkingTime: isEnoughWorkingTime ?? this.isEnoughWorkingTime,
      totalWorkingTime: totalWorkingTime ?? this.totalWorkingTime,
      note: note ?? this.note,
      location: location ?? this.location,
      dataJson: dataJson ?? this.dataJson,
      dayOfMonthCompare: dayOfMonthCompare ?? this.dayOfMonthCompare,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dayOfMonth.present) {
      map['day_of_month'] = Variable<String>(dayOfMonth.value);
    }
    if (checkin.present) {
      map['checkin'] = Variable<DateTime>(checkin.value);
    }
    if (checkout.present) {
      map['checkout'] = Variable<DateTime>(checkout.value);
    }
    if (isLate.present) {
      map['is_late'] = Variable<bool>(isLate.value);
    }
    if (isEnoughWorkingTime.present) {
      map['is_enough_working_time'] = Variable<bool>(isEnoughWorkingTime.value);
    }
    if (totalWorkingTime.present) {
      map['total_working_time'] = Variable<double>(totalWorkingTime.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (dataJson.present) {
      map['data_json'] = Variable<String>(dataJson.value);
    }
    if (dayOfMonthCompare.present) {
      map['day_of_month_compare'] = Variable<String>(dayOfMonthCompare.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceDetailEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('dayOfMonth: $dayOfMonth, ')
          ..write('checkin: $checkin, ')
          ..write('checkout: $checkout, ')
          ..write('isLate: $isLate, ')
          ..write('isEnoughWorkingTime: $isEnoughWorkingTime, ')
          ..write('totalWorkingTime: $totalWorkingTime, ')
          ..write('note: $note, ')
          ..write('location: $location, ')
          ..write('dataJson: $dataJson, ')
          ..write('dayOfMonthCompare: $dayOfMonthCompare')
          ..write(')'))
        .toString();
  }
}

class $AttendanceDetailEntityTable extends AttendanceDetailEntity
    with TableInfo<$AttendanceDetailEntityTable, AttendanceDetailEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $AttendanceDetailEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dayOfMonthMeta = const VerificationMeta('dayOfMonth');
  GeneratedTextColumn _dayOfMonth;
  @override
  GeneratedTextColumn get dayOfMonth => _dayOfMonth ??= _constructDayOfMonth();
  GeneratedTextColumn _constructDayOfMonth() {
    return GeneratedTextColumn(
      'day_of_month',
      $tableName,
      true,
    );
  }

  final VerificationMeta _checkinMeta = const VerificationMeta('checkin');
  GeneratedDateTimeColumn _checkin;
  @override
  GeneratedDateTimeColumn get checkin => _checkin ??= _constructCheckin();
  GeneratedDateTimeColumn _constructCheckin() {
    return GeneratedDateTimeColumn(
      'checkin',
      $tableName,
      true,
    );
  }

  final VerificationMeta _checkoutMeta = const VerificationMeta('checkout');
  GeneratedDateTimeColumn _checkout;
  @override
  GeneratedDateTimeColumn get checkout => _checkout ??= _constructCheckout();
  GeneratedDateTimeColumn _constructCheckout() {
    return GeneratedDateTimeColumn(
      'checkout',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isLateMeta = const VerificationMeta('isLate');
  GeneratedBoolColumn _isLate;
  @override
  GeneratedBoolColumn get isLate => _isLate ??= _constructIsLate();
  GeneratedBoolColumn _constructIsLate() {
    return GeneratedBoolColumn(
      'is_late',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isEnoughWorkingTimeMeta =
      const VerificationMeta('isEnoughWorkingTime');
  GeneratedBoolColumn _isEnoughWorkingTime;
  @override
  GeneratedBoolColumn get isEnoughWorkingTime =>
      _isEnoughWorkingTime ??= _constructIsEnoughWorkingTime();
  GeneratedBoolColumn _constructIsEnoughWorkingTime() {
    return GeneratedBoolColumn(
      'is_enough_working_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _totalWorkingTimeMeta =
      const VerificationMeta('totalWorkingTime');
  GeneratedRealColumn _totalWorkingTime;
  @override
  GeneratedRealColumn get totalWorkingTime =>
      _totalWorkingTime ??= _constructTotalWorkingTime();
  GeneratedRealColumn _constructTotalWorkingTime() {
    return GeneratedRealColumn(
      'total_working_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn(
      'note',
      $tableName,
      true,
    );
  }

  final VerificationMeta _locationMeta = const VerificationMeta('location');
  GeneratedTextColumn _location;
  @override
  GeneratedTextColumn get location => _location ??= _constructLocation();
  GeneratedTextColumn _constructLocation() {
    return GeneratedTextColumn(
      'location',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dataJsonMeta = const VerificationMeta('dataJson');
  GeneratedTextColumn _dataJson;
  @override
  GeneratedTextColumn get dataJson => _dataJson ??= _constructDataJson();
  GeneratedTextColumn _constructDataJson() {
    return GeneratedTextColumn(
      'data_json',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dayOfMonthCompareMeta =
      const VerificationMeta('dayOfMonthCompare');
  GeneratedTextColumn _dayOfMonthCompare;
  @override
  GeneratedTextColumn get dayOfMonthCompare =>
      _dayOfMonthCompare ??= _constructDayOfMonthCompare();
  GeneratedTextColumn _constructDayOfMonthCompare() {
    return GeneratedTextColumn(
      'day_of_month_compare',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        id,
        dayOfMonth,
        checkin,
        checkout,
        isLate,
        isEnoughWorkingTime,
        totalWorkingTime,
        note,
        location,
        dataJson,
        dayOfMonthCompare
      ];
  @override
  $AttendanceDetailEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_attendance_detail';
  @override
  final String actualTableName = 'cip_today_attendance_detail';
  @override
  VerificationContext validateIntegrity(
      Insertable<AttendanceDetailEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('day_of_month')) {
      context.handle(
          _dayOfMonthMeta,
          dayOfMonth.isAcceptableOrUnknown(
              data['day_of_month'], _dayOfMonthMeta));
    }
    if (data.containsKey('checkin')) {
      context.handle(_checkinMeta,
          checkin.isAcceptableOrUnknown(data['checkin'], _checkinMeta));
    }
    if (data.containsKey('checkout')) {
      context.handle(_checkoutMeta,
          checkout.isAcceptableOrUnknown(data['checkout'], _checkoutMeta));
    }
    if (data.containsKey('is_late')) {
      context.handle(_isLateMeta,
          isLate.isAcceptableOrUnknown(data['is_late'], _isLateMeta));
    }
    if (data.containsKey('is_enough_working_time')) {
      context.handle(
          _isEnoughWorkingTimeMeta,
          isEnoughWorkingTime.isAcceptableOrUnknown(
              data['is_enough_working_time'], _isEnoughWorkingTimeMeta));
    }
    if (data.containsKey('total_working_time')) {
      context.handle(
          _totalWorkingTimeMeta,
          totalWorkingTime.isAcceptableOrUnknown(
              data['total_working_time'], _totalWorkingTimeMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note'], _noteMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location'], _locationMeta));
    }
    if (data.containsKey('data_json')) {
      context.handle(_dataJsonMeta,
          dataJson.isAcceptableOrUnknown(data['data_json'], _dataJsonMeta));
    }
    if (data.containsKey('day_of_month_compare')) {
      context.handle(
          _dayOfMonthCompareMeta,
          dayOfMonthCompare.isAcceptableOrUnknown(
              data['day_of_month_compare'], _dayOfMonthCompareMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AttendanceDetailEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return AttendanceDetailEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AttendanceDetailEntityTable createAlias(String alias) {
    return $AttendanceDetailEntityTable(_db, alias);
  }
}

class AttendanceStatisticEntry extends DataClass
    implements Insertable<AttendanceStatisticEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final int month;
  final double workingTime;
  AttendanceStatisticEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      @required this.month,
      @required this.workingTime});
  factory AttendanceStatisticEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    return AttendanceStatisticEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      month: intType.mapFromDatabaseResponse(data['${effectivePrefix}month']),
      workingTime: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}working_time']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || month != null) {
      map['month'] = Variable<int>(month);
    }
    if (!nullToAbsent || workingTime != null) {
      map['working_time'] = Variable<double>(workingTime);
    }
    return map;
  }

  AttendanceStatisticEntityCompanion toCompanion(bool nullToAbsent) {
    return AttendanceStatisticEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      month:
          month == null && nullToAbsent ? const Value.absent() : Value(month),
      workingTime: workingTime == null && nullToAbsent
          ? const Value.absent()
          : Value(workingTime),
    );
  }

  factory AttendanceStatisticEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AttendanceStatisticEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      month: serializer.fromJson<int>(json['month']),
      workingTime: serializer.fromJson<double>(json['workingTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'month': serializer.toJson<int>(month),
      'workingTime': serializer.toJson<double>(workingTime),
    };
  }

  AttendanceStatisticEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          int month,
          double workingTime}) =>
      AttendanceStatisticEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        month: month ?? this.month,
        workingTime: workingTime ?? this.workingTime,
      );
  @override
  String toString() {
    return (StringBuffer('AttendanceStatisticEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('month: $month, ')
          ..write('workingTime: $workingTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(deletedDate.hashCode,
                          $mrjc(month.hashCode, workingTime.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is AttendanceStatisticEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.month == this.month &&
          other.workingTime == this.workingTime);
}

class AttendanceStatisticEntityCompanion
    extends UpdateCompanion<AttendanceStatisticEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<int> month;
  final Value<double> workingTime;
  const AttendanceStatisticEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.month = const Value.absent(),
    this.workingTime = const Value.absent(),
  });
  AttendanceStatisticEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    @required int month,
    @required double workingTime,
  })  : month = Value(month),
        workingTime = Value(workingTime);
  static Insertable<AttendanceStatisticEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<int> month,
    Expression<double> workingTime,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (month != null) 'month': month,
      if (workingTime != null) 'working_time': workingTime,
    });
  }

  AttendanceStatisticEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<int> month,
      Value<double> workingTime}) {
    return AttendanceStatisticEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      month: month ?? this.month,
      workingTime: workingTime ?? this.workingTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (month.present) {
      map['month'] = Variable<int>(month.value);
    }
    if (workingTime.present) {
      map['working_time'] = Variable<double>(workingTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceStatisticEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('month: $month, ')
          ..write('workingTime: $workingTime')
          ..write(')'))
        .toString();
  }
}

class $AttendanceStatisticEntityTable extends AttendanceStatisticEntity
    with TableInfo<$AttendanceStatisticEntityTable, AttendanceStatisticEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $AttendanceStatisticEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _monthMeta = const VerificationMeta('month');
  GeneratedIntColumn _month;
  @override
  GeneratedIntColumn get month => _month ??= _constructMonth();
  GeneratedIntColumn _constructMonth() {
    return GeneratedIntColumn(
      'month',
      $tableName,
      false,
    );
  }

  final VerificationMeta _workingTimeMeta =
      const VerificationMeta('workingTime');
  GeneratedRealColumn _workingTime;
  @override
  GeneratedRealColumn get workingTime =>
      _workingTime ??= _constructWorkingTime();
  GeneratedRealColumn _constructWorkingTime() {
    return GeneratedRealColumn(
      'working_time',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        month,
        workingTime
      ];
  @override
  $AttendanceStatisticEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_attendance_statistic';
  @override
  final String actualTableName = 'cip_today_attendance_statistic';
  @override
  VerificationContext validateIntegrity(
      Insertable<AttendanceStatisticEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('month')) {
      context.handle(
          _monthMeta, month.isAcceptableOrUnknown(data['month'], _monthMeta));
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    if (data.containsKey('working_time')) {
      context.handle(
          _workingTimeMeta,
          workingTime.isAcceptableOrUnknown(
              data['working_time'], _workingTimeMeta));
    } else if (isInserting) {
      context.missing(_workingTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  AttendanceStatisticEntry map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return AttendanceStatisticEntry.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  $AttendanceStatisticEntityTable createAlias(String alias) {
    return $AttendanceStatisticEntityTable(_db, alias);
  }
}

class WelcomeMessageEntry extends DataClass
    implements Insertable<WelcomeMessageEntry> {
  final int id;
  final String messageContent;
  final String type;
  final double locationId;
  final double companyId;
  WelcomeMessageEntry(
      {@required this.id,
      this.messageContent,
      this.type,
      this.locationId,
      this.companyId});
  factory WelcomeMessageEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return WelcomeMessageEntry(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      messageContent: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}message_content']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      locationId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}location_id']),
      companyId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}company_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || messageContent != null) {
      map['message_content'] = Variable<String>(messageContent);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || locationId != null) {
      map['location_id'] = Variable<double>(locationId);
    }
    if (!nullToAbsent || companyId != null) {
      map['company_id'] = Variable<double>(companyId);
    }
    return map;
  }

  WelcomeMessageEntityCompanion toCompanion(bool nullToAbsent) {
    return WelcomeMessageEntityCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      messageContent: messageContent == null && nullToAbsent
          ? const Value.absent()
          : Value(messageContent),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      locationId: locationId == null && nullToAbsent
          ? const Value.absent()
          : Value(locationId),
      companyId: companyId == null && nullToAbsent
          ? const Value.absent()
          : Value(companyId),
    );
  }

  factory WelcomeMessageEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WelcomeMessageEntry(
      id: serializer.fromJson<int>(json['id']),
      messageContent: serializer.fromJson<String>(json['messageContent']),
      type: serializer.fromJson<String>(json['type']),
      locationId: serializer.fromJson<double>(json['locationId']),
      companyId: serializer.fromJson<double>(json['companyId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'messageContent': serializer.toJson<String>(messageContent),
      'type': serializer.toJson<String>(type),
      'locationId': serializer.toJson<double>(locationId),
      'companyId': serializer.toJson<double>(companyId),
    };
  }

  WelcomeMessageEntry copyWith(
          {int id,
          String messageContent,
          String type,
          double locationId,
          double companyId}) =>
      WelcomeMessageEntry(
        id: id ?? this.id,
        messageContent: messageContent ?? this.messageContent,
        type: type ?? this.type,
        locationId: locationId ?? this.locationId,
        companyId: companyId ?? this.companyId,
      );
  @override
  String toString() {
    return (StringBuffer('WelcomeMessageEntry(')
          ..write('id: $id, ')
          ..write('messageContent: $messageContent, ')
          ..write('type: $type, ')
          ..write('locationId: $locationId, ')
          ..write('companyId: $companyId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          messageContent.hashCode,
          $mrjc(
              type.hashCode, $mrjc(locationId.hashCode, companyId.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is WelcomeMessageEntry &&
          other.id == this.id &&
          other.messageContent == this.messageContent &&
          other.type == this.type &&
          other.locationId == this.locationId &&
          other.companyId == this.companyId);
}

class WelcomeMessageEntityCompanion
    extends UpdateCompanion<WelcomeMessageEntry> {
  final Value<int> id;
  final Value<String> messageContent;
  final Value<String> type;
  final Value<double> locationId;
  final Value<double> companyId;
  const WelcomeMessageEntityCompanion({
    this.id = const Value.absent(),
    this.messageContent = const Value.absent(),
    this.type = const Value.absent(),
    this.locationId = const Value.absent(),
    this.companyId = const Value.absent(),
  });
  WelcomeMessageEntityCompanion.insert({
    this.id = const Value.absent(),
    this.messageContent = const Value.absent(),
    this.type = const Value.absent(),
    this.locationId = const Value.absent(),
    this.companyId = const Value.absent(),
  });
  static Insertable<WelcomeMessageEntry> custom({
    Expression<int> id,
    Expression<String> messageContent,
    Expression<String> type,
    Expression<double> locationId,
    Expression<double> companyId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messageContent != null) 'message_content': messageContent,
      if (type != null) 'type': type,
      if (locationId != null) 'location_id': locationId,
      if (companyId != null) 'company_id': companyId,
    });
  }

  WelcomeMessageEntityCompanion copyWith(
      {Value<int> id,
      Value<String> messageContent,
      Value<String> type,
      Value<double> locationId,
      Value<double> companyId}) {
    return WelcomeMessageEntityCompanion(
      id: id ?? this.id,
      messageContent: messageContent ?? this.messageContent,
      type: type ?? this.type,
      locationId: locationId ?? this.locationId,
      companyId: companyId ?? this.companyId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (messageContent.present) {
      map['message_content'] = Variable<String>(messageContent.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<double>(locationId.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<double>(companyId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WelcomeMessageEntityCompanion(')
          ..write('id: $id, ')
          ..write('messageContent: $messageContent, ')
          ..write('type: $type, ')
          ..write('locationId: $locationId, ')
          ..write('companyId: $companyId')
          ..write(')'))
        .toString();
  }
}

class $WelcomeMessageEntityTable extends WelcomeMessageEntity
    with TableInfo<$WelcomeMessageEntityTable, WelcomeMessageEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $WelcomeMessageEntityTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _messageContentMeta =
      const VerificationMeta('messageContent');
  GeneratedTextColumn _messageContent;
  @override
  GeneratedTextColumn get messageContent =>
      _messageContent ??= _constructMessageContent();
  GeneratedTextColumn _constructMessageContent() {
    return GeneratedTextColumn(
      'message_content',
      $tableName,
      true,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn(
      'type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _locationIdMeta = const VerificationMeta('locationId');
  GeneratedRealColumn _locationId;
  @override
  GeneratedRealColumn get locationId => _locationId ??= _constructLocationId();
  GeneratedRealColumn _constructLocationId() {
    return GeneratedRealColumn(
      'location_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _companyIdMeta = const VerificationMeta('companyId');
  GeneratedRealColumn _companyId;
  @override
  GeneratedRealColumn get companyId => _companyId ??= _constructCompanyId();
  GeneratedRealColumn _constructCompanyId() {
    return GeneratedRealColumn(
      'company_id',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, messageContent, type, locationId, companyId];
  @override
  $WelcomeMessageEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_welcome_message';
  @override
  final String actualTableName = 'cip_welcome_message';
  @override
  VerificationContext validateIntegrity(
      Insertable<WelcomeMessageEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('message_content')) {
      context.handle(
          _messageContentMeta,
          messageContent.isAcceptableOrUnknown(
              data['message_content'], _messageContentMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    }
    if (data.containsKey('location_id')) {
      context.handle(
          _locationIdMeta,
          locationId.isAcceptableOrUnknown(
              data['location_id'], _locationIdMeta));
    }
    if (data.containsKey('company_id')) {
      context.handle(_companyIdMeta,
          companyId.isAcceptableOrUnknown(data['company_id'], _companyIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WelcomeMessageEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return WelcomeMessageEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WelcomeMessageEntityTable createAlias(String alias) {
    return $WelcomeMessageEntityTable(_db, alias);
  }
}

class ImageDownloadedEntry extends DataClass
    implements Insertable<ImageDownloadedEntry> {
  final String linkDownload;
  final String localPath;
  ImageDownloadedEntry({this.linkDownload, this.localPath});
  factory ImageDownloadedEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return ImageDownloadedEntry(
      linkDownload: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}link_download']),
      localPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}local_path']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || linkDownload != null) {
      map['link_download'] = Variable<String>(linkDownload);
    }
    if (!nullToAbsent || localPath != null) {
      map['local_path'] = Variable<String>(localPath);
    }
    return map;
  }

  ImageDownloadedEntityCompanion toCompanion(bool nullToAbsent) {
    return ImageDownloadedEntityCompanion(
      linkDownload: linkDownload == null && nullToAbsent
          ? const Value.absent()
          : Value(linkDownload),
      localPath: localPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localPath),
    );
  }

  factory ImageDownloadedEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ImageDownloadedEntry(
      linkDownload: serializer.fromJson<String>(json['linkDownload']),
      localPath: serializer.fromJson<String>(json['localPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'linkDownload': serializer.toJson<String>(linkDownload),
      'localPath': serializer.toJson<String>(localPath),
    };
  }

  ImageDownloadedEntry copyWith({String linkDownload, String localPath}) =>
      ImageDownloadedEntry(
        linkDownload: linkDownload ?? this.linkDownload,
        localPath: localPath ?? this.localPath,
      );
  @override
  String toString() {
    return (StringBuffer('ImageDownloadedEntry(')
          ..write('linkDownload: $linkDownload, ')
          ..write('localPath: $localPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(linkDownload.hashCode, localPath.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ImageDownloadedEntry &&
          other.linkDownload == this.linkDownload &&
          other.localPath == this.localPath);
}

class ImageDownloadedEntityCompanion
    extends UpdateCompanion<ImageDownloadedEntry> {
  final Value<String> linkDownload;
  final Value<String> localPath;
  const ImageDownloadedEntityCompanion({
    this.linkDownload = const Value.absent(),
    this.localPath = const Value.absent(),
  });
  ImageDownloadedEntityCompanion.insert({
    this.linkDownload = const Value.absent(),
    this.localPath = const Value.absent(),
  });
  static Insertable<ImageDownloadedEntry> custom({
    Expression<String> linkDownload,
    Expression<String> localPath,
  }) {
    return RawValuesInsertable({
      if (linkDownload != null) 'link_download': linkDownload,
      if (localPath != null) 'local_path': localPath,
    });
  }

  ImageDownloadedEntityCompanion copyWith(
      {Value<String> linkDownload, Value<String> localPath}) {
    return ImageDownloadedEntityCompanion(
      linkDownload: linkDownload ?? this.linkDownload,
      localPath: localPath ?? this.localPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (linkDownload.present) {
      map['link_download'] = Variable<String>(linkDownload.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImageDownloadedEntityCompanion(')
          ..write('linkDownload: $linkDownload, ')
          ..write('localPath: $localPath')
          ..write(')'))
        .toString();
  }
}

class $ImageDownloadedEntityTable extends ImageDownloadedEntity
    with TableInfo<$ImageDownloadedEntityTable, ImageDownloadedEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $ImageDownloadedEntityTable(this._db, [this._alias]);
  final VerificationMeta _linkDownloadMeta =
      const VerificationMeta('linkDownload');
  GeneratedTextColumn _linkDownload;
  @override
  GeneratedTextColumn get linkDownload =>
      _linkDownload ??= _constructLinkDownload();
  GeneratedTextColumn _constructLinkDownload() {
    return GeneratedTextColumn(
      'link_download',
      $tableName,
      true,
    );
  }

  final VerificationMeta _localPathMeta = const VerificationMeta('localPath');
  GeneratedTextColumn _localPath;
  @override
  GeneratedTextColumn get localPath => _localPath ??= _constructLocalPath();
  GeneratedTextColumn _constructLocalPath() {
    return GeneratedTextColumn(
      'local_path',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [linkDownload, localPath];
  @override
  $ImageDownloadedEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_image_downloaded';
  @override
  final String actualTableName = 'cip_image_downloaded';
  @override
  VerificationContext validateIntegrity(
      Insertable<ImageDownloadedEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('link_download')) {
      context.handle(
          _linkDownloadMeta,
          linkDownload.isAcceptableOrUnknown(
              data['link_download'], _linkDownloadMeta));
    }
    if (data.containsKey('local_path')) {
      context.handle(_localPathMeta,
          localPath.isAcceptableOrUnknown(data['local_path'], _localPathMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {linkDownload};
  @override
  ImageDownloadedEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ImageDownloadedEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ImageDownloadedEntityTable createAlias(String alias) {
    return $ImageDownloadedEntityTable(_db, alias);
  }
}

class ReminderInvitationEntry extends DataClass
    implements Insertable<ReminderInvitationEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final double idInvitation;
  final int delayNoti;
  final int reminderValue;
  final String contentNoti;
  final String titleNoti;
  ReminderInvitationEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      @required this.idInvitation,
      this.delayNoti,
      this.reminderValue,
      this.contentNoti,
      this.titleNoti});
  factory ReminderInvitationEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    final intType = db.typeSystem.forDartType<int>();
    return ReminderInvitationEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      idInvitation: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}id_invitation']),
      delayNoti:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}delay_noti']),
      reminderValue: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}reminder_value']),
      contentNoti: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}content_noti']),
      titleNoti: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}title_noti']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || idInvitation != null) {
      map['id_invitation'] = Variable<double>(idInvitation);
    }
    if (!nullToAbsent || delayNoti != null) {
      map['delay_noti'] = Variable<int>(delayNoti);
    }
    if (!nullToAbsent || reminderValue != null) {
      map['reminder_value'] = Variable<int>(reminderValue);
    }
    if (!nullToAbsent || contentNoti != null) {
      map['content_noti'] = Variable<String>(contentNoti);
    }
    if (!nullToAbsent || titleNoti != null) {
      map['title_noti'] = Variable<String>(titleNoti);
    }
    return map;
  }

  ReminderInvitationEntityCompanion toCompanion(bool nullToAbsent) {
    return ReminderInvitationEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      idInvitation: idInvitation == null && nullToAbsent
          ? const Value.absent()
          : Value(idInvitation),
      delayNoti: delayNoti == null && nullToAbsent
          ? const Value.absent()
          : Value(delayNoti),
      reminderValue: reminderValue == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderValue),
      contentNoti: contentNoti == null && nullToAbsent
          ? const Value.absent()
          : Value(contentNoti),
      titleNoti: titleNoti == null && nullToAbsent
          ? const Value.absent()
          : Value(titleNoti),
    );
  }

  factory ReminderInvitationEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ReminderInvitationEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      idInvitation: serializer.fromJson<double>(json['idInvitation']),
      delayNoti: serializer.fromJson<int>(json['delayNoti']),
      reminderValue: serializer.fromJson<int>(json['reminderValue']),
      contentNoti: serializer.fromJson<String>(json['contentNoti']),
      titleNoti: serializer.fromJson<String>(json['titleNoti']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'idInvitation': serializer.toJson<double>(idInvitation),
      'delayNoti': serializer.toJson<int>(delayNoti),
      'reminderValue': serializer.toJson<int>(reminderValue),
      'contentNoti': serializer.toJson<String>(contentNoti),
      'titleNoti': serializer.toJson<String>(titleNoti),
    };
  }

  ReminderInvitationEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          double idInvitation,
          int delayNoti,
          int reminderValue,
          String contentNoti,
          String titleNoti}) =>
      ReminderInvitationEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        idInvitation: idInvitation ?? this.idInvitation,
        delayNoti: delayNoti ?? this.delayNoti,
        reminderValue: reminderValue ?? this.reminderValue,
        contentNoti: contentNoti ?? this.contentNoti,
        titleNoti: titleNoti ?? this.titleNoti,
      );
  @override
  String toString() {
    return (StringBuffer('ReminderInvitationEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('idInvitation: $idInvitation, ')
          ..write('delayNoti: $delayNoti, ')
          ..write('reminderValue: $reminderValue, ')
          ..write('contentNoti: $contentNoti, ')
          ..write('titleNoti: $titleNoti')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              idInvitation.hashCode,
                              $mrjc(
                                  delayNoti.hashCode,
                                  $mrjc(
                                      reminderValue.hashCode,
                                      $mrjc(contentNoti.hashCode,
                                          titleNoti.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ReminderInvitationEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.idInvitation == this.idInvitation &&
          other.delayNoti == this.delayNoti &&
          other.reminderValue == this.reminderValue &&
          other.contentNoti == this.contentNoti &&
          other.titleNoti == this.titleNoti);
}

class ReminderInvitationEntityCompanion
    extends UpdateCompanion<ReminderInvitationEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<double> idInvitation;
  final Value<int> delayNoti;
  final Value<int> reminderValue;
  final Value<String> contentNoti;
  final Value<String> titleNoti;
  const ReminderInvitationEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.idInvitation = const Value.absent(),
    this.delayNoti = const Value.absent(),
    this.reminderValue = const Value.absent(),
    this.contentNoti = const Value.absent(),
    this.titleNoti = const Value.absent(),
  });
  ReminderInvitationEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    @required double idInvitation,
    this.delayNoti = const Value.absent(),
    this.reminderValue = const Value.absent(),
    this.contentNoti = const Value.absent(),
    this.titleNoti = const Value.absent(),
  }) : idInvitation = Value(idInvitation);
  static Insertable<ReminderInvitationEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<double> idInvitation,
    Expression<int> delayNoti,
    Expression<int> reminderValue,
    Expression<String> contentNoti,
    Expression<String> titleNoti,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (idInvitation != null) 'id_invitation': idInvitation,
      if (delayNoti != null) 'delay_noti': delayNoti,
      if (reminderValue != null) 'reminder_value': reminderValue,
      if (contentNoti != null) 'content_noti': contentNoti,
      if (titleNoti != null) 'title_noti': titleNoti,
    });
  }

  ReminderInvitationEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<double> idInvitation,
      Value<int> delayNoti,
      Value<int> reminderValue,
      Value<String> contentNoti,
      Value<String> titleNoti}) {
    return ReminderInvitationEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      idInvitation: idInvitation ?? this.idInvitation,
      delayNoti: delayNoti ?? this.delayNoti,
      reminderValue: reminderValue ?? this.reminderValue,
      contentNoti: contentNoti ?? this.contentNoti,
      titleNoti: titleNoti ?? this.titleNoti,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (idInvitation.present) {
      map['id_invitation'] = Variable<double>(idInvitation.value);
    }
    if (delayNoti.present) {
      map['delay_noti'] = Variable<int>(delayNoti.value);
    }
    if (reminderValue.present) {
      map['reminder_value'] = Variable<int>(reminderValue.value);
    }
    if (contentNoti.present) {
      map['content_noti'] = Variable<String>(contentNoti.value);
    }
    if (titleNoti.present) {
      map['title_noti'] = Variable<String>(titleNoti.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReminderInvitationEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('idInvitation: $idInvitation, ')
          ..write('delayNoti: $delayNoti, ')
          ..write('reminderValue: $reminderValue, ')
          ..write('contentNoti: $contentNoti, ')
          ..write('titleNoti: $titleNoti')
          ..write(')'))
        .toString();
  }
}

class $ReminderInvitationEntityTable extends ReminderInvitationEntity
    with TableInfo<$ReminderInvitationEntityTable, ReminderInvitationEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $ReminderInvitationEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idInvitationMeta =
      const VerificationMeta('idInvitation');
  GeneratedRealColumn _idInvitation;
  @override
  GeneratedRealColumn get idInvitation =>
      _idInvitation ??= _constructIdInvitation();
  GeneratedRealColumn _constructIdInvitation() {
    return GeneratedRealColumn(
      'id_invitation',
      $tableName,
      false,
    );
  }

  final VerificationMeta _delayNotiMeta = const VerificationMeta('delayNoti');
  GeneratedIntColumn _delayNoti;
  @override
  GeneratedIntColumn get delayNoti => _delayNoti ??= _constructDelayNoti();
  GeneratedIntColumn _constructDelayNoti() {
    return GeneratedIntColumn(
      'delay_noti',
      $tableName,
      true,
    );
  }

  final VerificationMeta _reminderValueMeta =
      const VerificationMeta('reminderValue');
  GeneratedIntColumn _reminderValue;
  @override
  GeneratedIntColumn get reminderValue =>
      _reminderValue ??= _constructReminderValue();
  GeneratedIntColumn _constructReminderValue() {
    return GeneratedIntColumn(
      'reminder_value',
      $tableName,
      true,
    );
  }

  final VerificationMeta _contentNotiMeta =
      const VerificationMeta('contentNoti');
  GeneratedTextColumn _contentNoti;
  @override
  GeneratedTextColumn get contentNoti =>
      _contentNoti ??= _constructContentNoti();
  GeneratedTextColumn _constructContentNoti() {
    return GeneratedTextColumn(
      'content_noti',
      $tableName,
      true,
    );
  }

  final VerificationMeta _titleNotiMeta = const VerificationMeta('titleNoti');
  GeneratedTextColumn _titleNoti;
  @override
  GeneratedTextColumn get titleNoti => _titleNoti ??= _constructTitleNoti();
  GeneratedTextColumn _constructTitleNoti() {
    return GeneratedTextColumn(
      'title_noti',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        idInvitation,
        delayNoti,
        reminderValue,
        contentNoti,
        titleNoti
      ];
  @override
  $ReminderInvitationEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_reminder_invitation';
  @override
  final String actualTableName = 'cip_today_reminder_invitation';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReminderInvitationEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id_invitation')) {
      context.handle(
          _idInvitationMeta,
          idInvitation.isAcceptableOrUnknown(
              data['id_invitation'], _idInvitationMeta));
    } else if (isInserting) {
      context.missing(_idInvitationMeta);
    }
    if (data.containsKey('delay_noti')) {
      context.handle(_delayNotiMeta,
          delayNoti.isAcceptableOrUnknown(data['delay_noti'], _delayNotiMeta));
    }
    if (data.containsKey('reminder_value')) {
      context.handle(
          _reminderValueMeta,
          reminderValue.isAcceptableOrUnknown(
              data['reminder_value'], _reminderValueMeta));
    }
    if (data.containsKey('content_noti')) {
      context.handle(
          _contentNotiMeta,
          contentNoti.isAcceptableOrUnknown(
              data['content_noti'], _contentNotiMeta));
    }
    if (data.containsKey('title_noti')) {
      context.handle(_titleNotiMeta,
          titleNoti.isAcceptableOrUnknown(data['title_noti'], _titleNotiMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idInvitation};
  @override
  ReminderInvitationEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ReminderInvitationEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ReminderInvitationEntityTable createAlias(String alias) {
    return $ReminderInvitationEntityTable(_db, alias);
  }
}

class EventTicketEntry extends DataClass
    implements Insertable<EventTicketEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final double id;
  final String eventName;
  final String siteName;
  final String siteAddress;
  final String eventType;
  final DateTime startDate;
  final DateTime endDate;
  final String description;
  final String coverPathFile;
  final double coverRepoId;
  final String contactPhone;
  final String contactEmail;
  final String organizersName;
  final String organizersInfo;
  final String sendReminder;
  final String reminderDays;
  final double branchId;
  final double companyId;
  final bool startedState;
  final bool orderedState;
  final int isOnline;
  EventTicketEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      this.id,
      this.eventName,
      this.siteName,
      this.siteAddress,
      this.eventType,
      this.startDate,
      this.endDate,
      this.description,
      this.coverPathFile,
      this.coverRepoId,
      this.contactPhone,
      this.contactEmail,
      this.organizersName,
      this.organizersInfo,
      this.sendReminder,
      this.reminderDays,
      this.branchId,
      this.companyId,
      this.startedState,
      this.orderedState,
      this.isOnline});
  factory EventTicketEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    final boolType = db.typeSystem.forDartType<bool>();
    final intType = db.typeSystem.forDartType<int>();
    return EventTicketEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      id: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      eventName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}event_name']),
      siteName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}site_name']),
      siteAddress: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}site_address']),
      eventType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}event_type']),
      startDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date']),
      endDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}end_date']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      coverPathFile: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}cover_path_file']),
      coverRepoId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}cover_repo_id']),
      contactPhone: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}contact_phone']),
      contactEmail: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}contact_email']),
      organizersName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}organizers_name']),
      organizersInfo: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}organizers_info']),
      sendReminder: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}send_reminder']),
      reminderDays: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}reminder_days']),
      branchId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}branch_id']),
      companyId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}company_id']),
      startedState: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}started_state']),
      orderedState: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}ordered_state']),
      isOnline:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}is_online']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<double>(id);
    }
    if (!nullToAbsent || eventName != null) {
      map['event_name'] = Variable<String>(eventName);
    }
    if (!nullToAbsent || siteName != null) {
      map['site_name'] = Variable<String>(siteName);
    }
    if (!nullToAbsent || siteAddress != null) {
      map['site_address'] = Variable<String>(siteAddress);
    }
    if (!nullToAbsent || eventType != null) {
      map['event_type'] = Variable<String>(eventType);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || coverPathFile != null) {
      map['cover_path_file'] = Variable<String>(coverPathFile);
    }
    if (!nullToAbsent || coverRepoId != null) {
      map['cover_repo_id'] = Variable<double>(coverRepoId);
    }
    if (!nullToAbsent || contactPhone != null) {
      map['contact_phone'] = Variable<String>(contactPhone);
    }
    if (!nullToAbsent || contactEmail != null) {
      map['contact_email'] = Variable<String>(contactEmail);
    }
    if (!nullToAbsent || organizersName != null) {
      map['organizers_name'] = Variable<String>(organizersName);
    }
    if (!nullToAbsent || organizersInfo != null) {
      map['organizers_info'] = Variable<String>(organizersInfo);
    }
    if (!nullToAbsent || sendReminder != null) {
      map['send_reminder'] = Variable<String>(sendReminder);
    }
    if (!nullToAbsent || reminderDays != null) {
      map['reminder_days'] = Variable<String>(reminderDays);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<double>(branchId);
    }
    if (!nullToAbsent || companyId != null) {
      map['company_id'] = Variable<double>(companyId);
    }
    if (!nullToAbsent || startedState != null) {
      map['started_state'] = Variable<bool>(startedState);
    }
    if (!nullToAbsent || orderedState != null) {
      map['ordered_state'] = Variable<bool>(orderedState);
    }
    if (!nullToAbsent || isOnline != null) {
      map['is_online'] = Variable<int>(isOnline);
    }
    return map;
  }

  EventTicketEntityCompanion toCompanion(bool nullToAbsent) {
    return EventTicketEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      eventName: eventName == null && nullToAbsent
          ? const Value.absent()
          : Value(eventName),
      siteName: siteName == null && nullToAbsent
          ? const Value.absent()
          : Value(siteName),
      siteAddress: siteAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(siteAddress),
      eventType: eventType == null && nullToAbsent
          ? const Value.absent()
          : Value(eventType),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      coverPathFile: coverPathFile == null && nullToAbsent
          ? const Value.absent()
          : Value(coverPathFile),
      coverRepoId: coverRepoId == null && nullToAbsent
          ? const Value.absent()
          : Value(coverRepoId),
      contactPhone: contactPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(contactPhone),
      contactEmail: contactEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(contactEmail),
      organizersName: organizersName == null && nullToAbsent
          ? const Value.absent()
          : Value(organizersName),
      organizersInfo: organizersInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(organizersInfo),
      sendReminder: sendReminder == null && nullToAbsent
          ? const Value.absent()
          : Value(sendReminder),
      reminderDays: reminderDays == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderDays),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      companyId: companyId == null && nullToAbsent
          ? const Value.absent()
          : Value(companyId),
      startedState: startedState == null && nullToAbsent
          ? const Value.absent()
          : Value(startedState),
      orderedState: orderedState == null && nullToAbsent
          ? const Value.absent()
          : Value(orderedState),
      isOnline: isOnline == null && nullToAbsent
          ? const Value.absent()
          : Value(isOnline),
    );
  }

  factory EventTicketEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return EventTicketEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      id: serializer.fromJson<double>(json['id']),
      eventName: serializer.fromJson<String>(json['eventName']),
      siteName: serializer.fromJson<String>(json['siteName']),
      siteAddress: serializer.fromJson<String>(json['siteAddress']),
      eventType: serializer.fromJson<String>(json['eventType']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      description: serializer.fromJson<String>(json['description']),
      coverPathFile: serializer.fromJson<String>(json['coverPathFile']),
      coverRepoId: serializer.fromJson<double>(json['coverRepoId']),
      contactPhone: serializer.fromJson<String>(json['contactPhone']),
      contactEmail: serializer.fromJson<String>(json['contactEmail']),
      organizersName: serializer.fromJson<String>(json['organizersName']),
      organizersInfo: serializer.fromJson<String>(json['organizersInfo']),
      sendReminder: serializer.fromJson<String>(json['sendReminder']),
      reminderDays: serializer.fromJson<String>(json['reminderDays']),
      branchId: serializer.fromJson<double>(json['branchId']),
      companyId: serializer.fromJson<double>(json['companyId']),
      startedState: serializer.fromJson<bool>(json['startedState']),
      orderedState: serializer.fromJson<bool>(json['orderedState']),
      isOnline: serializer.fromJson<int>(json['isOnline']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'id': serializer.toJson<double>(id),
      'eventName': serializer.toJson<String>(eventName),
      'siteName': serializer.toJson<String>(siteName),
      'siteAddress': serializer.toJson<String>(siteAddress),
      'eventType': serializer.toJson<String>(eventType),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'description': serializer.toJson<String>(description),
      'coverPathFile': serializer.toJson<String>(coverPathFile),
      'coverRepoId': serializer.toJson<double>(coverRepoId),
      'contactPhone': serializer.toJson<String>(contactPhone),
      'contactEmail': serializer.toJson<String>(contactEmail),
      'organizersName': serializer.toJson<String>(organizersName),
      'organizersInfo': serializer.toJson<String>(organizersInfo),
      'sendReminder': serializer.toJson<String>(sendReminder),
      'reminderDays': serializer.toJson<String>(reminderDays),
      'branchId': serializer.toJson<double>(branchId),
      'companyId': serializer.toJson<double>(companyId),
      'startedState': serializer.toJson<bool>(startedState),
      'orderedState': serializer.toJson<bool>(orderedState),
      'isOnline': serializer.toJson<int>(isOnline),
    };
  }

  EventTicketEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          double id,
          String eventName,
          String siteName,
          String siteAddress,
          String eventType,
          DateTime startDate,
          DateTime endDate,
          String description,
          String coverPathFile,
          double coverRepoId,
          String contactPhone,
          String contactEmail,
          String organizersName,
          String organizersInfo,
          String sendReminder,
          String reminderDays,
          double branchId,
          double companyId,
          bool startedState,
          bool orderedState,
          int isOnline}) =>
      EventTicketEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        id: id ?? this.id,
        eventName: eventName ?? this.eventName,
        siteName: siteName ?? this.siteName,
        siteAddress: siteAddress ?? this.siteAddress,
        eventType: eventType ?? this.eventType,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        description: description ?? this.description,
        coverPathFile: coverPathFile ?? this.coverPathFile,
        coverRepoId: coverRepoId ?? this.coverRepoId,
        contactPhone: contactPhone ?? this.contactPhone,
        contactEmail: contactEmail ?? this.contactEmail,
        organizersName: organizersName ?? this.organizersName,
        organizersInfo: organizersInfo ?? this.organizersInfo,
        sendReminder: sendReminder ?? this.sendReminder,
        reminderDays: reminderDays ?? this.reminderDays,
        branchId: branchId ?? this.branchId,
        companyId: companyId ?? this.companyId,
        startedState: startedState ?? this.startedState,
        orderedState: orderedState ?? this.orderedState,
        isOnline: isOnline ?? this.isOnline,
      );
  @override
  String toString() {
    return (StringBuffer('EventTicketEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('eventName: $eventName, ')
          ..write('siteName: $siteName, ')
          ..write('siteAddress: $siteAddress, ')
          ..write('eventType: $eventType, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('description: $description, ')
          ..write('coverPathFile: $coverPathFile, ')
          ..write('coverRepoId: $coverRepoId, ')
          ..write('contactPhone: $contactPhone, ')
          ..write('contactEmail: $contactEmail, ')
          ..write('organizersName: $organizersName, ')
          ..write('organizersInfo: $organizersInfo, ')
          ..write('sendReminder: $sendReminder, ')
          ..write('reminderDays: $reminderDays, ')
          ..write('branchId: $branchId, ')
          ..write('companyId: $companyId, ')
          ..write('startedState: $startedState, ')
          ..write('orderedState: $orderedState, ')
          ..write('isOnline: $isOnline')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              id.hashCode,
                              $mrjc(
                                  eventName.hashCode,
                                  $mrjc(
                                      siteName.hashCode,
                                      $mrjc(
                                          siteAddress.hashCode,
                                          $mrjc(
                                              eventType.hashCode,
                                              $mrjc(
                                                  startDate.hashCode,
                                                  $mrjc(
                                                      endDate.hashCode,
                                                      $mrjc(
                                                          description.hashCode,
                                                          $mrjc(
                                                              coverPathFile
                                                                  .hashCode,
                                                              $mrjc(
                                                                  coverRepoId
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      contactPhone
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          contactEmail
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              organizersName.hashCode,
                                                                              $mrjc(organizersInfo.hashCode, $mrjc(sendReminder.hashCode, $mrjc(reminderDays.hashCode, $mrjc(branchId.hashCode, $mrjc(companyId.hashCode, $mrjc(startedState.hashCode, $mrjc(orderedState.hashCode, isOnline.hashCode)))))))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is EventTicketEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.id == this.id &&
          other.eventName == this.eventName &&
          other.siteName == this.siteName &&
          other.siteAddress == this.siteAddress &&
          other.eventType == this.eventType &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.description == this.description &&
          other.coverPathFile == this.coverPathFile &&
          other.coverRepoId == this.coverRepoId &&
          other.contactPhone == this.contactPhone &&
          other.contactEmail == this.contactEmail &&
          other.organizersName == this.organizersName &&
          other.organizersInfo == this.organizersInfo &&
          other.sendReminder == this.sendReminder &&
          other.reminderDays == this.reminderDays &&
          other.branchId == this.branchId &&
          other.companyId == this.companyId &&
          other.startedState == this.startedState &&
          other.orderedState == this.orderedState &&
          other.isOnline == this.isOnline);
}

class EventTicketEntityCompanion extends UpdateCompanion<EventTicketEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<double> id;
  final Value<String> eventName;
  final Value<String> siteName;
  final Value<String> siteAddress;
  final Value<String> eventType;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<String> description;
  final Value<String> coverPathFile;
  final Value<double> coverRepoId;
  final Value<String> contactPhone;
  final Value<String> contactEmail;
  final Value<String> organizersName;
  final Value<String> organizersInfo;
  final Value<String> sendReminder;
  final Value<String> reminderDays;
  final Value<double> branchId;
  final Value<double> companyId;
  final Value<bool> startedState;
  final Value<bool> orderedState;
  final Value<int> isOnline;
  const EventTicketEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.eventName = const Value.absent(),
    this.siteName = const Value.absent(),
    this.siteAddress = const Value.absent(),
    this.eventType = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.description = const Value.absent(),
    this.coverPathFile = const Value.absent(),
    this.coverRepoId = const Value.absent(),
    this.contactPhone = const Value.absent(),
    this.contactEmail = const Value.absent(),
    this.organizersName = const Value.absent(),
    this.organizersInfo = const Value.absent(),
    this.sendReminder = const Value.absent(),
    this.reminderDays = const Value.absent(),
    this.branchId = const Value.absent(),
    this.companyId = const Value.absent(),
    this.startedState = const Value.absent(),
    this.orderedState = const Value.absent(),
    this.isOnline = const Value.absent(),
  });
  EventTicketEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.eventName = const Value.absent(),
    this.siteName = const Value.absent(),
    this.siteAddress = const Value.absent(),
    this.eventType = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.description = const Value.absent(),
    this.coverPathFile = const Value.absent(),
    this.coverRepoId = const Value.absent(),
    this.contactPhone = const Value.absent(),
    this.contactEmail = const Value.absent(),
    this.organizersName = const Value.absent(),
    this.organizersInfo = const Value.absent(),
    this.sendReminder = const Value.absent(),
    this.reminderDays = const Value.absent(),
    this.branchId = const Value.absent(),
    this.companyId = const Value.absent(),
    this.startedState = const Value.absent(),
    this.orderedState = const Value.absent(),
    this.isOnline = const Value.absent(),
  });
  static Insertable<EventTicketEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<double> id,
    Expression<String> eventName,
    Expression<String> siteName,
    Expression<String> siteAddress,
    Expression<String> eventType,
    Expression<DateTime> startDate,
    Expression<DateTime> endDate,
    Expression<String> description,
    Expression<String> coverPathFile,
    Expression<double> coverRepoId,
    Expression<String> contactPhone,
    Expression<String> contactEmail,
    Expression<String> organizersName,
    Expression<String> organizersInfo,
    Expression<String> sendReminder,
    Expression<String> reminderDays,
    Expression<double> branchId,
    Expression<double> companyId,
    Expression<bool> startedState,
    Expression<bool> orderedState,
    Expression<int> isOnline,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (id != null) 'id': id,
      if (eventName != null) 'event_name': eventName,
      if (siteName != null) 'site_name': siteName,
      if (siteAddress != null) 'site_address': siteAddress,
      if (eventType != null) 'event_type': eventType,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (description != null) 'description': description,
      if (coverPathFile != null) 'cover_path_file': coverPathFile,
      if (coverRepoId != null) 'cover_repo_id': coverRepoId,
      if (contactPhone != null) 'contact_phone': contactPhone,
      if (contactEmail != null) 'contact_email': contactEmail,
      if (organizersName != null) 'organizers_name': organizersName,
      if (organizersInfo != null) 'organizers_info': organizersInfo,
      if (sendReminder != null) 'send_reminder': sendReminder,
      if (reminderDays != null) 'reminder_days': reminderDays,
      if (branchId != null) 'branch_id': branchId,
      if (companyId != null) 'company_id': companyId,
      if (startedState != null) 'started_state': startedState,
      if (orderedState != null) 'ordered_state': orderedState,
      if (isOnline != null) 'is_online': isOnline,
    });
  }

  EventTicketEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<double> id,
      Value<String> eventName,
      Value<String> siteName,
      Value<String> siteAddress,
      Value<String> eventType,
      Value<DateTime> startDate,
      Value<DateTime> endDate,
      Value<String> description,
      Value<String> coverPathFile,
      Value<double> coverRepoId,
      Value<String> contactPhone,
      Value<String> contactEmail,
      Value<String> organizersName,
      Value<String> organizersInfo,
      Value<String> sendReminder,
      Value<String> reminderDays,
      Value<double> branchId,
      Value<double> companyId,
      Value<bool> startedState,
      Value<bool> orderedState,
      Value<int> isOnline}) {
    return EventTicketEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      id: id ?? this.id,
      eventName: eventName ?? this.eventName,
      siteName: siteName ?? this.siteName,
      siteAddress: siteAddress ?? this.siteAddress,
      eventType: eventType ?? this.eventType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      coverPathFile: coverPathFile ?? this.coverPathFile,
      coverRepoId: coverRepoId ?? this.coverRepoId,
      contactPhone: contactPhone ?? this.contactPhone,
      contactEmail: contactEmail ?? this.contactEmail,
      organizersName: organizersName ?? this.organizersName,
      organizersInfo: organizersInfo ?? this.organizersInfo,
      sendReminder: sendReminder ?? this.sendReminder,
      reminderDays: reminderDays ?? this.reminderDays,
      branchId: branchId ?? this.branchId,
      companyId: companyId ?? this.companyId,
      startedState: startedState ?? this.startedState,
      orderedState: orderedState ?? this.orderedState,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (id.present) {
      map['id'] = Variable<double>(id.value);
    }
    if (eventName.present) {
      map['event_name'] = Variable<String>(eventName.value);
    }
    if (siteName.present) {
      map['site_name'] = Variable<String>(siteName.value);
    }
    if (siteAddress.present) {
      map['site_address'] = Variable<String>(siteAddress.value);
    }
    if (eventType.present) {
      map['event_type'] = Variable<String>(eventType.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (coverPathFile.present) {
      map['cover_path_file'] = Variable<String>(coverPathFile.value);
    }
    if (coverRepoId.present) {
      map['cover_repo_id'] = Variable<double>(coverRepoId.value);
    }
    if (contactPhone.present) {
      map['contact_phone'] = Variable<String>(contactPhone.value);
    }
    if (contactEmail.present) {
      map['contact_email'] = Variable<String>(contactEmail.value);
    }
    if (organizersName.present) {
      map['organizers_name'] = Variable<String>(organizersName.value);
    }
    if (organizersInfo.present) {
      map['organizers_info'] = Variable<String>(organizersInfo.value);
    }
    if (sendReminder.present) {
      map['send_reminder'] = Variable<String>(sendReminder.value);
    }
    if (reminderDays.present) {
      map['reminder_days'] = Variable<String>(reminderDays.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<double>(branchId.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<double>(companyId.value);
    }
    if (startedState.present) {
      map['started_state'] = Variable<bool>(startedState.value);
    }
    if (orderedState.present) {
      map['ordered_state'] = Variable<bool>(orderedState.value);
    }
    if (isOnline.present) {
      map['is_online'] = Variable<int>(isOnline.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventTicketEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('eventName: $eventName, ')
          ..write('siteName: $siteName, ')
          ..write('siteAddress: $siteAddress, ')
          ..write('eventType: $eventType, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('description: $description, ')
          ..write('coverPathFile: $coverPathFile, ')
          ..write('coverRepoId: $coverRepoId, ')
          ..write('contactPhone: $contactPhone, ')
          ..write('contactEmail: $contactEmail, ')
          ..write('organizersName: $organizersName, ')
          ..write('organizersInfo: $organizersInfo, ')
          ..write('sendReminder: $sendReminder, ')
          ..write('reminderDays: $reminderDays, ')
          ..write('branchId: $branchId, ')
          ..write('companyId: $companyId, ')
          ..write('startedState: $startedState, ')
          ..write('orderedState: $orderedState, ')
          ..write('isOnline: $isOnline')
          ..write(')'))
        .toString();
  }
}

class $EventTicketEntityTable extends EventTicketEntity
    with TableInfo<$EventTicketEntityTable, EventTicketEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $EventTicketEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedRealColumn _id;
  @override
  GeneratedRealColumn get id => _id ??= _constructId();
  GeneratedRealColumn _constructId() {
    return GeneratedRealColumn(
      'id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _eventNameMeta = const VerificationMeta('eventName');
  GeneratedTextColumn _eventName;
  @override
  GeneratedTextColumn get eventName => _eventName ??= _constructEventName();
  GeneratedTextColumn _constructEventName() {
    return GeneratedTextColumn(
      'event_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _siteNameMeta = const VerificationMeta('siteName');
  GeneratedTextColumn _siteName;
  @override
  GeneratedTextColumn get siteName => _siteName ??= _constructSiteName();
  GeneratedTextColumn _constructSiteName() {
    return GeneratedTextColumn(
      'site_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _siteAddressMeta =
      const VerificationMeta('siteAddress');
  GeneratedTextColumn _siteAddress;
  @override
  GeneratedTextColumn get siteAddress =>
      _siteAddress ??= _constructSiteAddress();
  GeneratedTextColumn _constructSiteAddress() {
    return GeneratedTextColumn(
      'site_address',
      $tableName,
      true,
    );
  }

  final VerificationMeta _eventTypeMeta = const VerificationMeta('eventType');
  GeneratedTextColumn _eventType;
  @override
  GeneratedTextColumn get eventType => _eventType ??= _constructEventType();
  GeneratedTextColumn _constructEventType() {
    return GeneratedTextColumn(
      'event_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _startDateMeta = const VerificationMeta('startDate');
  GeneratedDateTimeColumn _startDate;
  @override
  GeneratedDateTimeColumn get startDate => _startDate ??= _constructStartDate();
  GeneratedDateTimeColumn _constructStartDate() {
    return GeneratedDateTimeColumn(
      'start_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _endDateMeta = const VerificationMeta('endDate');
  GeneratedDateTimeColumn _endDate;
  @override
  GeneratedDateTimeColumn get endDate => _endDate ??= _constructEndDate();
  GeneratedDateTimeColumn _constructEndDate() {
    return GeneratedDateTimeColumn(
      'end_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _coverPathFileMeta =
      const VerificationMeta('coverPathFile');
  GeneratedTextColumn _coverPathFile;
  @override
  GeneratedTextColumn get coverPathFile =>
      _coverPathFile ??= _constructCoverPathFile();
  GeneratedTextColumn _constructCoverPathFile() {
    return GeneratedTextColumn(
      'cover_path_file',
      $tableName,
      true,
    );
  }

  final VerificationMeta _coverRepoIdMeta =
      const VerificationMeta('coverRepoId');
  GeneratedRealColumn _coverRepoId;
  @override
  GeneratedRealColumn get coverRepoId =>
      _coverRepoId ??= _constructCoverRepoId();
  GeneratedRealColumn _constructCoverRepoId() {
    return GeneratedRealColumn(
      'cover_repo_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _contactPhoneMeta =
      const VerificationMeta('contactPhone');
  GeneratedTextColumn _contactPhone;
  @override
  GeneratedTextColumn get contactPhone =>
      _contactPhone ??= _constructContactPhone();
  GeneratedTextColumn _constructContactPhone() {
    return GeneratedTextColumn(
      'contact_phone',
      $tableName,
      true,
    );
  }

  final VerificationMeta _contactEmailMeta =
      const VerificationMeta('contactEmail');
  GeneratedTextColumn _contactEmail;
  @override
  GeneratedTextColumn get contactEmail =>
      _contactEmail ??= _constructContactEmail();
  GeneratedTextColumn _constructContactEmail() {
    return GeneratedTextColumn(
      'contact_email',
      $tableName,
      true,
    );
  }

  final VerificationMeta _organizersNameMeta =
      const VerificationMeta('organizersName');
  GeneratedTextColumn _organizersName;
  @override
  GeneratedTextColumn get organizersName =>
      _organizersName ??= _constructOrganizersName();
  GeneratedTextColumn _constructOrganizersName() {
    return GeneratedTextColumn(
      'organizers_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _organizersInfoMeta =
      const VerificationMeta('organizersInfo');
  GeneratedTextColumn _organizersInfo;
  @override
  GeneratedTextColumn get organizersInfo =>
      _organizersInfo ??= _constructOrganizersInfo();
  GeneratedTextColumn _constructOrganizersInfo() {
    return GeneratedTextColumn(
      'organizers_info',
      $tableName,
      true,
    );
  }

  final VerificationMeta _sendReminderMeta =
      const VerificationMeta('sendReminder');
  GeneratedTextColumn _sendReminder;
  @override
  GeneratedTextColumn get sendReminder =>
      _sendReminder ??= _constructSendReminder();
  GeneratedTextColumn _constructSendReminder() {
    return GeneratedTextColumn(
      'send_reminder',
      $tableName,
      true,
    );
  }

  final VerificationMeta _reminderDaysMeta =
      const VerificationMeta('reminderDays');
  GeneratedTextColumn _reminderDays;
  @override
  GeneratedTextColumn get reminderDays =>
      _reminderDays ??= _constructReminderDays();
  GeneratedTextColumn _constructReminderDays() {
    return GeneratedTextColumn(
      'reminder_days',
      $tableName,
      true,
    );
  }

  final VerificationMeta _branchIdMeta = const VerificationMeta('branchId');
  GeneratedRealColumn _branchId;
  @override
  GeneratedRealColumn get branchId => _branchId ??= _constructBranchId();
  GeneratedRealColumn _constructBranchId() {
    return GeneratedRealColumn(
      'branch_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _companyIdMeta = const VerificationMeta('companyId');
  GeneratedRealColumn _companyId;
  @override
  GeneratedRealColumn get companyId => _companyId ??= _constructCompanyId();
  GeneratedRealColumn _constructCompanyId() {
    return GeneratedRealColumn(
      'company_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _startedStateMeta =
      const VerificationMeta('startedState');
  GeneratedBoolColumn _startedState;
  @override
  GeneratedBoolColumn get startedState =>
      _startedState ??= _constructStartedState();
  GeneratedBoolColumn _constructStartedState() {
    return GeneratedBoolColumn(
      'started_state',
      $tableName,
      true,
    );
  }

  final VerificationMeta _orderedStateMeta =
      const VerificationMeta('orderedState');
  GeneratedBoolColumn _orderedState;
  @override
  GeneratedBoolColumn get orderedState =>
      _orderedState ??= _constructOrderedState();
  GeneratedBoolColumn _constructOrderedState() {
    return GeneratedBoolColumn(
      'ordered_state',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isOnlineMeta = const VerificationMeta('isOnline');
  GeneratedIntColumn _isOnline;
  @override
  GeneratedIntColumn get isOnline => _isOnline ??= _constructIsOnline();
  GeneratedIntColumn _constructIsOnline() {
    return GeneratedIntColumn(
      'is_online',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        id,
        eventName,
        siteName,
        siteAddress,
        eventType,
        startDate,
        endDate,
        description,
        coverPathFile,
        coverRepoId,
        contactPhone,
        contactEmail,
        organizersName,
        organizersInfo,
        sendReminder,
        reminderDays,
        branchId,
        companyId,
        startedState,
        orderedState,
        isOnline
      ];
  @override
  $EventTicketEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_event_ticket';
  @override
  final String actualTableName = 'cip_today_event_ticket';
  @override
  VerificationContext validateIntegrity(Insertable<EventTicketEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('event_name')) {
      context.handle(_eventNameMeta,
          eventName.isAcceptableOrUnknown(data['event_name'], _eventNameMeta));
    }
    if (data.containsKey('site_name')) {
      context.handle(_siteNameMeta,
          siteName.isAcceptableOrUnknown(data['site_name'], _siteNameMeta));
    }
    if (data.containsKey('site_address')) {
      context.handle(
          _siteAddressMeta,
          siteAddress.isAcceptableOrUnknown(
              data['site_address'], _siteAddressMeta));
    }
    if (data.containsKey('event_type')) {
      context.handle(_eventTypeMeta,
          eventType.isAcceptableOrUnknown(data['event_type'], _eventTypeMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date'], _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date'], _endDateMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('cover_path_file')) {
      context.handle(
          _coverPathFileMeta,
          coverPathFile.isAcceptableOrUnknown(
              data['cover_path_file'], _coverPathFileMeta));
    }
    if (data.containsKey('cover_repo_id')) {
      context.handle(
          _coverRepoIdMeta,
          coverRepoId.isAcceptableOrUnknown(
              data['cover_repo_id'], _coverRepoIdMeta));
    }
    if (data.containsKey('contact_phone')) {
      context.handle(
          _contactPhoneMeta,
          contactPhone.isAcceptableOrUnknown(
              data['contact_phone'], _contactPhoneMeta));
    }
    if (data.containsKey('contact_email')) {
      context.handle(
          _contactEmailMeta,
          contactEmail.isAcceptableOrUnknown(
              data['contact_email'], _contactEmailMeta));
    }
    if (data.containsKey('organizers_name')) {
      context.handle(
          _organizersNameMeta,
          organizersName.isAcceptableOrUnknown(
              data['organizers_name'], _organizersNameMeta));
    }
    if (data.containsKey('organizers_info')) {
      context.handle(
          _organizersInfoMeta,
          organizersInfo.isAcceptableOrUnknown(
              data['organizers_info'], _organizersInfoMeta));
    }
    if (data.containsKey('send_reminder')) {
      context.handle(
          _sendReminderMeta,
          sendReminder.isAcceptableOrUnknown(
              data['send_reminder'], _sendReminderMeta));
    }
    if (data.containsKey('reminder_days')) {
      context.handle(
          _reminderDaysMeta,
          reminderDays.isAcceptableOrUnknown(
              data['reminder_days'], _reminderDaysMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id'], _branchIdMeta));
    }
    if (data.containsKey('company_id')) {
      context.handle(_companyIdMeta,
          companyId.isAcceptableOrUnknown(data['company_id'], _companyIdMeta));
    }
    if (data.containsKey('started_state')) {
      context.handle(
          _startedStateMeta,
          startedState.isAcceptableOrUnknown(
              data['started_state'], _startedStateMeta));
    }
    if (data.containsKey('ordered_state')) {
      context.handle(
          _orderedStateMeta,
          orderedState.isAcceptableOrUnknown(
              data['ordered_state'], _orderedStateMeta));
    }
    if (data.containsKey('is_online')) {
      context.handle(_isOnlineMeta,
          isOnline.isAcceptableOrUnknown(data['is_online'], _isOnlineMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EventTicketEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return EventTicketEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $EventTicketEntityTable createAlias(String alias) {
    return $EventTicketEntityTable(_db, alias);
  }
}

class ETBookingConfigInforAllEntry extends DataClass
    implements Insertable<ETBookingConfigInforAllEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final double id;
  final double idBooking;
  final double eventId;
  final String bookingLink;
  final String emailTemplateContent;
  final String bookingField;
  ETBookingConfigInforAllEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      this.id,
      @required this.idBooking,
      this.eventId,
      this.bookingLink,
      this.emailTemplateContent,
      this.bookingField});
  factory ETBookingConfigInforAllEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return ETBookingConfigInforAllEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      id: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idBooking: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}id_booking']),
      eventId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}event_id']),
      bookingLink: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}booking_link']),
      emailTemplateContent: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}email_template_content']),
      bookingField: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}booking_field']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<double>(id);
    }
    if (!nullToAbsent || idBooking != null) {
      map['id_booking'] = Variable<double>(idBooking);
    }
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<double>(eventId);
    }
    if (!nullToAbsent || bookingLink != null) {
      map['booking_link'] = Variable<String>(bookingLink);
    }
    if (!nullToAbsent || emailTemplateContent != null) {
      map['email_template_content'] = Variable<String>(emailTemplateContent);
    }
    if (!nullToAbsent || bookingField != null) {
      map['booking_field'] = Variable<String>(bookingField);
    }
    return map;
  }

  ETBookingConfigInforEntityCompanion toCompanion(bool nullToAbsent) {
    return ETBookingConfigInforEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idBooking: idBooking == null && nullToAbsent
          ? const Value.absent()
          : Value(idBooking),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      bookingLink: bookingLink == null && nullToAbsent
          ? const Value.absent()
          : Value(bookingLink),
      emailTemplateContent: emailTemplateContent == null && nullToAbsent
          ? const Value.absent()
          : Value(emailTemplateContent),
      bookingField: bookingField == null && nullToAbsent
          ? const Value.absent()
          : Value(bookingField),
    );
  }

  factory ETBookingConfigInforAllEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ETBookingConfigInforAllEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      id: serializer.fromJson<double>(json['id']),
      idBooking: serializer.fromJson<double>(json['idBooking']),
      eventId: serializer.fromJson<double>(json['eventId']),
      bookingLink: serializer.fromJson<String>(json['bookingLink']),
      emailTemplateContent:
          serializer.fromJson<String>(json['emailTemplateContent']),
      bookingField: serializer.fromJson<String>(json['bookingField']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'id': serializer.toJson<double>(id),
      'idBooking': serializer.toJson<double>(idBooking),
      'eventId': serializer.toJson<double>(eventId),
      'bookingLink': serializer.toJson<String>(bookingLink),
      'emailTemplateContent': serializer.toJson<String>(emailTemplateContent),
      'bookingField': serializer.toJson<String>(bookingField),
    };
  }

  ETBookingConfigInforAllEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          double id,
          double idBooking,
          double eventId,
          String bookingLink,
          String emailTemplateContent,
          String bookingField}) =>
      ETBookingConfigInforAllEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        id: id ?? this.id,
        idBooking: idBooking ?? this.idBooking,
        eventId: eventId ?? this.eventId,
        bookingLink: bookingLink ?? this.bookingLink,
        emailTemplateContent: emailTemplateContent ?? this.emailTemplateContent,
        bookingField: bookingField ?? this.bookingField,
      );
  @override
  String toString() {
    return (StringBuffer('ETBookingConfigInforAllEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('idBooking: $idBooking, ')
          ..write('eventId: $eventId, ')
          ..write('bookingLink: $bookingLink, ')
          ..write('emailTemplateContent: $emailTemplateContent, ')
          ..write('bookingField: $bookingField')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              id.hashCode,
                              $mrjc(
                                  idBooking.hashCode,
                                  $mrjc(
                                      eventId.hashCode,
                                      $mrjc(
                                          bookingLink.hashCode,
                                          $mrjc(emailTemplateContent.hashCode,
                                              bookingField.hashCode))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ETBookingConfigInforAllEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.id == this.id &&
          other.idBooking == this.idBooking &&
          other.eventId == this.eventId &&
          other.bookingLink == this.bookingLink &&
          other.emailTemplateContent == this.emailTemplateContent &&
          other.bookingField == this.bookingField);
}

class ETBookingConfigInforEntityCompanion
    extends UpdateCompanion<ETBookingConfigInforAllEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<double> id;
  final Value<double> idBooking;
  final Value<double> eventId;
  final Value<String> bookingLink;
  final Value<String> emailTemplateContent;
  final Value<String> bookingField;
  const ETBookingConfigInforEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.idBooking = const Value.absent(),
    this.eventId = const Value.absent(),
    this.bookingLink = const Value.absent(),
    this.emailTemplateContent = const Value.absent(),
    this.bookingField = const Value.absent(),
  });
  ETBookingConfigInforEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    @required double idBooking,
    this.eventId = const Value.absent(),
    this.bookingLink = const Value.absent(),
    this.emailTemplateContent = const Value.absent(),
    this.bookingField = const Value.absent(),
  }) : idBooking = Value(idBooking);
  static Insertable<ETBookingConfigInforAllEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<double> id,
    Expression<double> idBooking,
    Expression<double> eventId,
    Expression<String> bookingLink,
    Expression<String> emailTemplateContent,
    Expression<String> bookingField,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (id != null) 'id': id,
      if (idBooking != null) 'id_booking': idBooking,
      if (eventId != null) 'event_id': eventId,
      if (bookingLink != null) 'booking_link': bookingLink,
      if (emailTemplateContent != null)
        'email_template_content': emailTemplateContent,
      if (bookingField != null) 'booking_field': bookingField,
    });
  }

  ETBookingConfigInforEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<double> id,
      Value<double> idBooking,
      Value<double> eventId,
      Value<String> bookingLink,
      Value<String> emailTemplateContent,
      Value<String> bookingField}) {
    return ETBookingConfigInforEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      id: id ?? this.id,
      idBooking: idBooking ?? this.idBooking,
      eventId: eventId ?? this.eventId,
      bookingLink: bookingLink ?? this.bookingLink,
      emailTemplateContent: emailTemplateContent ?? this.emailTemplateContent,
      bookingField: bookingField ?? this.bookingField,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (id.present) {
      map['id'] = Variable<double>(id.value);
    }
    if (idBooking.present) {
      map['id_booking'] = Variable<double>(idBooking.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<double>(eventId.value);
    }
    if (bookingLink.present) {
      map['booking_link'] = Variable<String>(bookingLink.value);
    }
    if (emailTemplateContent.present) {
      map['email_template_content'] =
          Variable<String>(emailTemplateContent.value);
    }
    if (bookingField.present) {
      map['booking_field'] = Variable<String>(bookingField.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ETBookingConfigInforEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('idBooking: $idBooking, ')
          ..write('eventId: $eventId, ')
          ..write('bookingLink: $bookingLink, ')
          ..write('emailTemplateContent: $emailTemplateContent, ')
          ..write('bookingField: $bookingField')
          ..write(')'))
        .toString();
  }
}

class $ETBookingConfigInforEntityTable extends ETBookingConfigInforEntity
    with
        TableInfo<$ETBookingConfigInforEntityTable,
            ETBookingConfigInforAllEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $ETBookingConfigInforEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedRealColumn _id;
  @override
  GeneratedRealColumn get id => _id ??= _constructId();
  GeneratedRealColumn _constructId() {
    return GeneratedRealColumn(
      'id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idBookingMeta = const VerificationMeta('idBooking');
  GeneratedRealColumn _idBooking;
  @override
  GeneratedRealColumn get idBooking => _idBooking ??= _constructIdBooking();
  GeneratedRealColumn _constructIdBooking() {
    return GeneratedRealColumn(
      'id_booking',
      $tableName,
      false,
    );
  }

  final VerificationMeta _eventIdMeta = const VerificationMeta('eventId');
  GeneratedRealColumn _eventId;
  @override
  GeneratedRealColumn get eventId => _eventId ??= _constructEventId();
  GeneratedRealColumn _constructEventId() {
    return GeneratedRealColumn(
      'event_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bookingLinkMeta =
      const VerificationMeta('bookingLink');
  GeneratedTextColumn _bookingLink;
  @override
  GeneratedTextColumn get bookingLink =>
      _bookingLink ??= _constructBookingLink();
  GeneratedTextColumn _constructBookingLink() {
    return GeneratedTextColumn(
      'booking_link',
      $tableName,
      true,
    );
  }

  final VerificationMeta _emailTemplateContentMeta =
      const VerificationMeta('emailTemplateContent');
  GeneratedTextColumn _emailTemplateContent;
  @override
  GeneratedTextColumn get emailTemplateContent =>
      _emailTemplateContent ??= _constructEmailTemplateContent();
  GeneratedTextColumn _constructEmailTemplateContent() {
    return GeneratedTextColumn(
      'email_template_content',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bookingFieldMeta =
      const VerificationMeta('bookingField');
  GeneratedTextColumn _bookingField;
  @override
  GeneratedTextColumn get bookingField =>
      _bookingField ??= _constructBookingField();
  GeneratedTextColumn _constructBookingField() {
    return GeneratedTextColumn(
      'booking_field',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        id,
        idBooking,
        eventId,
        bookingLink,
        emailTemplateContent,
        bookingField
      ];
  @override
  $ETBookingConfigInforEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_et_booking';
  @override
  final String actualTableName = 'cip_today_et_booking';
  @override
  VerificationContext validateIntegrity(
      Insertable<ETBookingConfigInforAllEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_booking')) {
      context.handle(_idBookingMeta,
          idBooking.isAcceptableOrUnknown(data['id_booking'], _idBookingMeta));
    } else if (isInserting) {
      context.missing(_idBookingMeta);
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id'], _eventIdMeta));
    }
    if (data.containsKey('booking_link')) {
      context.handle(
          _bookingLinkMeta,
          bookingLink.isAcceptableOrUnknown(
              data['booking_link'], _bookingLinkMeta));
    }
    if (data.containsKey('email_template_content')) {
      context.handle(
          _emailTemplateContentMeta,
          emailTemplateContent.isAcceptableOrUnknown(
              data['email_template_content'], _emailTemplateContentMeta));
    }
    if (data.containsKey('booking_field')) {
      context.handle(
          _bookingFieldMeta,
          bookingField.isAcceptableOrUnknown(
              data['booking_field'], _bookingFieldMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ETBookingConfigInforAllEntry map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ETBookingConfigInforAllEntry.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  $ETBookingConfigInforEntityTable createAlias(String alias) {
    return $ETBookingConfigInforEntityTable(_db, alias);
  }
}

class ETOderDetailInfoEntry extends DataClass
    implements Insertable<ETOderDetailInfoEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final double id;
  final double orderId;
  final double eventId;
  final double ticketId;
  final double quantity;
  final double amount;
  final double discountId;
  final String inviteCode;
  final String status;
  final String ticketName;
  final double ticketPrice;
  final double ticketIsFree;
  final double ticketQuantity;
  final String ticketStartDate;
  final String ticketEndDate;
  ETOderDetailInfoEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      this.id,
      this.orderId,
      this.eventId,
      this.ticketId,
      this.quantity,
      this.amount,
      this.discountId,
      this.inviteCode,
      this.status,
      this.ticketName,
      this.ticketPrice,
      this.ticketIsFree,
      this.ticketQuantity,
      this.ticketStartDate,
      this.ticketEndDate});
  factory ETOderDetailInfoEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return ETOderDetailInfoEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      id: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      orderId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}order_id']),
      eventId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}event_id']),
      ticketId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}ticket_id']),
      quantity: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
      amount:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      discountId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}discount_id']),
      inviteCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}invite_code']),
      status:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      ticketName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}ticket_name']),
      ticketPrice: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}ticket_price']),
      ticketIsFree: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}ticket_is_free']),
      ticketQuantity: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}ticket_quantity']),
      ticketStartDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}ticket_start_date']),
      ticketEndDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}ticket_end_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<double>(id);
    }
    if (!nullToAbsent || orderId != null) {
      map['order_id'] = Variable<double>(orderId);
    }
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<double>(eventId);
    }
    if (!nullToAbsent || ticketId != null) {
      map['ticket_id'] = Variable<double>(ticketId);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<double>(quantity);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    if (!nullToAbsent || discountId != null) {
      map['discount_id'] = Variable<double>(discountId);
    }
    if (!nullToAbsent || inviteCode != null) {
      map['invite_code'] = Variable<String>(inviteCode);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || ticketName != null) {
      map['ticket_name'] = Variable<String>(ticketName);
    }
    if (!nullToAbsent || ticketPrice != null) {
      map['ticket_price'] = Variable<double>(ticketPrice);
    }
    if (!nullToAbsent || ticketIsFree != null) {
      map['ticket_is_free'] = Variable<double>(ticketIsFree);
    }
    if (!nullToAbsent || ticketQuantity != null) {
      map['ticket_quantity'] = Variable<double>(ticketQuantity);
    }
    if (!nullToAbsent || ticketStartDate != null) {
      map['ticket_start_date'] = Variable<String>(ticketStartDate);
    }
    if (!nullToAbsent || ticketEndDate != null) {
      map['ticket_end_date'] = Variable<String>(ticketEndDate);
    }
    return map;
  }

  ETOrderDetailInfoEntityCompanion toCompanion(bool nullToAbsent) {
    return ETOrderDetailInfoEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      orderId: orderId == null && nullToAbsent
          ? const Value.absent()
          : Value(orderId),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      ticketId: ticketId == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketId),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      discountId: discountId == null && nullToAbsent
          ? const Value.absent()
          : Value(discountId),
      inviteCode: inviteCode == null && nullToAbsent
          ? const Value.absent()
          : Value(inviteCode),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      ticketName: ticketName == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketName),
      ticketPrice: ticketPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketPrice),
      ticketIsFree: ticketIsFree == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketIsFree),
      ticketQuantity: ticketQuantity == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketQuantity),
      ticketStartDate: ticketStartDate == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketStartDate),
      ticketEndDate: ticketEndDate == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketEndDate),
    );
  }

  factory ETOderDetailInfoEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ETOderDetailInfoEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      id: serializer.fromJson<double>(json['id']),
      orderId: serializer.fromJson<double>(json['orderId']),
      eventId: serializer.fromJson<double>(json['eventId']),
      ticketId: serializer.fromJson<double>(json['ticketId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      amount: serializer.fromJson<double>(json['amount']),
      discountId: serializer.fromJson<double>(json['discountId']),
      inviteCode: serializer.fromJson<String>(json['inviteCode']),
      status: serializer.fromJson<String>(json['status']),
      ticketName: serializer.fromJson<String>(json['ticketName']),
      ticketPrice: serializer.fromJson<double>(json['ticketPrice']),
      ticketIsFree: serializer.fromJson<double>(json['ticketIsFree']),
      ticketQuantity: serializer.fromJson<double>(json['ticketQuantity']),
      ticketStartDate: serializer.fromJson<String>(json['ticketStartDate']),
      ticketEndDate: serializer.fromJson<String>(json['ticketEndDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'id': serializer.toJson<double>(id),
      'orderId': serializer.toJson<double>(orderId),
      'eventId': serializer.toJson<double>(eventId),
      'ticketId': serializer.toJson<double>(ticketId),
      'quantity': serializer.toJson<double>(quantity),
      'amount': serializer.toJson<double>(amount),
      'discountId': serializer.toJson<double>(discountId),
      'inviteCode': serializer.toJson<String>(inviteCode),
      'status': serializer.toJson<String>(status),
      'ticketName': serializer.toJson<String>(ticketName),
      'ticketPrice': serializer.toJson<double>(ticketPrice),
      'ticketIsFree': serializer.toJson<double>(ticketIsFree),
      'ticketQuantity': serializer.toJson<double>(ticketQuantity),
      'ticketStartDate': serializer.toJson<String>(ticketStartDate),
      'ticketEndDate': serializer.toJson<String>(ticketEndDate),
    };
  }

  ETOderDetailInfoEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          double id,
          double orderId,
          double eventId,
          double ticketId,
          double quantity,
          double amount,
          double discountId,
          String inviteCode,
          String status,
          String ticketName,
          double ticketPrice,
          double ticketIsFree,
          double ticketQuantity,
          String ticketStartDate,
          String ticketEndDate}) =>
      ETOderDetailInfoEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        id: id ?? this.id,
        orderId: orderId ?? this.orderId,
        eventId: eventId ?? this.eventId,
        ticketId: ticketId ?? this.ticketId,
        quantity: quantity ?? this.quantity,
        amount: amount ?? this.amount,
        discountId: discountId ?? this.discountId,
        inviteCode: inviteCode ?? this.inviteCode,
        status: status ?? this.status,
        ticketName: ticketName ?? this.ticketName,
        ticketPrice: ticketPrice ?? this.ticketPrice,
        ticketIsFree: ticketIsFree ?? this.ticketIsFree,
        ticketQuantity: ticketQuantity ?? this.ticketQuantity,
        ticketStartDate: ticketStartDate ?? this.ticketStartDate,
        ticketEndDate: ticketEndDate ?? this.ticketEndDate,
      );
  @override
  String toString() {
    return (StringBuffer('ETOderDetailInfoEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('eventId: $eventId, ')
          ..write('ticketId: $ticketId, ')
          ..write('quantity: $quantity, ')
          ..write('amount: $amount, ')
          ..write('discountId: $discountId, ')
          ..write('inviteCode: $inviteCode, ')
          ..write('status: $status, ')
          ..write('ticketName: $ticketName, ')
          ..write('ticketPrice: $ticketPrice, ')
          ..write('ticketIsFree: $ticketIsFree, ')
          ..write('ticketQuantity: $ticketQuantity, ')
          ..write('ticketStartDate: $ticketStartDate, ')
          ..write('ticketEndDate: $ticketEndDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              id.hashCode,
                              $mrjc(
                                  orderId.hashCode,
                                  $mrjc(
                                      eventId.hashCode,
                                      $mrjc(
                                          ticketId.hashCode,
                                          $mrjc(
                                              quantity.hashCode,
                                              $mrjc(
                                                  amount.hashCode,
                                                  $mrjc(
                                                      discountId.hashCode,
                                                      $mrjc(
                                                          inviteCode.hashCode,
                                                          $mrjc(
                                                              status.hashCode,
                                                              $mrjc(
                                                                  ticketName
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      ticketPrice
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          ticketIsFree
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              ticketQuantity.hashCode,
                                                                              $mrjc(ticketStartDate.hashCode, ticketEndDate.hashCode)))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ETOderDetailInfoEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.id == this.id &&
          other.orderId == this.orderId &&
          other.eventId == this.eventId &&
          other.ticketId == this.ticketId &&
          other.quantity == this.quantity &&
          other.amount == this.amount &&
          other.discountId == this.discountId &&
          other.inviteCode == this.inviteCode &&
          other.status == this.status &&
          other.ticketName == this.ticketName &&
          other.ticketPrice == this.ticketPrice &&
          other.ticketIsFree == this.ticketIsFree &&
          other.ticketQuantity == this.ticketQuantity &&
          other.ticketStartDate == this.ticketStartDate &&
          other.ticketEndDate == this.ticketEndDate);
}

class ETOrderDetailInfoEntityCompanion
    extends UpdateCompanion<ETOderDetailInfoEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<double> id;
  final Value<double> orderId;
  final Value<double> eventId;
  final Value<double> ticketId;
  final Value<double> quantity;
  final Value<double> amount;
  final Value<double> discountId;
  final Value<String> inviteCode;
  final Value<String> status;
  final Value<String> ticketName;
  final Value<double> ticketPrice;
  final Value<double> ticketIsFree;
  final Value<double> ticketQuantity;
  final Value<String> ticketStartDate;
  final Value<String> ticketEndDate;
  const ETOrderDetailInfoEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.eventId = const Value.absent(),
    this.ticketId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.amount = const Value.absent(),
    this.discountId = const Value.absent(),
    this.inviteCode = const Value.absent(),
    this.status = const Value.absent(),
    this.ticketName = const Value.absent(),
    this.ticketPrice = const Value.absent(),
    this.ticketIsFree = const Value.absent(),
    this.ticketQuantity = const Value.absent(),
    this.ticketStartDate = const Value.absent(),
    this.ticketEndDate = const Value.absent(),
  });
  ETOrderDetailInfoEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.eventId = const Value.absent(),
    this.ticketId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.amount = const Value.absent(),
    this.discountId = const Value.absent(),
    this.inviteCode = const Value.absent(),
    this.status = const Value.absent(),
    this.ticketName = const Value.absent(),
    this.ticketPrice = const Value.absent(),
    this.ticketIsFree = const Value.absent(),
    this.ticketQuantity = const Value.absent(),
    this.ticketStartDate = const Value.absent(),
    this.ticketEndDate = const Value.absent(),
  });
  static Insertable<ETOderDetailInfoEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<double> id,
    Expression<double> orderId,
    Expression<double> eventId,
    Expression<double> ticketId,
    Expression<double> quantity,
    Expression<double> amount,
    Expression<double> discountId,
    Expression<String> inviteCode,
    Expression<String> status,
    Expression<String> ticketName,
    Expression<double> ticketPrice,
    Expression<double> ticketIsFree,
    Expression<double> ticketQuantity,
    Expression<String> ticketStartDate,
    Expression<String> ticketEndDate,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (id != null) 'id': id,
      if (orderId != null) 'order_id': orderId,
      if (eventId != null) 'event_id': eventId,
      if (ticketId != null) 'ticket_id': ticketId,
      if (quantity != null) 'quantity': quantity,
      if (amount != null) 'amount': amount,
      if (discountId != null) 'discount_id': discountId,
      if (inviteCode != null) 'invite_code': inviteCode,
      if (status != null) 'status': status,
      if (ticketName != null) 'ticket_name': ticketName,
      if (ticketPrice != null) 'ticket_price': ticketPrice,
      if (ticketIsFree != null) 'ticket_is_free': ticketIsFree,
      if (ticketQuantity != null) 'ticket_quantity': ticketQuantity,
      if (ticketStartDate != null) 'ticket_start_date': ticketStartDate,
      if (ticketEndDate != null) 'ticket_end_date': ticketEndDate,
    });
  }

  ETOrderDetailInfoEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<double> id,
      Value<double> orderId,
      Value<double> eventId,
      Value<double> ticketId,
      Value<double> quantity,
      Value<double> amount,
      Value<double> discountId,
      Value<String> inviteCode,
      Value<String> status,
      Value<String> ticketName,
      Value<double> ticketPrice,
      Value<double> ticketIsFree,
      Value<double> ticketQuantity,
      Value<String> ticketStartDate,
      Value<String> ticketEndDate}) {
    return ETOrderDetailInfoEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      eventId: eventId ?? this.eventId,
      ticketId: ticketId ?? this.ticketId,
      quantity: quantity ?? this.quantity,
      amount: amount ?? this.amount,
      discountId: discountId ?? this.discountId,
      inviteCode: inviteCode ?? this.inviteCode,
      status: status ?? this.status,
      ticketName: ticketName ?? this.ticketName,
      ticketPrice: ticketPrice ?? this.ticketPrice,
      ticketIsFree: ticketIsFree ?? this.ticketIsFree,
      ticketQuantity: ticketQuantity ?? this.ticketQuantity,
      ticketStartDate: ticketStartDate ?? this.ticketStartDate,
      ticketEndDate: ticketEndDate ?? this.ticketEndDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (id.present) {
      map['id'] = Variable<double>(id.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<double>(orderId.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<double>(eventId.value);
    }
    if (ticketId.present) {
      map['ticket_id'] = Variable<double>(ticketId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (discountId.present) {
      map['discount_id'] = Variable<double>(discountId.value);
    }
    if (inviteCode.present) {
      map['invite_code'] = Variable<String>(inviteCode.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (ticketName.present) {
      map['ticket_name'] = Variable<String>(ticketName.value);
    }
    if (ticketPrice.present) {
      map['ticket_price'] = Variable<double>(ticketPrice.value);
    }
    if (ticketIsFree.present) {
      map['ticket_is_free'] = Variable<double>(ticketIsFree.value);
    }
    if (ticketQuantity.present) {
      map['ticket_quantity'] = Variable<double>(ticketQuantity.value);
    }
    if (ticketStartDate.present) {
      map['ticket_start_date'] = Variable<String>(ticketStartDate.value);
    }
    if (ticketEndDate.present) {
      map['ticket_end_date'] = Variable<String>(ticketEndDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ETOrderDetailInfoEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('eventId: $eventId, ')
          ..write('ticketId: $ticketId, ')
          ..write('quantity: $quantity, ')
          ..write('amount: $amount, ')
          ..write('discountId: $discountId, ')
          ..write('inviteCode: $inviteCode, ')
          ..write('status: $status, ')
          ..write('ticketName: $ticketName, ')
          ..write('ticketPrice: $ticketPrice, ')
          ..write('ticketIsFree: $ticketIsFree, ')
          ..write('ticketQuantity: $ticketQuantity, ')
          ..write('ticketStartDate: $ticketStartDate, ')
          ..write('ticketEndDate: $ticketEndDate')
          ..write(')'))
        .toString();
  }
}

class $ETOrderDetailInfoEntityTable extends ETOrderDetailInfoEntity
    with TableInfo<$ETOrderDetailInfoEntityTable, ETOderDetailInfoEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $ETOrderDetailInfoEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedRealColumn _id;
  @override
  GeneratedRealColumn get id => _id ??= _constructId();
  GeneratedRealColumn _constructId() {
    return GeneratedRealColumn(
      'id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _orderIdMeta = const VerificationMeta('orderId');
  GeneratedRealColumn _orderId;
  @override
  GeneratedRealColumn get orderId => _orderId ??= _constructOrderId();
  GeneratedRealColumn _constructOrderId() {
    return GeneratedRealColumn(
      'order_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _eventIdMeta = const VerificationMeta('eventId');
  GeneratedRealColumn _eventId;
  @override
  GeneratedRealColumn get eventId => _eventId ??= _constructEventId();
  GeneratedRealColumn _constructEventId() {
    return GeneratedRealColumn(
      'event_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ticketIdMeta = const VerificationMeta('ticketId');
  GeneratedRealColumn _ticketId;
  @override
  GeneratedRealColumn get ticketId => _ticketId ??= _constructTicketId();
  GeneratedRealColumn _constructTicketId() {
    return GeneratedRealColumn(
      'ticket_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  GeneratedRealColumn _quantity;
  @override
  GeneratedRealColumn get quantity => _quantity ??= _constructQuantity();
  GeneratedRealColumn _constructQuantity() {
    return GeneratedRealColumn(
      'quantity',
      $tableName,
      true,
    );
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  GeneratedRealColumn _amount;
  @override
  GeneratedRealColumn get amount => _amount ??= _constructAmount();
  GeneratedRealColumn _constructAmount() {
    return GeneratedRealColumn(
      'amount',
      $tableName,
      true,
    );
  }

  final VerificationMeta _discountIdMeta = const VerificationMeta('discountId');
  GeneratedRealColumn _discountId;
  @override
  GeneratedRealColumn get discountId => _discountId ??= _constructDiscountId();
  GeneratedRealColumn _constructDiscountId() {
    return GeneratedRealColumn(
      'discount_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _inviteCodeMeta = const VerificationMeta('inviteCode');
  GeneratedTextColumn _inviteCode;
  @override
  GeneratedTextColumn get inviteCode => _inviteCode ??= _constructInviteCode();
  GeneratedTextColumn _constructInviteCode() {
    return GeneratedTextColumn(
      'invite_code',
      $tableName,
      true,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedTextColumn _status;
  @override
  GeneratedTextColumn get status => _status ??= _constructStatus();
  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn(
      'status',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ticketNameMeta = const VerificationMeta('ticketName');
  GeneratedTextColumn _ticketName;
  @override
  GeneratedTextColumn get ticketName => _ticketName ??= _constructTicketName();
  GeneratedTextColumn _constructTicketName() {
    return GeneratedTextColumn(
      'ticket_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ticketPriceMeta =
      const VerificationMeta('ticketPrice');
  GeneratedRealColumn _ticketPrice;
  @override
  GeneratedRealColumn get ticketPrice =>
      _ticketPrice ??= _constructTicketPrice();
  GeneratedRealColumn _constructTicketPrice() {
    return GeneratedRealColumn(
      'ticket_price',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ticketIsFreeMeta =
      const VerificationMeta('ticketIsFree');
  GeneratedRealColumn _ticketIsFree;
  @override
  GeneratedRealColumn get ticketIsFree =>
      _ticketIsFree ??= _constructTicketIsFree();
  GeneratedRealColumn _constructTicketIsFree() {
    return GeneratedRealColumn(
      'ticket_is_free',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ticketQuantityMeta =
      const VerificationMeta('ticketQuantity');
  GeneratedRealColumn _ticketQuantity;
  @override
  GeneratedRealColumn get ticketQuantity =>
      _ticketQuantity ??= _constructTicketQuantity();
  GeneratedRealColumn _constructTicketQuantity() {
    return GeneratedRealColumn(
      'ticket_quantity',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ticketStartDateMeta =
      const VerificationMeta('ticketStartDate');
  GeneratedTextColumn _ticketStartDate;
  @override
  GeneratedTextColumn get ticketStartDate =>
      _ticketStartDate ??= _constructTicketStartDate();
  GeneratedTextColumn _constructTicketStartDate() {
    return GeneratedTextColumn(
      'ticket_start_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ticketEndDateMeta =
      const VerificationMeta('ticketEndDate');
  GeneratedTextColumn _ticketEndDate;
  @override
  GeneratedTextColumn get ticketEndDate =>
      _ticketEndDate ??= _constructTicketEndDate();
  GeneratedTextColumn _constructTicketEndDate() {
    return GeneratedTextColumn(
      'ticket_end_date',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        id,
        orderId,
        eventId,
        ticketId,
        quantity,
        amount,
        discountId,
        inviteCode,
        status,
        ticketName,
        ticketPrice,
        ticketIsFree,
        ticketQuantity,
        ticketStartDate,
        ticketEndDate
      ];
  @override
  $ETOrderDetailInfoEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_et_order_detail';
  @override
  final String actualTableName = 'cip_today_et_order_detail';
  @override
  VerificationContext validateIntegrity(
      Insertable<ETOderDetailInfoEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id'], _orderIdMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id'], _eventIdMeta));
    }
    if (data.containsKey('ticket_id')) {
      context.handle(_ticketIdMeta,
          ticketId.isAcceptableOrUnknown(data['ticket_id'], _ticketIdMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity'], _quantityMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount'], _amountMeta));
    }
    if (data.containsKey('discount_id')) {
      context.handle(
          _discountIdMeta,
          discountId.isAcceptableOrUnknown(
              data['discount_id'], _discountIdMeta));
    }
    if (data.containsKey('invite_code')) {
      context.handle(
          _inviteCodeMeta,
          inviteCode.isAcceptableOrUnknown(
              data['invite_code'], _inviteCodeMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    }
    if (data.containsKey('ticket_name')) {
      context.handle(
          _ticketNameMeta,
          ticketName.isAcceptableOrUnknown(
              data['ticket_name'], _ticketNameMeta));
    }
    if (data.containsKey('ticket_price')) {
      context.handle(
          _ticketPriceMeta,
          ticketPrice.isAcceptableOrUnknown(
              data['ticket_price'], _ticketPriceMeta));
    }
    if (data.containsKey('ticket_is_free')) {
      context.handle(
          _ticketIsFreeMeta,
          ticketIsFree.isAcceptableOrUnknown(
              data['ticket_is_free'], _ticketIsFreeMeta));
    }
    if (data.containsKey('ticket_quantity')) {
      context.handle(
          _ticketQuantityMeta,
          ticketQuantity.isAcceptableOrUnknown(
              data['ticket_quantity'], _ticketQuantityMeta));
    }
    if (data.containsKey('ticket_start_date')) {
      context.handle(
          _ticketStartDateMeta,
          ticketStartDate.isAcceptableOrUnknown(
              data['ticket_start_date'], _ticketStartDateMeta));
    }
    if (data.containsKey('ticket_end_date')) {
      context.handle(
          _ticketEndDateMeta,
          ticketEndDate.isAcceptableOrUnknown(
              data['ticket_end_date'], _ticketEndDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ETOderDetailInfoEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ETOderDetailInfoEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ETOrderDetailInfoEntityTable createAlias(String alias) {
    return $ETOrderDetailInfoEntityTable(_db, alias);
  }
}

class ETOrderInfoEntry extends DataClass
    implements Insertable<ETOrderInfoEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final double id;
  final String orderNo;
  final double guestId;
  final double eventId;
  final String paymentType;
  final double totalAmount;
  final String status;
  final double quantity;
  final String guestName;
  final String guestPhone;
  final String guestEmail;
  final bool isPaidByOwn;
  ETOrderInfoEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      this.id,
      this.orderNo,
      this.guestId,
      this.eventId,
      this.paymentType,
      this.totalAmount,
      this.status,
      this.quantity,
      this.guestName,
      this.guestPhone,
      this.guestEmail,
      this.isPaidByOwn});
  factory ETOrderInfoEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    final boolType = db.typeSystem.forDartType<bool>();
    return ETOrderInfoEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      id: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      orderNo: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}order_no']),
      guestId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}guest_id']),
      eventId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}event_id']),
      paymentType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}payment_type']),
      totalAmount: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_amount']),
      status:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      quantity: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
      guestName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}guest_name']),
      guestPhone: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}guest_phone']),
      guestEmail: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}guest_email']),
      isPaidByOwn: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_paid_by_own']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<double>(id);
    }
    if (!nullToAbsent || orderNo != null) {
      map['order_no'] = Variable<String>(orderNo);
    }
    if (!nullToAbsent || guestId != null) {
      map['guest_id'] = Variable<double>(guestId);
    }
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<double>(eventId);
    }
    if (!nullToAbsent || paymentType != null) {
      map['payment_type'] = Variable<String>(paymentType);
    }
    if (!nullToAbsent || totalAmount != null) {
      map['total_amount'] = Variable<double>(totalAmount);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<double>(quantity);
    }
    if (!nullToAbsent || guestName != null) {
      map['guest_name'] = Variable<String>(guestName);
    }
    if (!nullToAbsent || guestPhone != null) {
      map['guest_phone'] = Variable<String>(guestPhone);
    }
    if (!nullToAbsent || guestEmail != null) {
      map['guest_email'] = Variable<String>(guestEmail);
    }
    if (!nullToAbsent || isPaidByOwn != null) {
      map['is_paid_by_own'] = Variable<bool>(isPaidByOwn);
    }
    return map;
  }

  ETOrderInfoEntityCompanion toCompanion(bool nullToAbsent) {
    return ETOrderInfoEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      orderNo: orderNo == null && nullToAbsent
          ? const Value.absent()
          : Value(orderNo),
      guestId: guestId == null && nullToAbsent
          ? const Value.absent()
          : Value(guestId),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      paymentType: paymentType == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentType),
      totalAmount: totalAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(totalAmount),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      guestName: guestName == null && nullToAbsent
          ? const Value.absent()
          : Value(guestName),
      guestPhone: guestPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(guestPhone),
      guestEmail: guestEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(guestEmail),
      isPaidByOwn: isPaidByOwn == null && nullToAbsent
          ? const Value.absent()
          : Value(isPaidByOwn),
    );
  }

  factory ETOrderInfoEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ETOrderInfoEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      id: serializer.fromJson<double>(json['id']),
      orderNo: serializer.fromJson<String>(json['orderNo']),
      guestId: serializer.fromJson<double>(json['guestId']),
      eventId: serializer.fromJson<double>(json['eventId']),
      paymentType: serializer.fromJson<String>(json['paymentType']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      status: serializer.fromJson<String>(json['status']),
      quantity: serializer.fromJson<double>(json['quantity']),
      guestName: serializer.fromJson<String>(json['guestName']),
      guestPhone: serializer.fromJson<String>(json['guestPhone']),
      guestEmail: serializer.fromJson<String>(json['guestEmail']),
      isPaidByOwn: serializer.fromJson<bool>(json['isPaidByOwn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'id': serializer.toJson<double>(id),
      'orderNo': serializer.toJson<String>(orderNo),
      'guestId': serializer.toJson<double>(guestId),
      'eventId': serializer.toJson<double>(eventId),
      'paymentType': serializer.toJson<String>(paymentType),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'status': serializer.toJson<String>(status),
      'quantity': serializer.toJson<double>(quantity),
      'guestName': serializer.toJson<String>(guestName),
      'guestPhone': serializer.toJson<String>(guestPhone),
      'guestEmail': serializer.toJson<String>(guestEmail),
      'isPaidByOwn': serializer.toJson<bool>(isPaidByOwn),
    };
  }

  ETOrderInfoEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          double id,
          String orderNo,
          double guestId,
          double eventId,
          String paymentType,
          double totalAmount,
          String status,
          double quantity,
          String guestName,
          String guestPhone,
          String guestEmail,
          bool isPaidByOwn}) =>
      ETOrderInfoEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        id: id ?? this.id,
        orderNo: orderNo ?? this.orderNo,
        guestId: guestId ?? this.guestId,
        eventId: eventId ?? this.eventId,
        paymentType: paymentType ?? this.paymentType,
        totalAmount: totalAmount ?? this.totalAmount,
        status: status ?? this.status,
        quantity: quantity ?? this.quantity,
        guestName: guestName ?? this.guestName,
        guestPhone: guestPhone ?? this.guestPhone,
        guestEmail: guestEmail ?? this.guestEmail,
        isPaidByOwn: isPaidByOwn ?? this.isPaidByOwn,
      );
  @override
  String toString() {
    return (StringBuffer('ETOrderInfoEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('orderNo: $orderNo, ')
          ..write('guestId: $guestId, ')
          ..write('eventId: $eventId, ')
          ..write('paymentType: $paymentType, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('status: $status, ')
          ..write('quantity: $quantity, ')
          ..write('guestName: $guestName, ')
          ..write('guestPhone: $guestPhone, ')
          ..write('guestEmail: $guestEmail, ')
          ..write('isPaidByOwn: $isPaidByOwn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              id.hashCode,
                              $mrjc(
                                  orderNo.hashCode,
                                  $mrjc(
                                      guestId.hashCode,
                                      $mrjc(
                                          eventId.hashCode,
                                          $mrjc(
                                              paymentType.hashCode,
                                              $mrjc(
                                                  totalAmount.hashCode,
                                                  $mrjc(
                                                      status.hashCode,
                                                      $mrjc(
                                                          quantity.hashCode,
                                                          $mrjc(
                                                              guestName
                                                                  .hashCode,
                                                              $mrjc(
                                                                  guestPhone
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      guestEmail
                                                                          .hashCode,
                                                                      isPaidByOwn
                                                                          .hashCode))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ETOrderInfoEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.id == this.id &&
          other.orderNo == this.orderNo &&
          other.guestId == this.guestId &&
          other.eventId == this.eventId &&
          other.paymentType == this.paymentType &&
          other.totalAmount == this.totalAmount &&
          other.status == this.status &&
          other.quantity == this.quantity &&
          other.guestName == this.guestName &&
          other.guestPhone == this.guestPhone &&
          other.guestEmail == this.guestEmail &&
          other.isPaidByOwn == this.isPaidByOwn);
}

class ETOrderInfoEntityCompanion extends UpdateCompanion<ETOrderInfoEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<double> id;
  final Value<String> orderNo;
  final Value<double> guestId;
  final Value<double> eventId;
  final Value<String> paymentType;
  final Value<double> totalAmount;
  final Value<String> status;
  final Value<double> quantity;
  final Value<String> guestName;
  final Value<String> guestPhone;
  final Value<String> guestEmail;
  final Value<bool> isPaidByOwn;
  const ETOrderInfoEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.orderNo = const Value.absent(),
    this.guestId = const Value.absent(),
    this.eventId = const Value.absent(),
    this.paymentType = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.quantity = const Value.absent(),
    this.guestName = const Value.absent(),
    this.guestPhone = const Value.absent(),
    this.guestEmail = const Value.absent(),
    this.isPaidByOwn = const Value.absent(),
  });
  ETOrderInfoEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.orderNo = const Value.absent(),
    this.guestId = const Value.absent(),
    this.eventId = const Value.absent(),
    this.paymentType = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.quantity = const Value.absent(),
    this.guestName = const Value.absent(),
    this.guestPhone = const Value.absent(),
    this.guestEmail = const Value.absent(),
    this.isPaidByOwn = const Value.absent(),
  });
  static Insertable<ETOrderInfoEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<double> id,
    Expression<String> orderNo,
    Expression<double> guestId,
    Expression<double> eventId,
    Expression<String> paymentType,
    Expression<double> totalAmount,
    Expression<String> status,
    Expression<double> quantity,
    Expression<String> guestName,
    Expression<String> guestPhone,
    Expression<String> guestEmail,
    Expression<bool> isPaidByOwn,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (id != null) 'id': id,
      if (orderNo != null) 'order_no': orderNo,
      if (guestId != null) 'guest_id': guestId,
      if (eventId != null) 'event_id': eventId,
      if (paymentType != null) 'payment_type': paymentType,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (status != null) 'status': status,
      if (quantity != null) 'quantity': quantity,
      if (guestName != null) 'guest_name': guestName,
      if (guestPhone != null) 'guest_phone': guestPhone,
      if (guestEmail != null) 'guest_email': guestEmail,
      if (isPaidByOwn != null) 'is_paid_by_own': isPaidByOwn,
    });
  }

  ETOrderInfoEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<double> id,
      Value<String> orderNo,
      Value<double> guestId,
      Value<double> eventId,
      Value<String> paymentType,
      Value<double> totalAmount,
      Value<String> status,
      Value<double> quantity,
      Value<String> guestName,
      Value<String> guestPhone,
      Value<String> guestEmail,
      Value<bool> isPaidByOwn}) {
    return ETOrderInfoEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      id: id ?? this.id,
      orderNo: orderNo ?? this.orderNo,
      guestId: guestId ?? this.guestId,
      eventId: eventId ?? this.eventId,
      paymentType: paymentType ?? this.paymentType,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      quantity: quantity ?? this.quantity,
      guestName: guestName ?? this.guestName,
      guestPhone: guestPhone ?? this.guestPhone,
      guestEmail: guestEmail ?? this.guestEmail,
      isPaidByOwn: isPaidByOwn ?? this.isPaidByOwn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (id.present) {
      map['id'] = Variable<double>(id.value);
    }
    if (orderNo.present) {
      map['order_no'] = Variable<String>(orderNo.value);
    }
    if (guestId.present) {
      map['guest_id'] = Variable<double>(guestId.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<double>(eventId.value);
    }
    if (paymentType.present) {
      map['payment_type'] = Variable<String>(paymentType.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (guestName.present) {
      map['guest_name'] = Variable<String>(guestName.value);
    }
    if (guestPhone.present) {
      map['guest_phone'] = Variable<String>(guestPhone.value);
    }
    if (guestEmail.present) {
      map['guest_email'] = Variable<String>(guestEmail.value);
    }
    if (isPaidByOwn.present) {
      map['is_paid_by_own'] = Variable<bool>(isPaidByOwn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ETOrderInfoEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('orderNo: $orderNo, ')
          ..write('guestId: $guestId, ')
          ..write('eventId: $eventId, ')
          ..write('paymentType: $paymentType, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('status: $status, ')
          ..write('quantity: $quantity, ')
          ..write('guestName: $guestName, ')
          ..write('guestPhone: $guestPhone, ')
          ..write('guestEmail: $guestEmail, ')
          ..write('isPaidByOwn: $isPaidByOwn')
          ..write(')'))
        .toString();
  }
}

class $ETOrderInfoEntityTable extends ETOrderInfoEntity
    with TableInfo<$ETOrderInfoEntityTable, ETOrderInfoEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $ETOrderInfoEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedRealColumn _id;
  @override
  GeneratedRealColumn get id => _id ??= _constructId();
  GeneratedRealColumn _constructId() {
    return GeneratedRealColumn(
      'id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _orderNoMeta = const VerificationMeta('orderNo');
  GeneratedTextColumn _orderNo;
  @override
  GeneratedTextColumn get orderNo => _orderNo ??= _constructOrderNo();
  GeneratedTextColumn _constructOrderNo() {
    return GeneratedTextColumn(
      'order_no',
      $tableName,
      true,
    );
  }

  final VerificationMeta _guestIdMeta = const VerificationMeta('guestId');
  GeneratedRealColumn _guestId;
  @override
  GeneratedRealColumn get guestId => _guestId ??= _constructGuestId();
  GeneratedRealColumn _constructGuestId() {
    return GeneratedRealColumn(
      'guest_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _eventIdMeta = const VerificationMeta('eventId');
  GeneratedRealColumn _eventId;
  @override
  GeneratedRealColumn get eventId => _eventId ??= _constructEventId();
  GeneratedRealColumn _constructEventId() {
    return GeneratedRealColumn(
      'event_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _paymentTypeMeta =
      const VerificationMeta('paymentType');
  GeneratedTextColumn _paymentType;
  @override
  GeneratedTextColumn get paymentType =>
      _paymentType ??= _constructPaymentType();
  GeneratedTextColumn _constructPaymentType() {
    return GeneratedTextColumn(
      'payment_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _totalAmountMeta =
      const VerificationMeta('totalAmount');
  GeneratedRealColumn _totalAmount;
  @override
  GeneratedRealColumn get totalAmount =>
      _totalAmount ??= _constructTotalAmount();
  GeneratedRealColumn _constructTotalAmount() {
    return GeneratedRealColumn(
      'total_amount',
      $tableName,
      true,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedTextColumn _status;
  @override
  GeneratedTextColumn get status => _status ??= _constructStatus();
  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn(
      'status',
      $tableName,
      true,
    );
  }

  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  GeneratedRealColumn _quantity;
  @override
  GeneratedRealColumn get quantity => _quantity ??= _constructQuantity();
  GeneratedRealColumn _constructQuantity() {
    return GeneratedRealColumn(
      'quantity',
      $tableName,
      true,
    );
  }

  final VerificationMeta _guestNameMeta = const VerificationMeta('guestName');
  GeneratedTextColumn _guestName;
  @override
  GeneratedTextColumn get guestName => _guestName ??= _constructGuestName();
  GeneratedTextColumn _constructGuestName() {
    return GeneratedTextColumn(
      'guest_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _guestPhoneMeta = const VerificationMeta('guestPhone');
  GeneratedTextColumn _guestPhone;
  @override
  GeneratedTextColumn get guestPhone => _guestPhone ??= _constructGuestPhone();
  GeneratedTextColumn _constructGuestPhone() {
    return GeneratedTextColumn(
      'guest_phone',
      $tableName,
      true,
    );
  }

  final VerificationMeta _guestEmailMeta = const VerificationMeta('guestEmail');
  GeneratedTextColumn _guestEmail;
  @override
  GeneratedTextColumn get guestEmail => _guestEmail ??= _constructGuestEmail();
  GeneratedTextColumn _constructGuestEmail() {
    return GeneratedTextColumn(
      'guest_email',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isPaidByOwnMeta =
      const VerificationMeta('isPaidByOwn');
  GeneratedBoolColumn _isPaidByOwn;
  @override
  GeneratedBoolColumn get isPaidByOwn =>
      _isPaidByOwn ??= _constructIsPaidByOwn();
  GeneratedBoolColumn _constructIsPaidByOwn() {
    return GeneratedBoolColumn(
      'is_paid_by_own',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        id,
        orderNo,
        guestId,
        eventId,
        paymentType,
        totalAmount,
        status,
        quantity,
        guestName,
        guestPhone,
        guestEmail,
        isPaidByOwn
      ];
  @override
  $ETOrderInfoEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_et_order';
  @override
  final String actualTableName = 'cip_today_et_order';
  @override
  VerificationContext validateIntegrity(Insertable<ETOrderInfoEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('order_no')) {
      context.handle(_orderNoMeta,
          orderNo.isAcceptableOrUnknown(data['order_no'], _orderNoMeta));
    }
    if (data.containsKey('guest_id')) {
      context.handle(_guestIdMeta,
          guestId.isAcceptableOrUnknown(data['guest_id'], _guestIdMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id'], _eventIdMeta));
    }
    if (data.containsKey('payment_type')) {
      context.handle(
          _paymentTypeMeta,
          paymentType.isAcceptableOrUnknown(
              data['payment_type'], _paymentTypeMeta));
    }
    if (data.containsKey('total_amount')) {
      context.handle(
          _totalAmountMeta,
          totalAmount.isAcceptableOrUnknown(
              data['total_amount'], _totalAmountMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity'], _quantityMeta));
    }
    if (data.containsKey('guest_name')) {
      context.handle(_guestNameMeta,
          guestName.isAcceptableOrUnknown(data['guest_name'], _guestNameMeta));
    }
    if (data.containsKey('guest_phone')) {
      context.handle(
          _guestPhoneMeta,
          guestPhone.isAcceptableOrUnknown(
              data['guest_phone'], _guestPhoneMeta));
    }
    if (data.containsKey('guest_email')) {
      context.handle(
          _guestEmailMeta,
          guestEmail.isAcceptableOrUnknown(
              data['guest_email'], _guestEmailMeta));
    }
    if (data.containsKey('is_paid_by_own')) {
      context.handle(
          _isPaidByOwnMeta,
          isPaidByOwn.isAcceptableOrUnknown(
              data['is_paid_by_own'], _isPaidByOwnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ETOrderInfoEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ETOrderInfoEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ETOrderInfoEntityTable createAlias(String alias) {
    return $ETOrderInfoEntityTable(_db, alias);
  }
}

class ETPayMentInfoAllEntry extends DataClass
    implements Insertable<ETPayMentInfoAllEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final double id;
  final double eventId;
  final String paymentType;
  final String accountName;
  final String accountNo;
  final String bankName;
  final String bankBranchName;
  ETPayMentInfoAllEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      this.id,
      this.eventId,
      this.paymentType,
      this.accountName,
      this.accountNo,
      this.bankName,
      this.bankBranchName});
  factory ETPayMentInfoAllEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return ETPayMentInfoAllEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      id: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      eventId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}event_id']),
      paymentType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}payment_type']),
      accountName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}account_name']),
      accountNo: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}account_no']),
      bankName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}bank_name']),
      bankBranchName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}bank_branch_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<double>(id);
    }
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<double>(eventId);
    }
    if (!nullToAbsent || paymentType != null) {
      map['payment_type'] = Variable<String>(paymentType);
    }
    if (!nullToAbsent || accountName != null) {
      map['account_name'] = Variable<String>(accountName);
    }
    if (!nullToAbsent || accountNo != null) {
      map['account_no'] = Variable<String>(accountNo);
    }
    if (!nullToAbsent || bankName != null) {
      map['bank_name'] = Variable<String>(bankName);
    }
    if (!nullToAbsent || bankBranchName != null) {
      map['bank_branch_name'] = Variable<String>(bankBranchName);
    }
    return map;
  }

  ETPayMentInfoEntityCompanion toCompanion(bool nullToAbsent) {
    return ETPayMentInfoEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      paymentType: paymentType == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentType),
      accountName: accountName == null && nullToAbsent
          ? const Value.absent()
          : Value(accountName),
      accountNo: accountNo == null && nullToAbsent
          ? const Value.absent()
          : Value(accountNo),
      bankName: bankName == null && nullToAbsent
          ? const Value.absent()
          : Value(bankName),
      bankBranchName: bankBranchName == null && nullToAbsent
          ? const Value.absent()
          : Value(bankBranchName),
    );
  }

  factory ETPayMentInfoAllEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ETPayMentInfoAllEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      id: serializer.fromJson<double>(json['id']),
      eventId: serializer.fromJson<double>(json['eventId']),
      paymentType: serializer.fromJson<String>(json['paymentType']),
      accountName: serializer.fromJson<String>(json['accountName']),
      accountNo: serializer.fromJson<String>(json['accountNo']),
      bankName: serializer.fromJson<String>(json['bankName']),
      bankBranchName: serializer.fromJson<String>(json['bankBranchName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'id': serializer.toJson<double>(id),
      'eventId': serializer.toJson<double>(eventId),
      'paymentType': serializer.toJson<String>(paymentType),
      'accountName': serializer.toJson<String>(accountName),
      'accountNo': serializer.toJson<String>(accountNo),
      'bankName': serializer.toJson<String>(bankName),
      'bankBranchName': serializer.toJson<String>(bankBranchName),
    };
  }

  ETPayMentInfoAllEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          double id,
          double eventId,
          String paymentType,
          String accountName,
          String accountNo,
          String bankName,
          String bankBranchName}) =>
      ETPayMentInfoAllEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        id: id ?? this.id,
        eventId: eventId ?? this.eventId,
        paymentType: paymentType ?? this.paymentType,
        accountName: accountName ?? this.accountName,
        accountNo: accountNo ?? this.accountNo,
        bankName: bankName ?? this.bankName,
        bankBranchName: bankBranchName ?? this.bankBranchName,
      );
  @override
  String toString() {
    return (StringBuffer('ETPayMentInfoAllEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('paymentType: $paymentType, ')
          ..write('accountName: $accountName, ')
          ..write('accountNo: $accountNo, ')
          ..write('bankName: $bankName, ')
          ..write('bankBranchName: $bankBranchName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              id.hashCode,
                              $mrjc(
                                  eventId.hashCode,
                                  $mrjc(
                                      paymentType.hashCode,
                                      $mrjc(
                                          accountName.hashCode,
                                          $mrjc(
                                              accountNo.hashCode,
                                              $mrjc(
                                                  bankName.hashCode,
                                                  bankBranchName
                                                      .hashCode)))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ETPayMentInfoAllEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.id == this.id &&
          other.eventId == this.eventId &&
          other.paymentType == this.paymentType &&
          other.accountName == this.accountName &&
          other.accountNo == this.accountNo &&
          other.bankName == this.bankName &&
          other.bankBranchName == this.bankBranchName);
}

class ETPayMentInfoEntityCompanion
    extends UpdateCompanion<ETPayMentInfoAllEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<double> id;
  final Value<double> eventId;
  final Value<String> paymentType;
  final Value<String> accountName;
  final Value<String> accountNo;
  final Value<String> bankName;
  final Value<String> bankBranchName;
  const ETPayMentInfoEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.eventId = const Value.absent(),
    this.paymentType = const Value.absent(),
    this.accountName = const Value.absent(),
    this.accountNo = const Value.absent(),
    this.bankName = const Value.absent(),
    this.bankBranchName = const Value.absent(),
  });
  ETPayMentInfoEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.eventId = const Value.absent(),
    this.paymentType = const Value.absent(),
    this.accountName = const Value.absent(),
    this.accountNo = const Value.absent(),
    this.bankName = const Value.absent(),
    this.bankBranchName = const Value.absent(),
  });
  static Insertable<ETPayMentInfoAllEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<double> id,
    Expression<double> eventId,
    Expression<String> paymentType,
    Expression<String> accountName,
    Expression<String> accountNo,
    Expression<String> bankName,
    Expression<String> bankBranchName,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (id != null) 'id': id,
      if (eventId != null) 'event_id': eventId,
      if (paymentType != null) 'payment_type': paymentType,
      if (accountName != null) 'account_name': accountName,
      if (accountNo != null) 'account_no': accountNo,
      if (bankName != null) 'bank_name': bankName,
      if (bankBranchName != null) 'bank_branch_name': bankBranchName,
    });
  }

  ETPayMentInfoEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<double> id,
      Value<double> eventId,
      Value<String> paymentType,
      Value<String> accountName,
      Value<String> accountNo,
      Value<String> bankName,
      Value<String> bankBranchName}) {
    return ETPayMentInfoEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      paymentType: paymentType ?? this.paymentType,
      accountName: accountName ?? this.accountName,
      accountNo: accountNo ?? this.accountNo,
      bankName: bankName ?? this.bankName,
      bankBranchName: bankBranchName ?? this.bankBranchName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (id.present) {
      map['id'] = Variable<double>(id.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<double>(eventId.value);
    }
    if (paymentType.present) {
      map['payment_type'] = Variable<String>(paymentType.value);
    }
    if (accountName.present) {
      map['account_name'] = Variable<String>(accountName.value);
    }
    if (accountNo.present) {
      map['account_no'] = Variable<String>(accountNo.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (bankBranchName.present) {
      map['bank_branch_name'] = Variable<String>(bankBranchName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ETPayMentInfoEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('paymentType: $paymentType, ')
          ..write('accountName: $accountName, ')
          ..write('accountNo: $accountNo, ')
          ..write('bankName: $bankName, ')
          ..write('bankBranchName: $bankBranchName')
          ..write(')'))
        .toString();
  }
}

class $ETPayMentInfoEntityTable extends ETPayMentInfoEntity
    with TableInfo<$ETPayMentInfoEntityTable, ETPayMentInfoAllEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $ETPayMentInfoEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedRealColumn _id;
  @override
  GeneratedRealColumn get id => _id ??= _constructId();
  GeneratedRealColumn _constructId() {
    return GeneratedRealColumn(
      'id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _eventIdMeta = const VerificationMeta('eventId');
  GeneratedRealColumn _eventId;
  @override
  GeneratedRealColumn get eventId => _eventId ??= _constructEventId();
  GeneratedRealColumn _constructEventId() {
    return GeneratedRealColumn(
      'event_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _paymentTypeMeta =
      const VerificationMeta('paymentType');
  GeneratedTextColumn _paymentType;
  @override
  GeneratedTextColumn get paymentType =>
      _paymentType ??= _constructPaymentType();
  GeneratedTextColumn _constructPaymentType() {
    return GeneratedTextColumn(
      'payment_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _accountNameMeta =
      const VerificationMeta('accountName');
  GeneratedTextColumn _accountName;
  @override
  GeneratedTextColumn get accountName =>
      _accountName ??= _constructAccountName();
  GeneratedTextColumn _constructAccountName() {
    return GeneratedTextColumn(
      'account_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _accountNoMeta = const VerificationMeta('accountNo');
  GeneratedTextColumn _accountNo;
  @override
  GeneratedTextColumn get accountNo => _accountNo ??= _constructAccountNo();
  GeneratedTextColumn _constructAccountNo() {
    return GeneratedTextColumn(
      'account_no',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bankNameMeta = const VerificationMeta('bankName');
  GeneratedTextColumn _bankName;
  @override
  GeneratedTextColumn get bankName => _bankName ??= _constructBankName();
  GeneratedTextColumn _constructBankName() {
    return GeneratedTextColumn(
      'bank_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bankBranchNameMeta =
      const VerificationMeta('bankBranchName');
  GeneratedTextColumn _bankBranchName;
  @override
  GeneratedTextColumn get bankBranchName =>
      _bankBranchName ??= _constructBankBranchName();
  GeneratedTextColumn _constructBankBranchName() {
    return GeneratedTextColumn(
      'bank_branch_name',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        id,
        eventId,
        paymentType,
        accountName,
        accountNo,
        bankName,
        bankBranchName
      ];
  @override
  $ETPayMentInfoEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_et_payment';
  @override
  final String actualTableName = 'cip_today_et_payment';
  @override
  VerificationContext validateIntegrity(
      Insertable<ETPayMentInfoAllEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id'], _eventIdMeta));
    }
    if (data.containsKey('payment_type')) {
      context.handle(
          _paymentTypeMeta,
          paymentType.isAcceptableOrUnknown(
              data['payment_type'], _paymentTypeMeta));
    }
    if (data.containsKey('account_name')) {
      context.handle(
          _accountNameMeta,
          accountName.isAcceptableOrUnknown(
              data['account_name'], _accountNameMeta));
    }
    if (data.containsKey('account_no')) {
      context.handle(_accountNoMeta,
          accountNo.isAcceptableOrUnknown(data['account_no'], _accountNoMeta));
    }
    if (data.containsKey('bank_name')) {
      context.handle(_bankNameMeta,
          bankName.isAcceptableOrUnknown(data['bank_name'], _bankNameMeta));
    }
    if (data.containsKey('bank_branch_name')) {
      context.handle(
          _bankBranchNameMeta,
          bankBranchName.isAcceptableOrUnknown(
              data['bank_branch_name'], _bankBranchNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ETPayMentInfoAllEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ETPayMentInfoAllEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ETPayMentInfoEntityTable createAlias(String alias) {
    return $ETPayMentInfoEntityTable(_db, alias);
  }
}

class ETGuestInfoAllEntry extends DataClass
    implements Insertable<ETGuestInfoAllEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final double id;
  final double idGuest;
  final String fullName;
  final String emailAddress;
  final String phoneNumber;
  final String idCard;
  final String company;
  final String position;
  ETGuestInfoAllEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      this.id,
      @required this.idGuest,
      this.fullName,
      this.emailAddress,
      this.phoneNumber,
      this.idCard,
      this.company,
      this.position});
  factory ETGuestInfoAllEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return ETGuestInfoAllEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      id: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idGuest: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}id_guest']),
      fullName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}full_name']),
      emailAddress: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}email_address']),
      phoneNumber: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}phone_number']),
      idCard:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}id_card']),
      company:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}company']),
      position: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}position']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<double>(id);
    }
    if (!nullToAbsent || idGuest != null) {
      map['id_guest'] = Variable<double>(idGuest);
    }
    if (!nullToAbsent || fullName != null) {
      map['full_name'] = Variable<String>(fullName);
    }
    if (!nullToAbsent || emailAddress != null) {
      map['email_address'] = Variable<String>(emailAddress);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || idCard != null) {
      map['id_card'] = Variable<String>(idCard);
    }
    if (!nullToAbsent || company != null) {
      map['company'] = Variable<String>(company);
    }
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<String>(position);
    }
    return map;
  }

  ETGuestInfoEntityCompanion toCompanion(bool nullToAbsent) {
    return ETGuestInfoEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idGuest: idGuest == null && nullToAbsent
          ? const Value.absent()
          : Value(idGuest),
      fullName: fullName == null && nullToAbsent
          ? const Value.absent()
          : Value(fullName),
      emailAddress: emailAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(emailAddress),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      idCard:
          idCard == null && nullToAbsent ? const Value.absent() : Value(idCard),
      company: company == null && nullToAbsent
          ? const Value.absent()
          : Value(company),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
    );
  }

  factory ETGuestInfoAllEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ETGuestInfoAllEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      id: serializer.fromJson<double>(json['id']),
      idGuest: serializer.fromJson<double>(json['idGuest']),
      fullName: serializer.fromJson<String>(json['fullName']),
      emailAddress: serializer.fromJson<String>(json['emailAddress']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      idCard: serializer.fromJson<String>(json['idCard']),
      company: serializer.fromJson<String>(json['company']),
      position: serializer.fromJson<String>(json['position']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'id': serializer.toJson<double>(id),
      'idGuest': serializer.toJson<double>(idGuest),
      'fullName': serializer.toJson<String>(fullName),
      'emailAddress': serializer.toJson<String>(emailAddress),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'idCard': serializer.toJson<String>(idCard),
      'company': serializer.toJson<String>(company),
      'position': serializer.toJson<String>(position),
    };
  }

  ETGuestInfoAllEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          double id,
          double idGuest,
          String fullName,
          String emailAddress,
          String phoneNumber,
          String idCard,
          String company,
          String position}) =>
      ETGuestInfoAllEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        id: id ?? this.id,
        idGuest: idGuest ?? this.idGuest,
        fullName: fullName ?? this.fullName,
        emailAddress: emailAddress ?? this.emailAddress,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        idCard: idCard ?? this.idCard,
        company: company ?? this.company,
        position: position ?? this.position,
      );
  @override
  String toString() {
    return (StringBuffer('ETGuestInfoAllEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('idGuest: $idGuest, ')
          ..write('fullName: $fullName, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('idCard: $idCard, ')
          ..write('company: $company, ')
          ..write('position: $position')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              id.hashCode,
                              $mrjc(
                                  idGuest.hashCode,
                                  $mrjc(
                                      fullName.hashCode,
                                      $mrjc(
                                          emailAddress.hashCode,
                                          $mrjc(
                                              phoneNumber.hashCode,
                                              $mrjc(
                                                  idCard.hashCode,
                                                  $mrjc(
                                                      company.hashCode,
                                                      position
                                                          .hashCode))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ETGuestInfoAllEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.id == this.id &&
          other.idGuest == this.idGuest &&
          other.fullName == this.fullName &&
          other.emailAddress == this.emailAddress &&
          other.phoneNumber == this.phoneNumber &&
          other.idCard == this.idCard &&
          other.company == this.company &&
          other.position == this.position);
}

class ETGuestInfoEntityCompanion extends UpdateCompanion<ETGuestInfoAllEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<double> id;
  final Value<double> idGuest;
  final Value<String> fullName;
  final Value<String> emailAddress;
  final Value<String> phoneNumber;
  final Value<String> idCard;
  final Value<String> company;
  final Value<String> position;
  const ETGuestInfoEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.idGuest = const Value.absent(),
    this.fullName = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.idCard = const Value.absent(),
    this.company = const Value.absent(),
    this.position = const Value.absent(),
  });
  ETGuestInfoEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    @required double idGuest,
    this.fullName = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.idCard = const Value.absent(),
    this.company = const Value.absent(),
    this.position = const Value.absent(),
  }) : idGuest = Value(idGuest);
  static Insertable<ETGuestInfoAllEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<double> id,
    Expression<double> idGuest,
    Expression<String> fullName,
    Expression<String> emailAddress,
    Expression<String> phoneNumber,
    Expression<String> idCard,
    Expression<String> company,
    Expression<String> position,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (id != null) 'id': id,
      if (idGuest != null) 'id_guest': idGuest,
      if (fullName != null) 'full_name': fullName,
      if (emailAddress != null) 'email_address': emailAddress,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (idCard != null) 'id_card': idCard,
      if (company != null) 'company': company,
      if (position != null) 'position': position,
    });
  }

  ETGuestInfoEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<double> id,
      Value<double> idGuest,
      Value<String> fullName,
      Value<String> emailAddress,
      Value<String> phoneNumber,
      Value<String> idCard,
      Value<String> company,
      Value<String> position}) {
    return ETGuestInfoEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      id: id ?? this.id,
      idGuest: idGuest ?? this.idGuest,
      fullName: fullName ?? this.fullName,
      emailAddress: emailAddress ?? this.emailAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      idCard: idCard ?? this.idCard,
      company: company ?? this.company,
      position: position ?? this.position,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (id.present) {
      map['id'] = Variable<double>(id.value);
    }
    if (idGuest.present) {
      map['id_guest'] = Variable<double>(idGuest.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (emailAddress.present) {
      map['email_address'] = Variable<String>(emailAddress.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (idCard.present) {
      map['id_card'] = Variable<String>(idCard.value);
    }
    if (company.present) {
      map['company'] = Variable<String>(company.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(position.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ETGuestInfoEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('idGuest: $idGuest, ')
          ..write('fullName: $fullName, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('idCard: $idCard, ')
          ..write('company: $company, ')
          ..write('position: $position')
          ..write(')'))
        .toString();
  }
}

class $ETGuestInfoEntityTable extends ETGuestInfoEntity
    with TableInfo<$ETGuestInfoEntityTable, ETGuestInfoAllEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $ETGuestInfoEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedRealColumn _id;
  @override
  GeneratedRealColumn get id => _id ??= _constructId();
  GeneratedRealColumn _constructId() {
    return GeneratedRealColumn(
      'id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idGuestMeta = const VerificationMeta('idGuest');
  GeneratedRealColumn _idGuest;
  @override
  GeneratedRealColumn get idGuest => _idGuest ??= _constructIdGuest();
  GeneratedRealColumn _constructIdGuest() {
    return GeneratedRealColumn(
      'id_guest',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fullNameMeta = const VerificationMeta('fullName');
  GeneratedTextColumn _fullName;
  @override
  GeneratedTextColumn get fullName => _fullName ??= _constructFullName();
  GeneratedTextColumn _constructFullName() {
    return GeneratedTextColumn(
      'full_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _emailAddressMeta =
      const VerificationMeta('emailAddress');
  GeneratedTextColumn _emailAddress;
  @override
  GeneratedTextColumn get emailAddress =>
      _emailAddress ??= _constructEmailAddress();
  GeneratedTextColumn _constructEmailAddress() {
    return GeneratedTextColumn(
      'email_address',
      $tableName,
      true,
    );
  }

  final VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  GeneratedTextColumn _phoneNumber;
  @override
  GeneratedTextColumn get phoneNumber =>
      _phoneNumber ??= _constructPhoneNumber();
  GeneratedTextColumn _constructPhoneNumber() {
    return GeneratedTextColumn(
      'phone_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idCardMeta = const VerificationMeta('idCard');
  GeneratedTextColumn _idCard;
  @override
  GeneratedTextColumn get idCard => _idCard ??= _constructIdCard();
  GeneratedTextColumn _constructIdCard() {
    return GeneratedTextColumn(
      'id_card',
      $tableName,
      true,
    );
  }

  final VerificationMeta _companyMeta = const VerificationMeta('company');
  GeneratedTextColumn _company;
  @override
  GeneratedTextColumn get company => _company ??= _constructCompany();
  GeneratedTextColumn _constructCompany() {
    return GeneratedTextColumn(
      'company',
      $tableName,
      true,
    );
  }

  final VerificationMeta _positionMeta = const VerificationMeta('position');
  GeneratedTextColumn _position;
  @override
  GeneratedTextColumn get position => _position ??= _constructPosition();
  GeneratedTextColumn _constructPosition() {
    return GeneratedTextColumn(
      'position',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        id,
        idGuest,
        fullName,
        emailAddress,
        phoneNumber,
        idCard,
        company,
        position
      ];
  @override
  $ETGuestInfoEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_et_guest';
  @override
  final String actualTableName = 'cip_today_et_guest';
  @override
  VerificationContext validateIntegrity(
      Insertable<ETGuestInfoAllEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_guest')) {
      context.handle(_idGuestMeta,
          idGuest.isAcceptableOrUnknown(data['id_guest'], _idGuestMeta));
    } else if (isInserting) {
      context.missing(_idGuestMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name'], _fullNameMeta));
    }
    if (data.containsKey('email_address')) {
      context.handle(
          _emailAddressMeta,
          emailAddress.isAcceptableOrUnknown(
              data['email_address'], _emailAddressMeta));
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number'], _phoneNumberMeta));
    }
    if (data.containsKey('id_card')) {
      context.handle(_idCardMeta,
          idCard.isAcceptableOrUnknown(data['id_card'], _idCardMeta));
    }
    if (data.containsKey('company')) {
      context.handle(_companyMeta,
          company.isAcceptableOrUnknown(data['company'], _companyMeta));
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position'], _positionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ETGuestInfoAllEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ETGuestInfoAllEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ETGuestInfoEntityTable createAlias(String alias) {
    return $ETGuestInfoEntityTable(_db, alias);
  }
}

class ETBookingDiscountInfoAllEntry extends DataClass
    implements Insertable<ETBookingDiscountInfoAllEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final double id;
  final double idBookingDiscount;
  final double ticketId;
  final double discountValue;
  final String discountUnit;
  final double bookingQuantity;
  ETBookingDiscountInfoAllEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      this.id,
      @required this.idBookingDiscount,
      this.ticketId,
      this.discountValue,
      this.discountUnit,
      this.bookingQuantity});
  factory ETBookingDiscountInfoAllEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return ETBookingDiscountInfoAllEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      id: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idBookingDiscount: doubleType.mapFromDatabaseResponse(
          data['${effectivePrefix}id_booking_discount']),
      ticketId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}ticket_id']),
      discountValue: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}discount_value']),
      discountUnit: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}discount_unit']),
      bookingQuantity: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}booking_quantity']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<double>(id);
    }
    if (!nullToAbsent || idBookingDiscount != null) {
      map['id_booking_discount'] = Variable<double>(idBookingDiscount);
    }
    if (!nullToAbsent || ticketId != null) {
      map['ticket_id'] = Variable<double>(ticketId);
    }
    if (!nullToAbsent || discountValue != null) {
      map['discount_value'] = Variable<double>(discountValue);
    }
    if (!nullToAbsent || discountUnit != null) {
      map['discount_unit'] = Variable<String>(discountUnit);
    }
    if (!nullToAbsent || bookingQuantity != null) {
      map['booking_quantity'] = Variable<double>(bookingQuantity);
    }
    return map;
  }

  ETBookingDiscountInfoEntityCompanion toCompanion(bool nullToAbsent) {
    return ETBookingDiscountInfoEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idBookingDiscount: idBookingDiscount == null && nullToAbsent
          ? const Value.absent()
          : Value(idBookingDiscount),
      ticketId: ticketId == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketId),
      discountValue: discountValue == null && nullToAbsent
          ? const Value.absent()
          : Value(discountValue),
      discountUnit: discountUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(discountUnit),
      bookingQuantity: bookingQuantity == null && nullToAbsent
          ? const Value.absent()
          : Value(bookingQuantity),
    );
  }

  factory ETBookingDiscountInfoAllEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ETBookingDiscountInfoAllEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      id: serializer.fromJson<double>(json['id']),
      idBookingDiscount: serializer.fromJson<double>(json['idBookingDiscount']),
      ticketId: serializer.fromJson<double>(json['ticketId']),
      discountValue: serializer.fromJson<double>(json['discountValue']),
      discountUnit: serializer.fromJson<String>(json['discountUnit']),
      bookingQuantity: serializer.fromJson<double>(json['bookingQuantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'id': serializer.toJson<double>(id),
      'idBookingDiscount': serializer.toJson<double>(idBookingDiscount),
      'ticketId': serializer.toJson<double>(ticketId),
      'discountValue': serializer.toJson<double>(discountValue),
      'discountUnit': serializer.toJson<String>(discountUnit),
      'bookingQuantity': serializer.toJson<double>(bookingQuantity),
    };
  }

  ETBookingDiscountInfoAllEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          double id,
          double idBookingDiscount,
          double ticketId,
          double discountValue,
          String discountUnit,
          double bookingQuantity}) =>
      ETBookingDiscountInfoAllEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        id: id ?? this.id,
        idBookingDiscount: idBookingDiscount ?? this.idBookingDiscount,
        ticketId: ticketId ?? this.ticketId,
        discountValue: discountValue ?? this.discountValue,
        discountUnit: discountUnit ?? this.discountUnit,
        bookingQuantity: bookingQuantity ?? this.bookingQuantity,
      );
  @override
  String toString() {
    return (StringBuffer('ETBookingDiscountInfoAllEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('idBookingDiscount: $idBookingDiscount, ')
          ..write('ticketId: $ticketId, ')
          ..write('discountValue: $discountValue, ')
          ..write('discountUnit: $discountUnit, ')
          ..write('bookingQuantity: $bookingQuantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              id.hashCode,
                              $mrjc(
                                  idBookingDiscount.hashCode,
                                  $mrjc(
                                      ticketId.hashCode,
                                      $mrjc(
                                          discountValue.hashCode,
                                          $mrjc(
                                              discountUnit.hashCode,
                                              bookingQuantity
                                                  .hashCode))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ETBookingDiscountInfoAllEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.id == this.id &&
          other.idBookingDiscount == this.idBookingDiscount &&
          other.ticketId == this.ticketId &&
          other.discountValue == this.discountValue &&
          other.discountUnit == this.discountUnit &&
          other.bookingQuantity == this.bookingQuantity);
}

class ETBookingDiscountInfoEntityCompanion
    extends UpdateCompanion<ETBookingDiscountInfoAllEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<double> id;
  final Value<double> idBookingDiscount;
  final Value<double> ticketId;
  final Value<double> discountValue;
  final Value<String> discountUnit;
  final Value<double> bookingQuantity;
  const ETBookingDiscountInfoEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.idBookingDiscount = const Value.absent(),
    this.ticketId = const Value.absent(),
    this.discountValue = const Value.absent(),
    this.discountUnit = const Value.absent(),
    this.bookingQuantity = const Value.absent(),
  });
  ETBookingDiscountInfoEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    @required double idBookingDiscount,
    this.ticketId = const Value.absent(),
    this.discountValue = const Value.absent(),
    this.discountUnit = const Value.absent(),
    this.bookingQuantity = const Value.absent(),
  }) : idBookingDiscount = Value(idBookingDiscount);
  static Insertable<ETBookingDiscountInfoAllEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<double> id,
    Expression<double> idBookingDiscount,
    Expression<double> ticketId,
    Expression<double> discountValue,
    Expression<String> discountUnit,
    Expression<double> bookingQuantity,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (id != null) 'id': id,
      if (idBookingDiscount != null) 'id_booking_discount': idBookingDiscount,
      if (ticketId != null) 'ticket_id': ticketId,
      if (discountValue != null) 'discount_value': discountValue,
      if (discountUnit != null) 'discount_unit': discountUnit,
      if (bookingQuantity != null) 'booking_quantity': bookingQuantity,
    });
  }

  ETBookingDiscountInfoEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<double> id,
      Value<double> idBookingDiscount,
      Value<double> ticketId,
      Value<double> discountValue,
      Value<String> discountUnit,
      Value<double> bookingQuantity}) {
    return ETBookingDiscountInfoEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      id: id ?? this.id,
      idBookingDiscount: idBookingDiscount ?? this.idBookingDiscount,
      ticketId: ticketId ?? this.ticketId,
      discountValue: discountValue ?? this.discountValue,
      discountUnit: discountUnit ?? this.discountUnit,
      bookingQuantity: bookingQuantity ?? this.bookingQuantity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (id.present) {
      map['id'] = Variable<double>(id.value);
    }
    if (idBookingDiscount.present) {
      map['id_booking_discount'] = Variable<double>(idBookingDiscount.value);
    }
    if (ticketId.present) {
      map['ticket_id'] = Variable<double>(ticketId.value);
    }
    if (discountValue.present) {
      map['discount_value'] = Variable<double>(discountValue.value);
    }
    if (discountUnit.present) {
      map['discount_unit'] = Variable<String>(discountUnit.value);
    }
    if (bookingQuantity.present) {
      map['booking_quantity'] = Variable<double>(bookingQuantity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ETBookingDiscountInfoEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('idBookingDiscount: $idBookingDiscount, ')
          ..write('ticketId: $ticketId, ')
          ..write('discountValue: $discountValue, ')
          ..write('discountUnit: $discountUnit, ')
          ..write('bookingQuantity: $bookingQuantity')
          ..write(')'))
        .toString();
  }
}

class $ETBookingDiscountInfoEntityTable extends ETBookingDiscountInfoEntity
    with
        TableInfo<$ETBookingDiscountInfoEntityTable,
            ETBookingDiscountInfoAllEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $ETBookingDiscountInfoEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedRealColumn _id;
  @override
  GeneratedRealColumn get id => _id ??= _constructId();
  GeneratedRealColumn _constructId() {
    return GeneratedRealColumn(
      'id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idBookingDiscountMeta =
      const VerificationMeta('idBookingDiscount');
  GeneratedRealColumn _idBookingDiscount;
  @override
  GeneratedRealColumn get idBookingDiscount =>
      _idBookingDiscount ??= _constructIdBookingDiscount();
  GeneratedRealColumn _constructIdBookingDiscount() {
    return GeneratedRealColumn(
      'id_booking_discount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ticketIdMeta = const VerificationMeta('ticketId');
  GeneratedRealColumn _ticketId;
  @override
  GeneratedRealColumn get ticketId => _ticketId ??= _constructTicketId();
  GeneratedRealColumn _constructTicketId() {
    return GeneratedRealColumn(
      'ticket_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _discountValueMeta =
      const VerificationMeta('discountValue');
  GeneratedRealColumn _discountValue;
  @override
  GeneratedRealColumn get discountValue =>
      _discountValue ??= _constructDiscountValue();
  GeneratedRealColumn _constructDiscountValue() {
    return GeneratedRealColumn(
      'discount_value',
      $tableName,
      true,
    );
  }

  final VerificationMeta _discountUnitMeta =
      const VerificationMeta('discountUnit');
  GeneratedTextColumn _discountUnit;
  @override
  GeneratedTextColumn get discountUnit =>
      _discountUnit ??= _constructDiscountUnit();
  GeneratedTextColumn _constructDiscountUnit() {
    return GeneratedTextColumn(
      'discount_unit',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bookingQuantityMeta =
      const VerificationMeta('bookingQuantity');
  GeneratedRealColumn _bookingQuantity;
  @override
  GeneratedRealColumn get bookingQuantity =>
      _bookingQuantity ??= _constructBookingQuantity();
  GeneratedRealColumn _constructBookingQuantity() {
    return GeneratedRealColumn(
      'booking_quantity',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        id,
        idBookingDiscount,
        ticketId,
        discountValue,
        discountUnit,
        bookingQuantity
      ];
  @override
  $ETBookingDiscountInfoEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_et_booking_discount';
  @override
  final String actualTableName = 'cip_today_et_booking_discount';
  @override
  VerificationContext validateIntegrity(
      Insertable<ETBookingDiscountInfoAllEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_booking_discount')) {
      context.handle(
          _idBookingDiscountMeta,
          idBookingDiscount.isAcceptableOrUnknown(
              data['id_booking_discount'], _idBookingDiscountMeta));
    } else if (isInserting) {
      context.missing(_idBookingDiscountMeta);
    }
    if (data.containsKey('ticket_id')) {
      context.handle(_ticketIdMeta,
          ticketId.isAcceptableOrUnknown(data['ticket_id'], _ticketIdMeta));
    }
    if (data.containsKey('discount_value')) {
      context.handle(
          _discountValueMeta,
          discountValue.isAcceptableOrUnknown(
              data['discount_value'], _discountValueMeta));
    }
    if (data.containsKey('discount_unit')) {
      context.handle(
          _discountUnitMeta,
          discountUnit.isAcceptableOrUnknown(
              data['discount_unit'], _discountUnitMeta));
    }
    if (data.containsKey('booking_quantity')) {
      context.handle(
          _bookingQuantityMeta,
          bookingQuantity.isAcceptableOrUnknown(
              data['booking_quantity'], _bookingQuantityMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ETBookingDiscountInfoAllEntry map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ETBookingDiscountInfoAllEntry.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  $ETBookingDiscountInfoEntityTable createAlias(String alias) {
    return $ETBookingDiscountInfoEntityTable(_db, alias);
  }
}

class ETTicketInfoAllEntry extends DataClass
    implements Insertable<ETTicketInfoAllEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final double id;
  final double idTicketInfo;
  final double eventId;
  final double remainingTicketQuantity;
  final String ticketName;
  final double ticketPrice;
  final double isFree;
  final double ticketQuantity;
  final double maxQuantity;
  final double discountUnit;
  final double minQuantity;
  final String description;
  final String eventStartDate;
  final String eventEndDate;
  final String startDate;
  final String endDate;
  ETTicketInfoAllEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      this.id,
      @required this.idTicketInfo,
      this.eventId,
      this.remainingTicketQuantity,
      this.ticketName,
      this.ticketPrice,
      this.isFree,
      this.ticketQuantity,
      this.maxQuantity,
      this.discountUnit,
      this.minQuantity,
      this.description,
      this.eventStartDate,
      this.eventEndDate,
      this.startDate,
      this.endDate});
  factory ETTicketInfoAllEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return ETTicketInfoAllEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      id: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idTicketInfo: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}id_ticket_info']),
      eventId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}event_id']),
      remainingTicketQuantity: doubleType.mapFromDatabaseResponse(
          data['${effectivePrefix}remaining_ticket_quantity']),
      ticketName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}ticket_name']),
      ticketPrice: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}ticket_price']),
      isFree:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}is_free']),
      ticketQuantity: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}ticket_quantity']),
      maxQuantity: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}max_quantity']),
      discountUnit: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}discount_unit']),
      minQuantity: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}min_quantity']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      eventStartDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}event_start_date']),
      eventEndDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}event_end_date']),
      startDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date']),
      endDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}end_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<double>(id);
    }
    if (!nullToAbsent || idTicketInfo != null) {
      map['id_ticket_info'] = Variable<double>(idTicketInfo);
    }
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<double>(eventId);
    }
    if (!nullToAbsent || remainingTicketQuantity != null) {
      map['remaining_ticket_quantity'] =
          Variable<double>(remainingTicketQuantity);
    }
    if (!nullToAbsent || ticketName != null) {
      map['ticket_name'] = Variable<String>(ticketName);
    }
    if (!nullToAbsent || ticketPrice != null) {
      map['ticket_price'] = Variable<double>(ticketPrice);
    }
    if (!nullToAbsent || isFree != null) {
      map['is_free'] = Variable<double>(isFree);
    }
    if (!nullToAbsent || ticketQuantity != null) {
      map['ticket_quantity'] = Variable<double>(ticketQuantity);
    }
    if (!nullToAbsent || maxQuantity != null) {
      map['max_quantity'] = Variable<double>(maxQuantity);
    }
    if (!nullToAbsent || discountUnit != null) {
      map['discount_unit'] = Variable<double>(discountUnit);
    }
    if (!nullToAbsent || minQuantity != null) {
      map['min_quantity'] = Variable<double>(minQuantity);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || eventStartDate != null) {
      map['event_start_date'] = Variable<String>(eventStartDate);
    }
    if (!nullToAbsent || eventEndDate != null) {
      map['event_end_date'] = Variable<String>(eventEndDate);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<String>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<String>(endDate);
    }
    return map;
  }

  ETTicketInfoEntityCompanion toCompanion(bool nullToAbsent) {
    return ETTicketInfoEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idTicketInfo: idTicketInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(idTicketInfo),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      remainingTicketQuantity: remainingTicketQuantity == null && nullToAbsent
          ? const Value.absent()
          : Value(remainingTicketQuantity),
      ticketName: ticketName == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketName),
      ticketPrice: ticketPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketPrice),
      isFree:
          isFree == null && nullToAbsent ? const Value.absent() : Value(isFree),
      ticketQuantity: ticketQuantity == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketQuantity),
      maxQuantity: maxQuantity == null && nullToAbsent
          ? const Value.absent()
          : Value(maxQuantity),
      discountUnit: discountUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(discountUnit),
      minQuantity: minQuantity == null && nullToAbsent
          ? const Value.absent()
          : Value(minQuantity),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      eventStartDate: eventStartDate == null && nullToAbsent
          ? const Value.absent()
          : Value(eventStartDate),
      eventEndDate: eventEndDate == null && nullToAbsent
          ? const Value.absent()
          : Value(eventEndDate),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
    );
  }

  factory ETTicketInfoAllEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ETTicketInfoAllEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      id: serializer.fromJson<double>(json['id']),
      idTicketInfo: serializer.fromJson<double>(json['idTicketInfo']),
      eventId: serializer.fromJson<double>(json['eventId']),
      remainingTicketQuantity:
          serializer.fromJson<double>(json['remainingTicketQuantity']),
      ticketName: serializer.fromJson<String>(json['ticketName']),
      ticketPrice: serializer.fromJson<double>(json['ticketPrice']),
      isFree: serializer.fromJson<double>(json['isFree']),
      ticketQuantity: serializer.fromJson<double>(json['ticketQuantity']),
      maxQuantity: serializer.fromJson<double>(json['maxQuantity']),
      discountUnit: serializer.fromJson<double>(json['discountUnit']),
      minQuantity: serializer.fromJson<double>(json['minQuantity']),
      description: serializer.fromJson<String>(json['description']),
      eventStartDate: serializer.fromJson<String>(json['eventStartDate']),
      eventEndDate: serializer.fromJson<String>(json['eventEndDate']),
      startDate: serializer.fromJson<String>(json['startDate']),
      endDate: serializer.fromJson<String>(json['endDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'id': serializer.toJson<double>(id),
      'idTicketInfo': serializer.toJson<double>(idTicketInfo),
      'eventId': serializer.toJson<double>(eventId),
      'remainingTicketQuantity':
          serializer.toJson<double>(remainingTicketQuantity),
      'ticketName': serializer.toJson<String>(ticketName),
      'ticketPrice': serializer.toJson<double>(ticketPrice),
      'isFree': serializer.toJson<double>(isFree),
      'ticketQuantity': serializer.toJson<double>(ticketQuantity),
      'maxQuantity': serializer.toJson<double>(maxQuantity),
      'discountUnit': serializer.toJson<double>(discountUnit),
      'minQuantity': serializer.toJson<double>(minQuantity),
      'description': serializer.toJson<String>(description),
      'eventStartDate': serializer.toJson<String>(eventStartDate),
      'eventEndDate': serializer.toJson<String>(eventEndDate),
      'startDate': serializer.toJson<String>(startDate),
      'endDate': serializer.toJson<String>(endDate),
    };
  }

  ETTicketInfoAllEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          double id,
          double idTicketInfo,
          double eventId,
          double remainingTicketQuantity,
          String ticketName,
          double ticketPrice,
          double isFree,
          double ticketQuantity,
          double maxQuantity,
          double discountUnit,
          double minQuantity,
          String description,
          String eventStartDate,
          String eventEndDate,
          String startDate,
          String endDate}) =>
      ETTicketInfoAllEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        id: id ?? this.id,
        idTicketInfo: idTicketInfo ?? this.idTicketInfo,
        eventId: eventId ?? this.eventId,
        remainingTicketQuantity:
            remainingTicketQuantity ?? this.remainingTicketQuantity,
        ticketName: ticketName ?? this.ticketName,
        ticketPrice: ticketPrice ?? this.ticketPrice,
        isFree: isFree ?? this.isFree,
        ticketQuantity: ticketQuantity ?? this.ticketQuantity,
        maxQuantity: maxQuantity ?? this.maxQuantity,
        discountUnit: discountUnit ?? this.discountUnit,
        minQuantity: minQuantity ?? this.minQuantity,
        description: description ?? this.description,
        eventStartDate: eventStartDate ?? this.eventStartDate,
        eventEndDate: eventEndDate ?? this.eventEndDate,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
      );
  @override
  String toString() {
    return (StringBuffer('ETTicketInfoAllEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('idTicketInfo: $idTicketInfo, ')
          ..write('eventId: $eventId, ')
          ..write('remainingTicketQuantity: $remainingTicketQuantity, ')
          ..write('ticketName: $ticketName, ')
          ..write('ticketPrice: $ticketPrice, ')
          ..write('isFree: $isFree, ')
          ..write('ticketQuantity: $ticketQuantity, ')
          ..write('maxQuantity: $maxQuantity, ')
          ..write('discountUnit: $discountUnit, ')
          ..write('minQuantity: $minQuantity, ')
          ..write('description: $description, ')
          ..write('eventStartDate: $eventStartDate, ')
          ..write('eventEndDate: $eventEndDate, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              id.hashCode,
                              $mrjc(
                                  idTicketInfo.hashCode,
                                  $mrjc(
                                      eventId.hashCode,
                                      $mrjc(
                                          remainingTicketQuantity.hashCode,
                                          $mrjc(
                                              ticketName.hashCode,
                                              $mrjc(
                                                  ticketPrice.hashCode,
                                                  $mrjc(
                                                      isFree.hashCode,
                                                      $mrjc(
                                                          ticketQuantity
                                                              .hashCode,
                                                          $mrjc(
                                                              maxQuantity
                                                                  .hashCode,
                                                              $mrjc(
                                                                  discountUnit
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      minQuantity
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          description
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              eventStartDate.hashCode,
                                                                              $mrjc(eventEndDate.hashCode, $mrjc(startDate.hashCode, endDate.hashCode))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ETTicketInfoAllEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.id == this.id &&
          other.idTicketInfo == this.idTicketInfo &&
          other.eventId == this.eventId &&
          other.remainingTicketQuantity == this.remainingTicketQuantity &&
          other.ticketName == this.ticketName &&
          other.ticketPrice == this.ticketPrice &&
          other.isFree == this.isFree &&
          other.ticketQuantity == this.ticketQuantity &&
          other.maxQuantity == this.maxQuantity &&
          other.discountUnit == this.discountUnit &&
          other.minQuantity == this.minQuantity &&
          other.description == this.description &&
          other.eventStartDate == this.eventStartDate &&
          other.eventEndDate == this.eventEndDate &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate);
}

class ETTicketInfoEntityCompanion
    extends UpdateCompanion<ETTicketInfoAllEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<double> id;
  final Value<double> idTicketInfo;
  final Value<double> eventId;
  final Value<double> remainingTicketQuantity;
  final Value<String> ticketName;
  final Value<double> ticketPrice;
  final Value<double> isFree;
  final Value<double> ticketQuantity;
  final Value<double> maxQuantity;
  final Value<double> discountUnit;
  final Value<double> minQuantity;
  final Value<String> description;
  final Value<String> eventStartDate;
  final Value<String> eventEndDate;
  final Value<String> startDate;
  final Value<String> endDate;
  const ETTicketInfoEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    this.idTicketInfo = const Value.absent(),
    this.eventId = const Value.absent(),
    this.remainingTicketQuantity = const Value.absent(),
    this.ticketName = const Value.absent(),
    this.ticketPrice = const Value.absent(),
    this.isFree = const Value.absent(),
    this.ticketQuantity = const Value.absent(),
    this.maxQuantity = const Value.absent(),
    this.discountUnit = const Value.absent(),
    this.minQuantity = const Value.absent(),
    this.description = const Value.absent(),
    this.eventStartDate = const Value.absent(),
    this.eventEndDate = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  });
  ETTicketInfoEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.id = const Value.absent(),
    @required double idTicketInfo,
    this.eventId = const Value.absent(),
    this.remainingTicketQuantity = const Value.absent(),
    this.ticketName = const Value.absent(),
    this.ticketPrice = const Value.absent(),
    this.isFree = const Value.absent(),
    this.ticketQuantity = const Value.absent(),
    this.maxQuantity = const Value.absent(),
    this.discountUnit = const Value.absent(),
    this.minQuantity = const Value.absent(),
    this.description = const Value.absent(),
    this.eventStartDate = const Value.absent(),
    this.eventEndDate = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  }) : idTicketInfo = Value(idTicketInfo);
  static Insertable<ETTicketInfoAllEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<double> id,
    Expression<double> idTicketInfo,
    Expression<double> eventId,
    Expression<double> remainingTicketQuantity,
    Expression<String> ticketName,
    Expression<double> ticketPrice,
    Expression<double> isFree,
    Expression<double> ticketQuantity,
    Expression<double> maxQuantity,
    Expression<double> discountUnit,
    Expression<double> minQuantity,
    Expression<String> description,
    Expression<String> eventStartDate,
    Expression<String> eventEndDate,
    Expression<String> startDate,
    Expression<String> endDate,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (id != null) 'id': id,
      if (idTicketInfo != null) 'id_ticket_info': idTicketInfo,
      if (eventId != null) 'event_id': eventId,
      if (remainingTicketQuantity != null)
        'remaining_ticket_quantity': remainingTicketQuantity,
      if (ticketName != null) 'ticket_name': ticketName,
      if (ticketPrice != null) 'ticket_price': ticketPrice,
      if (isFree != null) 'is_free': isFree,
      if (ticketQuantity != null) 'ticket_quantity': ticketQuantity,
      if (maxQuantity != null) 'max_quantity': maxQuantity,
      if (discountUnit != null) 'discount_unit': discountUnit,
      if (minQuantity != null) 'min_quantity': minQuantity,
      if (description != null) 'description': description,
      if (eventStartDate != null) 'event_start_date': eventStartDate,
      if (eventEndDate != null) 'event_end_date': eventEndDate,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
    });
  }

  ETTicketInfoEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<double> id,
      Value<double> idTicketInfo,
      Value<double> eventId,
      Value<double> remainingTicketQuantity,
      Value<String> ticketName,
      Value<double> ticketPrice,
      Value<double> isFree,
      Value<double> ticketQuantity,
      Value<double> maxQuantity,
      Value<double> discountUnit,
      Value<double> minQuantity,
      Value<String> description,
      Value<String> eventStartDate,
      Value<String> eventEndDate,
      Value<String> startDate,
      Value<String> endDate}) {
    return ETTicketInfoEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      id: id ?? this.id,
      idTicketInfo: idTicketInfo ?? this.idTicketInfo,
      eventId: eventId ?? this.eventId,
      remainingTicketQuantity:
          remainingTicketQuantity ?? this.remainingTicketQuantity,
      ticketName: ticketName ?? this.ticketName,
      ticketPrice: ticketPrice ?? this.ticketPrice,
      isFree: isFree ?? this.isFree,
      ticketQuantity: ticketQuantity ?? this.ticketQuantity,
      maxQuantity: maxQuantity ?? this.maxQuantity,
      discountUnit: discountUnit ?? this.discountUnit,
      minQuantity: minQuantity ?? this.minQuantity,
      description: description ?? this.description,
      eventStartDate: eventStartDate ?? this.eventStartDate,
      eventEndDate: eventEndDate ?? this.eventEndDate,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (id.present) {
      map['id'] = Variable<double>(id.value);
    }
    if (idTicketInfo.present) {
      map['id_ticket_info'] = Variable<double>(idTicketInfo.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<double>(eventId.value);
    }
    if (remainingTicketQuantity.present) {
      map['remaining_ticket_quantity'] =
          Variable<double>(remainingTicketQuantity.value);
    }
    if (ticketName.present) {
      map['ticket_name'] = Variable<String>(ticketName.value);
    }
    if (ticketPrice.present) {
      map['ticket_price'] = Variable<double>(ticketPrice.value);
    }
    if (isFree.present) {
      map['is_free'] = Variable<double>(isFree.value);
    }
    if (ticketQuantity.present) {
      map['ticket_quantity'] = Variable<double>(ticketQuantity.value);
    }
    if (maxQuantity.present) {
      map['max_quantity'] = Variable<double>(maxQuantity.value);
    }
    if (discountUnit.present) {
      map['discount_unit'] = Variable<double>(discountUnit.value);
    }
    if (minQuantity.present) {
      map['min_quantity'] = Variable<double>(minQuantity.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (eventStartDate.present) {
      map['event_start_date'] = Variable<String>(eventStartDate.value);
    }
    if (eventEndDate.present) {
      map['event_end_date'] = Variable<String>(eventEndDate.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<String>(endDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ETTicketInfoEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('id: $id, ')
          ..write('idTicketInfo: $idTicketInfo, ')
          ..write('eventId: $eventId, ')
          ..write('remainingTicketQuantity: $remainingTicketQuantity, ')
          ..write('ticketName: $ticketName, ')
          ..write('ticketPrice: $ticketPrice, ')
          ..write('isFree: $isFree, ')
          ..write('ticketQuantity: $ticketQuantity, ')
          ..write('maxQuantity: $maxQuantity, ')
          ..write('discountUnit: $discountUnit, ')
          ..write('minQuantity: $minQuantity, ')
          ..write('description: $description, ')
          ..write('eventStartDate: $eventStartDate, ')
          ..write('eventEndDate: $eventEndDate, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }
}

class $ETTicketInfoEntityTable extends ETTicketInfoEntity
    with TableInfo<$ETTicketInfoEntityTable, ETTicketInfoAllEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $ETTicketInfoEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedRealColumn _id;
  @override
  GeneratedRealColumn get id => _id ??= _constructId();
  GeneratedRealColumn _constructId() {
    return GeneratedRealColumn(
      'id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idTicketInfoMeta =
      const VerificationMeta('idTicketInfo');
  GeneratedRealColumn _idTicketInfo;
  @override
  GeneratedRealColumn get idTicketInfo =>
      _idTicketInfo ??= _constructIdTicketInfo();
  GeneratedRealColumn _constructIdTicketInfo() {
    return GeneratedRealColumn(
      'id_ticket_info',
      $tableName,
      false,
    );
  }

  final VerificationMeta _eventIdMeta = const VerificationMeta('eventId');
  GeneratedRealColumn _eventId;
  @override
  GeneratedRealColumn get eventId => _eventId ??= _constructEventId();
  GeneratedRealColumn _constructEventId() {
    return GeneratedRealColumn(
      'event_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _remainingTicketQuantityMeta =
      const VerificationMeta('remainingTicketQuantity');
  GeneratedRealColumn _remainingTicketQuantity;
  @override
  GeneratedRealColumn get remainingTicketQuantity =>
      _remainingTicketQuantity ??= _constructRemainingTicketQuantity();
  GeneratedRealColumn _constructRemainingTicketQuantity() {
    return GeneratedRealColumn(
      'remaining_ticket_quantity',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ticketNameMeta = const VerificationMeta('ticketName');
  GeneratedTextColumn _ticketName;
  @override
  GeneratedTextColumn get ticketName => _ticketName ??= _constructTicketName();
  GeneratedTextColumn _constructTicketName() {
    return GeneratedTextColumn(
      'ticket_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ticketPriceMeta =
      const VerificationMeta('ticketPrice');
  GeneratedRealColumn _ticketPrice;
  @override
  GeneratedRealColumn get ticketPrice =>
      _ticketPrice ??= _constructTicketPrice();
  GeneratedRealColumn _constructTicketPrice() {
    return GeneratedRealColumn(
      'ticket_price',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isFreeMeta = const VerificationMeta('isFree');
  GeneratedRealColumn _isFree;
  @override
  GeneratedRealColumn get isFree => _isFree ??= _constructIsFree();
  GeneratedRealColumn _constructIsFree() {
    return GeneratedRealColumn(
      'is_free',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ticketQuantityMeta =
      const VerificationMeta('ticketQuantity');
  GeneratedRealColumn _ticketQuantity;
  @override
  GeneratedRealColumn get ticketQuantity =>
      _ticketQuantity ??= _constructTicketQuantity();
  GeneratedRealColumn _constructTicketQuantity() {
    return GeneratedRealColumn(
      'ticket_quantity',
      $tableName,
      true,
    );
  }

  final VerificationMeta _maxQuantityMeta =
      const VerificationMeta('maxQuantity');
  GeneratedRealColumn _maxQuantity;
  @override
  GeneratedRealColumn get maxQuantity =>
      _maxQuantity ??= _constructMaxQuantity();
  GeneratedRealColumn _constructMaxQuantity() {
    return GeneratedRealColumn(
      'max_quantity',
      $tableName,
      true,
    );
  }

  final VerificationMeta _discountUnitMeta =
      const VerificationMeta('discountUnit');
  GeneratedRealColumn _discountUnit;
  @override
  GeneratedRealColumn get discountUnit =>
      _discountUnit ??= _constructDiscountUnit();
  GeneratedRealColumn _constructDiscountUnit() {
    return GeneratedRealColumn(
      'discount_unit',
      $tableName,
      true,
    );
  }

  final VerificationMeta _minQuantityMeta =
      const VerificationMeta('minQuantity');
  GeneratedRealColumn _minQuantity;
  @override
  GeneratedRealColumn get minQuantity =>
      _minQuantity ??= _constructMinQuantity();
  GeneratedRealColumn _constructMinQuantity() {
    return GeneratedRealColumn(
      'min_quantity',
      $tableName,
      true,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _eventStartDateMeta =
      const VerificationMeta('eventStartDate');
  GeneratedTextColumn _eventStartDate;
  @override
  GeneratedTextColumn get eventStartDate =>
      _eventStartDate ??= _constructEventStartDate();
  GeneratedTextColumn _constructEventStartDate() {
    return GeneratedTextColumn(
      'event_start_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _eventEndDateMeta =
      const VerificationMeta('eventEndDate');
  GeneratedTextColumn _eventEndDate;
  @override
  GeneratedTextColumn get eventEndDate =>
      _eventEndDate ??= _constructEventEndDate();
  GeneratedTextColumn _constructEventEndDate() {
    return GeneratedTextColumn(
      'event_end_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _startDateMeta = const VerificationMeta('startDate');
  GeneratedTextColumn _startDate;
  @override
  GeneratedTextColumn get startDate => _startDate ??= _constructStartDate();
  GeneratedTextColumn _constructStartDate() {
    return GeneratedTextColumn(
      'start_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _endDateMeta = const VerificationMeta('endDate');
  GeneratedTextColumn _endDate;
  @override
  GeneratedTextColumn get endDate => _endDate ??= _constructEndDate();
  GeneratedTextColumn _constructEndDate() {
    return GeneratedTextColumn(
      'end_date',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        id,
        idTicketInfo,
        eventId,
        remainingTicketQuantity,
        ticketName,
        ticketPrice,
        isFree,
        ticketQuantity,
        maxQuantity,
        discountUnit,
        minQuantity,
        description,
        eventStartDate,
        eventEndDate,
        startDate,
        endDate
      ];
  @override
  $ETTicketInfoEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_et_ticket_info';
  @override
  final String actualTableName = 'cip_today_et_ticket_info';
  @override
  VerificationContext validateIntegrity(
      Insertable<ETTicketInfoAllEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_ticket_info')) {
      context.handle(
          _idTicketInfoMeta,
          idTicketInfo.isAcceptableOrUnknown(
              data['id_ticket_info'], _idTicketInfoMeta));
    } else if (isInserting) {
      context.missing(_idTicketInfoMeta);
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id'], _eventIdMeta));
    }
    if (data.containsKey('remaining_ticket_quantity')) {
      context.handle(
          _remainingTicketQuantityMeta,
          remainingTicketQuantity.isAcceptableOrUnknown(
              data['remaining_ticket_quantity'], _remainingTicketQuantityMeta));
    }
    if (data.containsKey('ticket_name')) {
      context.handle(
          _ticketNameMeta,
          ticketName.isAcceptableOrUnknown(
              data['ticket_name'], _ticketNameMeta));
    }
    if (data.containsKey('ticket_price')) {
      context.handle(
          _ticketPriceMeta,
          ticketPrice.isAcceptableOrUnknown(
              data['ticket_price'], _ticketPriceMeta));
    }
    if (data.containsKey('is_free')) {
      context.handle(_isFreeMeta,
          isFree.isAcceptableOrUnknown(data['is_free'], _isFreeMeta));
    }
    if (data.containsKey('ticket_quantity')) {
      context.handle(
          _ticketQuantityMeta,
          ticketQuantity.isAcceptableOrUnknown(
              data['ticket_quantity'], _ticketQuantityMeta));
    }
    if (data.containsKey('max_quantity')) {
      context.handle(
          _maxQuantityMeta,
          maxQuantity.isAcceptableOrUnknown(
              data['max_quantity'], _maxQuantityMeta));
    }
    if (data.containsKey('discount_unit')) {
      context.handle(
          _discountUnitMeta,
          discountUnit.isAcceptableOrUnknown(
              data['discount_unit'], _discountUnitMeta));
    }
    if (data.containsKey('min_quantity')) {
      context.handle(
          _minQuantityMeta,
          minQuantity.isAcceptableOrUnknown(
              data['min_quantity'], _minQuantityMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('event_start_date')) {
      context.handle(
          _eventStartDateMeta,
          eventStartDate.isAcceptableOrUnknown(
              data['event_start_date'], _eventStartDateMeta));
    }
    if (data.containsKey('event_end_date')) {
      context.handle(
          _eventEndDateMeta,
          eventEndDate.isAcceptableOrUnknown(
              data['event_end_date'], _eventEndDateMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date'], _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date'], _endDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ETTicketInfoAllEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ETTicketInfoAllEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ETTicketInfoEntityTable createAlias(String alias) {
    return $ETTicketInfoEntityTable(_db, alias);
  }
}

class ETPaymentTypeAllEntry extends DataClass
    implements Insertable<ETPaymentTypeAllEntry> {
  final String createdBy;
  final DateTime createdDate;
  final String updatedBy;
  final DateTime updatedDate;
  final String deletedBy;
  final DateTime deletedDate;
  final double eventId;
  final String settingCode;
  final String settingValue;
  ETPaymentTypeAllEntry(
      {this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      this.eventId,
      this.settingCode,
      this.settingValue});
  factory ETPaymentTypeAllEntry.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return ETPaymentTypeAllEntry(
      createdBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_by']),
      createdDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_date']),
      updatedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_by']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
      deletedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_by']),
      deletedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_date']),
      eventId: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}event_id']),
      settingCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}setting_code']),
      settingValue: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}setting_value']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    if (!nullToAbsent || updatedBy != null) {
      map['updated_by'] = Variable<String>(updatedBy);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    if (!nullToAbsent || deletedBy != null) {
      map['deleted_by'] = Variable<String>(deletedBy);
    }
    if (!nullToAbsent || deletedDate != null) {
      map['deleted_date'] = Variable<DateTime>(deletedDate);
    }
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<double>(eventId);
    }
    if (!nullToAbsent || settingCode != null) {
      map['setting_code'] = Variable<String>(settingCode);
    }
    if (!nullToAbsent || settingValue != null) {
      map['setting_value'] = Variable<String>(settingValue);
    }
    return map;
  }

  ETPaymentTypeEntityCompanion toCompanion(bool nullToAbsent) {
    return ETPaymentTypeEntityCompanion(
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
      updatedBy: updatedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedBy),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
      deletedBy: deletedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedBy),
      deletedDate: deletedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedDate),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      settingCode: settingCode == null && nullToAbsent
          ? const Value.absent()
          : Value(settingCode),
      settingValue: settingValue == null && nullToAbsent
          ? const Value.absent()
          : Value(settingValue),
    );
  }

  factory ETPaymentTypeAllEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ETPaymentTypeAllEntry(
      createdBy: serializer.fromJson<String>(json['createdBy']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedBy: serializer.fromJson<String>(json['updatedBy']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      deletedBy: serializer.fromJson<String>(json['deletedBy']),
      deletedDate: serializer.fromJson<DateTime>(json['deletedDate']),
      eventId: serializer.fromJson<double>(json['eventId']),
      settingCode: serializer.fromJson<String>(json['settingCode']),
      settingValue: serializer.fromJson<String>(json['settingValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdBy': serializer.toJson<String>(createdBy),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedBy': serializer.toJson<String>(updatedBy),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'deletedBy': serializer.toJson<String>(deletedBy),
      'deletedDate': serializer.toJson<DateTime>(deletedDate),
      'eventId': serializer.toJson<double>(eventId),
      'settingCode': serializer.toJson<String>(settingCode),
      'settingValue': serializer.toJson<String>(settingValue),
    };
  }

  ETPaymentTypeAllEntry copyWith(
          {String createdBy,
          DateTime createdDate,
          String updatedBy,
          DateTime updatedDate,
          String deletedBy,
          DateTime deletedDate,
          double eventId,
          String settingCode,
          String settingValue}) =>
      ETPaymentTypeAllEntry(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        updatedBy: updatedBy ?? this.updatedBy,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedDate: deletedDate ?? this.deletedDate,
        eventId: eventId ?? this.eventId,
        settingCode: settingCode ?? this.settingCode,
        settingValue: settingValue ?? this.settingValue,
      );
  @override
  String toString() {
    return (StringBuffer('ETPaymentTypeAllEntry(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('eventId: $eventId, ')
          ..write('settingCode: $settingCode, ')
          ..write('settingValue: $settingValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      createdBy.hashCode,
      $mrjc(
          createdDate.hashCode,
          $mrjc(
              updatedBy.hashCode,
              $mrjc(
                  updatedDate.hashCode,
                  $mrjc(
                      deletedBy.hashCode,
                      $mrjc(
                          deletedDate.hashCode,
                          $mrjc(
                              eventId.hashCode,
                              $mrjc(settingCode.hashCode,
                                  settingValue.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ETPaymentTypeAllEntry &&
          other.createdBy == this.createdBy &&
          other.createdDate == this.createdDate &&
          other.updatedBy == this.updatedBy &&
          other.updatedDate == this.updatedDate &&
          other.deletedBy == this.deletedBy &&
          other.deletedDate == this.deletedDate &&
          other.eventId == this.eventId &&
          other.settingCode == this.settingCode &&
          other.settingValue == this.settingValue);
}

class ETPaymentTypeEntityCompanion
    extends UpdateCompanion<ETPaymentTypeAllEntry> {
  final Value<String> createdBy;
  final Value<DateTime> createdDate;
  final Value<String> updatedBy;
  final Value<DateTime> updatedDate;
  final Value<String> deletedBy;
  final Value<DateTime> deletedDate;
  final Value<double> eventId;
  final Value<String> settingCode;
  final Value<String> settingValue;
  const ETPaymentTypeEntityCompanion({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.eventId = const Value.absent(),
    this.settingCode = const Value.absent(),
    this.settingValue = const Value.absent(),
  });
  ETPaymentTypeEntityCompanion.insert({
    this.createdBy = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedBy = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.deletedBy = const Value.absent(),
    this.deletedDate = const Value.absent(),
    this.eventId = const Value.absent(),
    this.settingCode = const Value.absent(),
    this.settingValue = const Value.absent(),
  });
  static Insertable<ETPaymentTypeAllEntry> custom({
    Expression<String> createdBy,
    Expression<DateTime> createdDate,
    Expression<String> updatedBy,
    Expression<DateTime> updatedDate,
    Expression<String> deletedBy,
    Expression<DateTime> deletedDate,
    Expression<double> eventId,
    Expression<String> settingCode,
    Expression<String> settingValue,
  }) {
    return RawValuesInsertable({
      if (createdBy != null) 'created_by': createdBy,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedBy != null) 'updated_by': updatedBy,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (deletedBy != null) 'deleted_by': deletedBy,
      if (deletedDate != null) 'deleted_date': deletedDate,
      if (eventId != null) 'event_id': eventId,
      if (settingCode != null) 'setting_code': settingCode,
      if (settingValue != null) 'setting_value': settingValue,
    });
  }

  ETPaymentTypeEntityCompanion copyWith(
      {Value<String> createdBy,
      Value<DateTime> createdDate,
      Value<String> updatedBy,
      Value<DateTime> updatedDate,
      Value<String> deletedBy,
      Value<DateTime> deletedDate,
      Value<double> eventId,
      Value<String> settingCode,
      Value<String> settingValue}) {
    return ETPaymentTypeEntityCompanion(
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedBy: deletedBy ?? this.deletedBy,
      deletedDate: deletedDate ?? this.deletedDate,
      eventId: eventId ?? this.eventId,
      settingCode: settingCode ?? this.settingCode,
      settingValue: settingValue ?? this.settingValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedBy.present) {
      map['updated_by'] = Variable<String>(updatedBy.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (deletedBy.present) {
      map['deleted_by'] = Variable<String>(deletedBy.value);
    }
    if (deletedDate.present) {
      map['deleted_date'] = Variable<DateTime>(deletedDate.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<double>(eventId.value);
    }
    if (settingCode.present) {
      map['setting_code'] = Variable<String>(settingCode.value);
    }
    if (settingValue.present) {
      map['setting_value'] = Variable<String>(settingValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ETPaymentTypeEntityCompanion(')
          ..write('createdBy: $createdBy, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedBy: $updatedBy, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('deletedBy: $deletedBy, ')
          ..write('deletedDate: $deletedDate, ')
          ..write('eventId: $eventId, ')
          ..write('settingCode: $settingCode, ')
          ..write('settingValue: $settingValue')
          ..write(')'))
        .toString();
  }
}

class $ETPaymentTypeEntityTable extends ETPaymentTypeEntity
    with TableInfo<$ETPaymentTypeEntityTable, ETPaymentTypeAllEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $ETPaymentTypeEntityTable(this._db, [this._alias]);
  final VerificationMeta _createdByMeta = const VerificationMeta('createdBy');
  GeneratedTextColumn _createdBy;
  @override
  GeneratedTextColumn get createdBy => _createdBy ??= _constructCreatedBy();
  GeneratedTextColumn _constructCreatedBy() {
    return GeneratedTextColumn(
      'created_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  GeneratedDateTimeColumn _createdDate;
  @override
  GeneratedDateTimeColumn get createdDate =>
      _createdDate ??= _constructCreatedDate();
  GeneratedDateTimeColumn _constructCreatedDate() {
    return GeneratedDateTimeColumn(
      'created_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedByMeta = const VerificationMeta('updatedBy');
  GeneratedTextColumn _updatedBy;
  @override
  GeneratedTextColumn get updatedBy => _updatedBy ??= _constructUpdatedBy();
  GeneratedTextColumn _constructUpdatedBy() {
    return GeneratedTextColumn(
      'updated_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedByMeta = const VerificationMeta('deletedBy');
  GeneratedTextColumn _deletedBy;
  @override
  GeneratedTextColumn get deletedBy => _deletedBy ??= _constructDeletedBy();
  GeneratedTextColumn _constructDeletedBy() {
    return GeneratedTextColumn(
      'deleted_by',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedDateMeta =
      const VerificationMeta('deletedDate');
  GeneratedDateTimeColumn _deletedDate;
  @override
  GeneratedDateTimeColumn get deletedDate =>
      _deletedDate ??= _constructDeletedDate();
  GeneratedDateTimeColumn _constructDeletedDate() {
    return GeneratedDateTimeColumn(
      'deleted_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _eventIdMeta = const VerificationMeta('eventId');
  GeneratedRealColumn _eventId;
  @override
  GeneratedRealColumn get eventId => _eventId ??= _constructEventId();
  GeneratedRealColumn _constructEventId() {
    return GeneratedRealColumn(
      'event_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _settingCodeMeta =
      const VerificationMeta('settingCode');
  GeneratedTextColumn _settingCode;
  @override
  GeneratedTextColumn get settingCode =>
      _settingCode ??= _constructSettingCode();
  GeneratedTextColumn _constructSettingCode() {
    return GeneratedTextColumn(
      'setting_code',
      $tableName,
      true,
    );
  }

  final VerificationMeta _settingValueMeta =
      const VerificationMeta('settingValue');
  GeneratedTextColumn _settingValue;
  @override
  GeneratedTextColumn get settingValue =>
      _settingValue ??= _constructSettingValue();
  GeneratedTextColumn _constructSettingValue() {
    return GeneratedTextColumn(
      'setting_value',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        deletedBy,
        deletedDate,
        eventId,
        settingCode,
        settingValue
      ];
  @override
  $ETPaymentTypeEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cip_today_et_payment_type';
  @override
  final String actualTableName = 'cip_today_et_payment_type';
  @override
  VerificationContext validateIntegrity(
      Insertable<ETPaymentTypeAllEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by'], _createdByMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date'], _createdDateMeta));
    }
    if (data.containsKey('updated_by')) {
      context.handle(_updatedByMeta,
          updatedBy.isAcceptableOrUnknown(data['updated_by'], _updatedByMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    }
    if (data.containsKey('deleted_by')) {
      context.handle(_deletedByMeta,
          deletedBy.isAcceptableOrUnknown(data['deleted_by'], _deletedByMeta));
    }
    if (data.containsKey('deleted_date')) {
      context.handle(
          _deletedDateMeta,
          deletedDate.isAcceptableOrUnknown(
              data['deleted_date'], _deletedDateMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id'], _eventIdMeta));
    }
    if (data.containsKey('setting_code')) {
      context.handle(
          _settingCodeMeta,
          settingCode.isAcceptableOrUnknown(
              data['setting_code'], _settingCodeMeta));
    }
    if (data.containsKey('setting_value')) {
      context.handle(
          _settingValueMeta,
          settingValue.isAcceptableOrUnknown(
              data['setting_value'], _settingValueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {eventId, settingCode};
  @override
  ETPaymentTypeAllEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ETPaymentTypeAllEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ETPaymentTypeEntityTable createAlias(String alias) {
    return $ETPaymentTypeEntityTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $EventTodayEntityTable _eventTodayEntity;
  $EventTodayEntityTable get eventTodayEntity =>
      _eventTodayEntity ??= $EventTodayEntityTable(this);
  $EventCheckInSyncEntityTable _eventCheckInSyncEntity;
  $EventCheckInSyncEntityTable get eventCheckInSyncEntity =>
      _eventCheckInSyncEntity ??= $EventCheckInSyncEntityTable(this);
  $EventGuestAllEntityTable _eventGuestAllEntity;
  $EventGuestAllEntityTable get eventGuestAllEntity =>
      _eventGuestAllEntity ??= $EventGuestAllEntityTable(this);
  $InvitationExpectedEntityTable _invitationExpectedEntity;
  $InvitationExpectedEntityTable get invitationExpectedEntity =>
      _invitationExpectedEntity ??= $InvitationExpectedEntityTable(this);
  $MyVisitorLogTodayEntityTable _myVisitorLogTodayEntity;
  $MyVisitorLogTodayEntityTable get myVisitorLogTodayEntity =>
      _myVisitorLogTodayEntity ??= $MyVisitorLogTodayEntityTable(this);
  $CheckInTimeTodayEntityTable _checkInTimeTodayEntity;
  $CheckInTimeTodayEntityTable get checkInTimeTodayEntity =>
      _checkInTimeTodayEntity ??= $CheckInTimeTodayEntityTable(this);
  $WorkingTimeEntityTable _workingTimeEntity;
  $WorkingTimeEntityTable get workingTimeEntity =>
      _workingTimeEntity ??= $WorkingTimeEntityTable(this);
  $MyVisitorLogEntityTable _myVisitorLogEntity;
  $MyVisitorLogEntityTable get myVisitorLogEntity =>
      _myVisitorLogEntity ??= $MyVisitorLogEntityTable(this);
  $VisitorInvitationEntityTable _visitorInvitationEntity;
  $VisitorInvitationEntityTable get visitorInvitationEntity =>
      _visitorInvitationEntity ??= $VisitorInvitationEntityTable(this);
  $MyInvitationEntityTable _myInvitationEntity;
  $MyInvitationEntityTable get myInvitationEntity =>
      _myInvitationEntity ??= $MyInvitationEntityTable(this);
  $VisitorInviteCheckinSyncEntityTable _visitorInviteCheckinSyncEntity;
  $VisitorInviteCheckinSyncEntityTable get visitorInviteCheckinSyncEntity =>
      _visitorInviteCheckinSyncEntity ??=
          $VisitorInviteCheckinSyncEntityTable(this);
  $AttendanceDetailEntityTable _attendanceDetailEntity;
  $AttendanceDetailEntityTable get attendanceDetailEntity =>
      _attendanceDetailEntity ??= $AttendanceDetailEntityTable(this);
  $AttendanceStatisticEntityTable _attendanceStatisticEntity;
  $AttendanceStatisticEntityTable get attendanceStatisticEntity =>
      _attendanceStatisticEntity ??= $AttendanceStatisticEntityTable(this);
  $WelcomeMessageEntityTable _welcomeMessageEntity;
  $WelcomeMessageEntityTable get welcomeMessageEntity =>
      _welcomeMessageEntity ??= $WelcomeMessageEntityTable(this);
  $ImageDownloadedEntityTable _imageDownloadedEntity;
  $ImageDownloadedEntityTable get imageDownloadedEntity =>
      _imageDownloadedEntity ??= $ImageDownloadedEntityTable(this);
  $ReminderInvitationEntityTable _reminderInvitationEntity;
  $ReminderInvitationEntityTable get reminderInvitationEntity =>
      _reminderInvitationEntity ??= $ReminderInvitationEntityTable(this);
  $EventTicketEntityTable _eventTicketEntity;
  $EventTicketEntityTable get eventTicketEntity =>
      _eventTicketEntity ??= $EventTicketEntityTable(this);
  $ETBookingConfigInforEntityTable _eTBookingConfigInforEntity;
  $ETBookingConfigInforEntityTable get eTBookingConfigInforEntity =>
      _eTBookingConfigInforEntity ??= $ETBookingConfigInforEntityTable(this);
  $ETOrderDetailInfoEntityTable _eTOrderDetailInfoEntity;
  $ETOrderDetailInfoEntityTable get eTOrderDetailInfoEntity =>
      _eTOrderDetailInfoEntity ??= $ETOrderDetailInfoEntityTable(this);
  $ETOrderInfoEntityTable _eTOrderInfoEntity;
  $ETOrderInfoEntityTable get eTOrderInfoEntity =>
      _eTOrderInfoEntity ??= $ETOrderInfoEntityTable(this);
  $ETPayMentInfoEntityTable _eTPayMentInfoEntity;
  $ETPayMentInfoEntityTable get eTPayMentInfoEntity =>
      _eTPayMentInfoEntity ??= $ETPayMentInfoEntityTable(this);
  $ETGuestInfoEntityTable _eTGuestInfoEntity;
  $ETGuestInfoEntityTable get eTGuestInfoEntity =>
      _eTGuestInfoEntity ??= $ETGuestInfoEntityTable(this);
  $ETBookingDiscountInfoEntityTable _eTBookingDiscountInfoEntity;
  $ETBookingDiscountInfoEntityTable get eTBookingDiscountInfoEntity =>
      _eTBookingDiscountInfoEntity ??= $ETBookingDiscountInfoEntityTable(this);
  $ETTicketInfoEntityTable _eTTicketInfoEntity;
  $ETTicketInfoEntityTable get eTTicketInfoEntity =>
      _eTTicketInfoEntity ??= $ETTicketInfoEntityTable(this);
  $ETPaymentTypeEntityTable _eTPaymentTypeEntity;
  $ETPaymentTypeEntityTable get eTPaymentTypeEntity =>
      _eTPaymentTypeEntity ??= $ETPaymentTypeEntityTable(this);
  EventTodayDAO _eventTodayDAO;
  EventTodayDAO get eventTodayDAO =>
      _eventTodayDAO ??= EventTodayDAO(this as Database);
  EventGuestDAO _eventGuestDAO;
  EventGuestDAO get eventGuestDAO =>
      _eventGuestDAO ??= EventGuestDAO(this as Database);
  InvitationExpectedDAO _invitationExpectedDAO;
  InvitationExpectedDAO get invitationExpectedDAO =>
      _invitationExpectedDAO ??= InvitationExpectedDAO(this as Database);
  MyVisitorLogTodayDAO _myVisitorLogTodayDAO;
  MyVisitorLogTodayDAO get myVisitorLogTodayDAO =>
      _myVisitorLogTodayDAO ??= MyVisitorLogTodayDAO(this as Database);
  CheckInTimeTodayDAO _checkInTimeTodayDAO;
  CheckInTimeTodayDAO get checkInTimeTodayDAO =>
      _checkInTimeTodayDAO ??= CheckInTimeTodayDAO(this as Database);
  WorkingTimeDAO _workingTimeDAO;
  WorkingTimeDAO get workingTimeDAO =>
      _workingTimeDAO ??= WorkingTimeDAO(this as Database);
  MyVisitorLogDAO _myVisitorLogDAO;
  MyVisitorLogDAO get myVisitorLogDAO =>
      _myVisitorLogDAO ??= MyVisitorLogDAO(this as Database);
  MyInvitationDAO _myInvitationDAO;
  MyInvitationDAO get myInvitationDAO =>
      _myInvitationDAO ??= MyInvitationDAO(this as Database);
  VisitorInvitationDAO _visitorInvitationDAO;
  VisitorInvitationDAO get visitorInvitationDAO =>
      _visitorInvitationDAO ??= VisitorInvitationDAO(this as Database);
  VisitorInviteCheckinSyncDAO _visitorInviteCheckinSyncDAO;
  VisitorInviteCheckinSyncDAO get visitorInviteCheckinSyncDAO =>
      _visitorInviteCheckinSyncDAO ??=
          VisitorInviteCheckinSyncDAO(this as Database);
  AttendanceDetailDAO _attendanceDetailDAO;
  AttendanceDetailDAO get attendanceDetailDAO =>
      _attendanceDetailDAO ??= AttendanceDetailDAO(this as Database);
  AttendanceStatisticDAO _attendanceStatisticDAO;
  AttendanceStatisticDAO get attendanceStatisticDAO =>
      _attendanceStatisticDAO ??= AttendanceStatisticDAO(this as Database);
  WelcomeMessageDAO _welcomeMessageDAO;
  WelcomeMessageDAO get welcomeMessageDAO =>
      _welcomeMessageDAO ??= WelcomeMessageDAO(this as Database);
  ImageDownloadedDAO _imageDownloadedDAO;
  ImageDownloadedDAO get imageDownloadedDAO =>
      _imageDownloadedDAO ??= ImageDownloadedDAO(this as Database);
  ReminderInvitationDAO _reminderInvitationDAO;
  ReminderInvitationDAO get reminderInvitationDAO =>
      _reminderInvitationDAO ??= ReminderInvitationDAO(this as Database);
  EventTicketDAO _eventTicketDAO;
  EventTicketDAO get eventTicketDAO =>
      _eventTicketDAO ??= EventTicketDAO(this as Database);
  ETBookingConfigInforDAO _eTBookingConfigInforDAO;
  ETBookingConfigInforDAO get eTBookingConfigInforDAO =>
      _eTBookingConfigInforDAO ??= ETBookingConfigInforDAO(this as Database);
  ETOrderDetailInfoDAO _eTOrderDetailInfoDAO;
  ETOrderDetailInfoDAO get eTOrderDetailInfoDAO =>
      _eTOrderDetailInfoDAO ??= ETOrderDetailInfoDAO(this as Database);
  ETOrderInfoDAO _eTOrderInfoDAO;
  ETOrderInfoDAO get eTOrderInfoDAO =>
      _eTOrderInfoDAO ??= ETOrderInfoDAO(this as Database);
  ETPayMentInfoDAO _eTPayMentInfoDAO;
  ETPayMentInfoDAO get eTPayMentInfoDAO =>
      _eTPayMentInfoDAO ??= ETPayMentInfoDAO(this as Database);
  ETGuestInfoDAO _eTGuestInfoDAO;
  ETGuestInfoDAO get eTGuestInfoDAO =>
      _eTGuestInfoDAO ??= ETGuestInfoDAO(this as Database);
  ETBookingDiscountInfoDAO _eTBookingDiscountInfoDAO;
  ETBookingDiscountInfoDAO get eTBookingDiscountInfoDAO =>
      _eTBookingDiscountInfoDAO ??= ETBookingDiscountInfoDAO(this as Database);
  ETTicketInfoDAO _eTTicketInfoDAO;
  ETTicketInfoDAO get eTTicketInfoDAO =>
      _eTTicketInfoDAO ??= ETTicketInfoDAO(this as Database);
  ETPaymentTypeDAO _eTPaymentTypeDAO;
  ETPaymentTypeDAO get eTPaymentTypeDAO =>
      _eTPaymentTypeDAO ??= ETPaymentTypeDAO(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        eventTodayEntity,
        eventCheckInSyncEntity,
        eventGuestAllEntity,
        invitationExpectedEntity,
        myVisitorLogTodayEntity,
        checkInTimeTodayEntity,
        workingTimeEntity,
        myVisitorLogEntity,
        visitorInvitationEntity,
        myInvitationEntity,
        visitorInviteCheckinSyncEntity,
        attendanceDetailEntity,
        attendanceStatisticEntity,
        welcomeMessageEntity,
        imageDownloadedEntity,
        reminderInvitationEntity,
        eventTicketEntity,
        eTBookingConfigInforEntity,
        eTOrderDetailInfoEntity,
        eTOrderInfoEntity,
        eTPayMentInfoEntity,
        eTGuestInfoEntity,
        eTBookingDiscountInfoEntity,
        eTTicketInfoEntity,
        eTPaymentTypeEntity
      ];
}
