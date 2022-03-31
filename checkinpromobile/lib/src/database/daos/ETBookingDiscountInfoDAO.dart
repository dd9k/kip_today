import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/ETBookingDiscountInfoEntity.dart';
import 'package:moor/moor.dart';
import 'package:checkinpromobile/src/model/ETBookingDiscountInfo.dart';

part 'ETBookingDiscountInfoDAO.g.dart';

@UseDao(tables: [ETBookingDiscountInfoEntity])
class ETBookingDiscountInfoDAO extends DatabaseAccessor<Database>
    with _$ETBookingDiscountInfoDAOMixin {
  Database db;
  ETBookingDiscountInfoDAO(this.db) : super(db);

  Future<List<ETBookingDiscountInfo>> getByTicketId(double ticketId) async {
    final query = select(eTBookingDiscountInfoEntity)
      ..where(
          (discountInfoDetail) => discountInfoDetail.ticketId.equals(ticketId));
    List<ETBookingDiscountInfo> list = await query
        .map((row) => ETBookingDiscountInfo.copyWithEntity(row))
        .get();
    if (query == null || list.isEmpty) {
      return null;
    }
    return list;
  }

  void deleteByTicketId(double ticketId) {
    delete(eTBookingDiscountInfoEntity)
      ..where((tbl) => tbl.ticketId.equals(ticketId))..go();
  }

  Future<void> insertAll(List<ETBookingDiscountInfo> eTDiscountInfo) async {
    if (eTDiscountInfo?.isNotEmpty == true) {
      await batch((batch) {
        batch.insertAllOnConflictUpdate(
            eTBookingDiscountInfoEntity,
            eTDiscountInfo.map((row) {
              return createCompanion(row);
            }).toList());
      });
    }
  }

  ETBookingDiscountInfoEntityCompanion createCompanion(
      ETBookingDiscountInfo eTDiscountInfo) {
    final companion = ETBookingDiscountInfoEntityCompanion(
      idBookingDiscount: Value(eTDiscountInfo.idBookingDiscount),
      ticketId: Value(eTDiscountInfo.ticketId),
      discountValue: Value(eTDiscountInfo.discountValue),
      discountUnit: Value(eTDiscountInfo.discountUnit),
      bookingQuantity: Value(eTDiscountInfo.bookingQuantity),
    );
    return companion;
  }

  Future<void> deleteAll() async {
    delete(eTBookingDiscountInfoEntity).go();
  }
}
