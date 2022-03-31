import 'package:checkinpromobile/src/database/entities/TableCommonEntity.dart';
import 'package:moor/moor.dart';

@DataClassName('CheckInTimeTodayEntry')
class CheckInTimeTodayEntity extends TableCommonEntity {
  String get tableName => "cip_today_checkin_time_today";

  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get checkIn => dateTime().nullable()();
  DateTimeColumn get checkOut => dateTime().nullable()();
  DateTimeColumn get date => dateTime().nullable()();
}
