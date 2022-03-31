import 'package:checkinpromobile/src/database/entities/TableCommonEntity.dart';
import 'package:moor/moor.dart';

@DataClassName('MyVisitorLogEntry')
class MyVisitorLogEntity extends TableCommonEntity {
  String get tableName => 'cip_today_my_visitor_log';

  IntColumn get id => integer().autoIncrement()();
  RealColumn get idVistor => real()();
  TextColumn get fullName => text().nullable()();
  TextColumn get phoneNumber => text().nullable()();
  TextColumn get email => text().nullable()();
  DateTimeColumn get signIn => dateTime().nullable()();
  DateTimeColumn get signOut => dateTime().nullable()();
  TextColumn get fromCompany => text().nullable()();
  IntColumn get branchId => integer().nullable()();
  TextColumn get branchName => text().nullable()();
  TextColumn get visitorType => text().nullable()();
  TextColumn get visitorTypeValue => text().nullable()();
  TextColumn get faceCaptureFile => text().nullable()();
  IntColumn get rating => integer().nullable()();
  TextColumn get feedback => text().nullable()();
  TextColumn get inviteCode => text().nullable()();
}
