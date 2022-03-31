import 'package:checkinpromobile/src/database/entities/TableCommonEntity.dart';
import 'package:moor/moor.dart';

@DataClassName('MyVisitorLogTodayEntry')
class MyVisitorLogTodayEntity extends TableCommonEntity {
  String get tableName => 'cip_today_my_visitor_log_today';

  IntColumn get id => integer().autoIncrement()();
  RealColumn get idVistor => real()();
  TextColumn get fullName => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get phoneNumber => text().nullable()();
  DateTimeColumn get signIn => dateTime().nullable()();
  DateTimeColumn get signOut => dateTime().nullable()();
  TextColumn get toCompany => text().nullable()();
  TextColumn get fromCompany => text().nullable()();
  TextColumn get visitorTypeValue => text().nullable()();
  TextColumn get purpose => text().nullable()();
  TextColumn get feedback => text().nullable()();
  IntColumn get rating => integer().nullable()();
  TextColumn get branchName => text().nullable()();
  TextColumn get eventName => text().nullable()();
  RealColumn get totalCount => real().nullable()();
  TextColumn get typeDescription => text().nullable()();
  TextColumn get faceCaptureFile => text().nullable()();
  TextColumn get inviteCode => text().nullable()();
}
