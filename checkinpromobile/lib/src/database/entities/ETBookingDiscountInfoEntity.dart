import 'package:moor/moor.dart';
import 'TableCommonEntity.dart';

@DataClassName("ETBookingDiscountInfoAllEntry")
class ETBookingDiscountInfoEntity extends TableCommonEntity {
  String get tableName => 'cip_today_et_booking_discount';

  RealColumn get id => real().nullable()();
  RealColumn get idBookingDiscount => real()();
  RealColumn get ticketId => real().nullable()();
  RealColumn get discountValue => real().nullable()();
  TextColumn get discountUnit => text().nullable()();
  RealColumn get bookingQuantity => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
