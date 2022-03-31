import 'package:checkinpromobile/src/database/entities/TableCommonEntity.dart';
import 'package:moor/moor.dart';

@DataClassName('AttendanceStatisticEntry')
class AttendanceStatisticEntity extends TableCommonEntity {
  String get tableName => 'cip_today_attendance_statistic';

  Column get month => integer()();
  RealColumn get workingTime => real()();
}
