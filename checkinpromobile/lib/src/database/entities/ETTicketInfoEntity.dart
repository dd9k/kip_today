import 'package:moor/moor.dart';
import 'TableCommonEntity.dart';

@DataClassName("ETTicketInfoAllEntry")
class ETTicketInfoEntity extends TableCommonEntity {
  String get tableName => 'cip_today_et_ticket_info';

  RealColumn get id => real().nullable()();
  RealColumn get idTicketInfo => real()();
  RealColumn get eventId => real().nullable()();
  RealColumn get remainingTicketQuantity => real().nullable()();
  TextColumn get ticketName => text().nullable()();
  RealColumn get ticketPrice => real().nullable()();
  RealColumn get isFree => real().nullable()();
  RealColumn get ticketQuantity => real().nullable()();
  RealColumn get maxQuantity => real().nullable()();
  RealColumn get discountUnit => real().nullable()();
  RealColumn get minQuantity => real().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get eventStartDate => text().nullable()();
  TextColumn get eventEndDate => text().nullable()();
  TextColumn get startDate => text().nullable()();
  TextColumn get endDate => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
