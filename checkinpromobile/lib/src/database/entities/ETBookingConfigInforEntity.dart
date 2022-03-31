import 'package:moor/moor.dart';
import 'TableCommonEntity.dart';

@DataClassName("ETBookingConfigInforAllEntry")
class ETBookingConfigInforEntity extends TableCommonEntity {
  String get tableName => 'cip_today_et_booking';

  RealColumn get id => real().nullable()();
  RealColumn get idBooking => real()();
  RealColumn get eventId => real().nullable()();
  TextColumn get bookingLink => text().nullable()();
  TextColumn get emailTemplateContent => text().nullable()();
  TextColumn get bookingField => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
