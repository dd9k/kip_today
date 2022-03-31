import 'package:moor/moor.dart';
import 'TableCommonEntity.dart';

@DataClassName("ETOderDetailInfoEntry")
class ETOrderDetailInfoEntity extends TableCommonEntity {
  String get tableName => 'cip_today_et_order_detail';

  RealColumn get id => real().nullable()();
  RealColumn get orderId => real().nullable()();
  RealColumn get eventId => real().nullable()();
  RealColumn get ticketId => real().nullable()();
  RealColumn get quantity => real().nullable()();
  RealColumn get amount => real().nullable()();
  RealColumn get discountId => real().nullable()();
  TextColumn get inviteCode => text().nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get ticketName => text().nullable()();
  RealColumn get ticketPrice => real().nullable()();
  RealColumn get ticketIsFree => real().nullable()();
  RealColumn get ticketQuantity => real().nullable()();
  TextColumn get ticketStartDate => text().nullable()();
  TextColumn get ticketEndDate => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
