import 'package:moor/moor.dart';
import 'TableCommonEntity.dart';

@DataClassName("EventGuestAllEntry")
class EventGuestAllEntity extends TableCommonEntity {
  String get tableName => 'cip_today_event_guest_all';

  IntColumn get id => integer().autoIncrement()();

  RealColumn get guestId => real()();
  RealColumn get eventId => real()();
  TextColumn get visitorName => text().nullable()();
  TextColumn get visitorEmail => text().nullable()();
  TextColumn get visitorPhoneNumber => text().nullable()();
  TextColumn get visitorCompany => text().nullable()();
  TextColumn get visitorType => text().nullable()();
  TextColumn get inviteCode => text().nullable()();
  RealColumn get emailLogId => real().nullable()();
  TextColumn get description => text().nullable()();
  RealColumn get visitorLogId => real().nullable()();
  TextColumn get timeZone => text().nullable()();
  DateTimeColumn get signIn => dateTime().nullable()();
  DateTimeColumn get signOut => dateTime().nullable()();
  IntColumn get totalCount => integer().nullable()();
  IntColumn get checkinStatus => integer().nullable()();
}
