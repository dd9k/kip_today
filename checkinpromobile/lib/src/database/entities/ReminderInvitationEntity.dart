import 'package:checkinpromobile/src/database/entities/TableCommonEntity.dart';
import 'package:moor/moor.dart';

@DataClassName('ReminderInvitationEntry')
class ReminderInvitationEntity extends TableCommonEntity {
  String get tableName => 'cip_today_reminder_invitation';

  RealColumn get idInvitation => real()();
  IntColumn get delayNoti => integer().nullable()();
  IntColumn get reminderValue => integer().nullable()();
  TextColumn get contentNoti => text().nullable()();
  TextColumn get titleNoti => text().nullable()();

  @override
  Set<Column> get primaryKey => {idInvitation};
}
