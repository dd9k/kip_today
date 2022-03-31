import 'package:moor/moor.dart';
import 'TableCommonEntity.dart';

@DataClassName("ETOrderInfoEntry")
class ETOrderInfoEntity extends TableCommonEntity {
  String get tableName => 'cip_today_et_order';

  RealColumn get id => real().nullable()();
  TextColumn get orderNo => text().nullable()();
  RealColumn get guestId => real().nullable()();
  RealColumn get eventId => real().nullable()();
  TextColumn get paymentType => text().nullable()();
  RealColumn get totalAmount => real().nullable()();
  TextColumn get status => text().nullable()();
  RealColumn get quantity => real().nullable()();
  TextColumn get guestName => text().nullable()();
  TextColumn get guestPhone => text().nullable()();
  TextColumn get guestEmail => text().nullable()();
  BoolColumn get isPaidByOwn => boolean().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
