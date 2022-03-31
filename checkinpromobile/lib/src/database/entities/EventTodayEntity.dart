import 'package:moor/moor.dart';

import 'TableCommonEntity.dart';

@DataClassName("EventTodayEntry")
class EventTodayEntity extends TableCommonEntity {
  String get tableName => 'cip_today_event_today';

  RealColumn get eventId => real()();
  TextColumn get coverPathFile => text().nullable()();
  TextColumn get eventName => text().nullable()();
  RealColumn get branchId => real().nullable()();
  RealColumn get contactPersonId => real().nullable()();
  TextColumn get visitorType => text().nullable()();
  TextColumn get contactPersonName => text().nullable()();
  TextColumn get contactPersonEmail => text().nullable()();
  TextColumn get visitorTypeValue => text().nullable()();
  RealColumn get companyId => real().nullable()();
  TextColumn get siteName => text().nullable()();
  TextColumn get siteAddress => text().nullable()();
  DateTimeColumn get startDateEvent => dateTime().nullable()();
  DateTimeColumn get endDateEvent => dateTime().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get notifySetting => text().nullable()();
  TextColumn get badgeTemplateId => text().nullable()();
  IntColumn get isPrint => integer().nullable()();
  TextColumn get branchName => text().nullable()();

  @override
  Set<Column> get primaryKey => {eventId};
}
