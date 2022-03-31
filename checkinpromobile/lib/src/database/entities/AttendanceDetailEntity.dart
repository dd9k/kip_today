import 'package:checkinpromobile/src/database/entities/TableCommonEntity.dart';
import 'package:moor/moor.dart';

@DataClassName('AttendanceDetailEntry')
class AttendanceDetailEntity extends TableCommonEntity {
  String get tableName => 'cip_today_attendance_detail';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get dayOfMonth => text().nullable()();
  DateTimeColumn get checkin => dateTime().nullable()();
  DateTimeColumn get checkout => dateTime().nullable()();
  BoolColumn get isLate => boolean().nullable()();
  BoolColumn get isEnoughWorkingTime => boolean().nullable()();
  RealColumn get totalWorkingTime => real().nullable()();
  TextColumn get note => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get dataJson => text().nullable()();
  TextColumn get dayOfMonthCompare => text().nullable()();
}
