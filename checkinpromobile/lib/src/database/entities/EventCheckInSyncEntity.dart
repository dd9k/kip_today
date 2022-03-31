import 'package:moor/moor.dart';
import 'package:uuid/uuid.dart';

import 'TableCommonEntity.dart';

@DataClassName("EventCheckInSyncEntry")
class EventCheckInSyncEntity extends TableCommonEntity {
  final uuid = Uuid();
  String get tableName => 'cip_today_event_checkin_sync';

  IntColumn get idSync => integer().autoIncrement()();
  RealColumn get guestId => real()();
  RealColumn get eventId => real()();

  /// 0: not in sync
  ///
  /// 1: synchronized
  BoolColumn get isSync => boolean().nullable()();
  TextColumn get statusSync => text().nullable()();

  TextColumn get timeZone => text().nullable()();
  RealColumn get contactPersonId => real().nullable()();
  TextColumn get visitorName => text().nullable()();
  TextColumn get visitorEmail => text().nullable()();
  TextColumn get visitorPhoneNumber => text().nullable()();
  TextColumn get visitorType => text().nullable()();
  RealColumn get branchId => real().nullable()();
  TextColumn get inviteCode => text().nullable()();
  DateTimeColumn get signIn => dateTime().nullable()();
  DateTimeColumn get signOut => dateTime().nullable()();
}
