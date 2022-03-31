import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/EventCheckInSyncEntity.dart';
import 'package:checkinpromobile/src/database/entities/ETTicketInfoEntity.dart';
import 'package:checkinpromobile/src/model/ETTicketInfo.dart';

import 'package:moor/moor.dart';
part 'ETTicketInfoDAO.g.dart';

@UseDao(tables: [ETTicketInfoEntity])
class ETTicketInfoDAO extends DatabaseAccessor<Database>
    with _$ETTicketInfoDAOMixin {
  Database db;
  ETTicketInfoDAO(this.db) : super(db);

  Future<void> insertAll(List<ETTicketInfo> eTTicketInfo) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
          eTTicketInfoEntity,
          eTTicketInfo.map((row) {
            return createCompanion(row);
          }).toList());
    });
  }

  Future<ETTicketInfo> getByEventId(double eventId) async {
    final query = select(eTTicketInfoEntity)
      ..where((ticketInfoDetail) => ticketInfoDetail.eventId.equals(eventId));
    List<ETTicketInfo> list =
        await query.map((row) => ETTicketInfo.copyWithEntity(row)).get();
    if (query == null || list.isEmpty) {
      return null;
    }
    return list.first;
  }

  ETTicketInfoEntityCompanion createCompanion(ETTicketInfo eTTicketInfo) {
    final companion = ETTicketInfoEntityCompanion(
      idTicketInfo: Value(eTTicketInfo.idTicketInfo),
      eventId: Value(eTTicketInfo.eventId),
      remainingTicketQuantity: Value(eTTicketInfo.remainingTicketQuantity),
      ticketName: Value(eTTicketInfo.ticketName),
      ticketPrice: Value(eTTicketInfo.ticketPrice),
      isFree: Value(eTTicketInfo.isFree),
      ticketQuantity: Value(eTTicketInfo.ticketQuantity),
      maxQuantity: Value(eTTicketInfo.maxQuantity),
      minQuantity: Value(eTTicketInfo.minQuantity),
      description: Value(eTTicketInfo.description),
      eventStartDate: Value(eTTicketInfo.eventStartDate),
      eventEndDate: Value(eTTicketInfo.eventEndDate),
      startDate: Value(eTTicketInfo.startDate),
      endDate: Value(eTTicketInfo.endDate),
    );
    return companion;
  }

  Future<void> insertOne(ETTicketInfo eTTicketInfo) async {
    if (eTTicketInfo != null) {
      ETTicketInfoEntityCompanion companion = createCompanion(eTTicketInfo);
      into(eTTicketInfoEntity).insertOnConflictUpdate(companion);
    }
  }

  Future<void> deleteByEventId(double eventId) async {
    final query = select(eTTicketInfoEntity)
      ..where((ticketInfoDetail) => ticketInfoDetail.eventId.equals(eventId));
    List<ETTicketInfo> list =
        await query.map((row) => ETTicketInfo.copyWithEntity(row)).get();
    if (list?.isNotEmpty == true) {
      for (int index = 0; index < list.length ; index++) {
        db.eTBookingDiscountInfoDAO.deleteByTicketId(list[index].idTicketInfo);
      }
    }
    delete(eTTicketInfoEntity)
      ..where((tbl) => tbl.eventId.equals(eventId))
      ..go();
  }

  Future<void> deleteAll() async {
    delete(eTTicketInfoEntity).go();
  }
}
