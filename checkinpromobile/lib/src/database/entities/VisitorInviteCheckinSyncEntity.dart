import 'package:checkinpromobile/src/database/entities/TableCommonEntity.dart';
import 'package:moor/moor.dart';

@DataClassName('VisitorInviteCheckinSyncEntry')
class VisitorInviteCheckinSyncEntity extends TableCommonEntity {
  String get tableName => 'cip_today_visitor_invite_checkin_sync';

  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get signIn => dateTime().nullable()();
  DateTimeColumn get signOut => dateTime().nullable()();
  TextColumn get inviteCode => text()();
  TextColumn get visitorName => text().nullable()();
  TextColumn get visitorType => text().nullable()();
  TextColumn get visitorEmail => text().nullable()();
  TextColumn get visitorPhoneNumber => text().nullable()();
  RealColumn get branchId => real().nullable()();
  RealColumn get contactPersonId => real().nullable()();
  TextColumn get timezone => text().nullable()();
  RealColumn get invitationId => real().nullable()();

  BoolColumn get isSync => boolean().withDefault(const Constant(false))();
  TextColumn get statusSync => text().nullable()();
}
