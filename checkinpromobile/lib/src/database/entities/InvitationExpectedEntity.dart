import 'package:checkinpromobile/src/database/entities/TableCommonEntity.dart';
import 'package:moor/moor.dart';

@DataClassName("InvitationExpectedEntry")
class InvitationExpectedEntity extends TableCommonEntity {
  String get tableName => 'cip_today_invitation_Expected';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get eventName => text().nullable()();
  RealColumn get branchId => real().nullable()();
  RealColumn get contactPersonId => real().nullable()();
  TextColumn get visitorType => text().nullable()();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get coverPathFile => text().nullable()();
  RealColumn get companyId => real().nullable()();
  TextColumn get visitorName => text().nullable()();
  TextColumn get visitorTypeValue => text().nullable()();
  TextColumn get contactPersonName => text().nullable()();
  TextColumn get contactPersonPhone => text().nullable()();
  TextColumn get contactPersonEmail => text().nullable()();
  TextColumn get timeZone => text().nullable()();
  TextColumn get branchName => text().nullable()();
  TextColumn get branchAddress => text().nullable()();
  RealColumn get preRegisterId => real().nullable()();
  TextColumn get visitorEmail => text().nullable()();
  IntColumn get invitationId => integer().nullable()();
  TextColumn get hostInfo => text().nullable()();
  TextColumn get visitorPhoneNumber => text().nullable()();
  TextColumn get visitorCompany => text().nullable()();
  TextColumn get inviteCode => text().nullable()();
  DateTimeColumn get signIn => dateTime().nullable()();
}
