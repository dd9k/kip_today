import 'package:checkinpromobile/src/database/entities/TableCommonEntity.dart';
import 'package:moor/moor.dart';

@DataClassName('WorkingTimeEntry')
class WorkingTimeEntity extends TableCommonEntity {
  String get tableName => 'cip_today_working_time';

  IntColumn get id => integer().autoIncrement()();
  RealColumn get totalHourOfMonth => real().nullable()();
  RealColumn get totalhourOfWeek => real().nullable()();
  IntColumn get totalLateDayInMonth => integer().nullable()();
  IntColumn get totalNotCheckoutDayInMonth => integer().nullable()();
  IntColumn get totalNotEnoughInMonth => integer().nullable()();
}
