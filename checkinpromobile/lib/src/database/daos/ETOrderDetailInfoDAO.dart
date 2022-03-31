import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/ETOrderDetailInfoEntity.dart';
import 'package:checkinpromobile/src/model/ETOrderDetailInfo.dart';
import 'package:moor/moor.dart';
part 'ETOrderDetailInfoDAO.g.dart';

@UseDao(tables: [ETOrderDetailInfoEntity])
class ETOrderDetailInfoDAO extends DatabaseAccessor<Database> with _$ETOrderDetailInfoDAOMixin {
  Database db;

  ETOrderDetailInfoDAO(this.db) : super(db);

  Future<void> insertAll(List<ETOrderDetailInfo> eTOrderInfo) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
          eTOrderDetailInfoEntity,
          eTOrderInfo.map((row) {
            return createCompanion(row);
          }).toList());
    });
  }

  Future<List<ETOrderDetailInfo>> getEventTicket(double orderId) async {
    final query = select(eTOrderDetailInfoEntity)
      ..where((orderDetail) => orderDetail.orderId.equals(orderId));
    List<ETOrderDetailInfo> list = await query.map((row) => ETOrderDetailInfo.copyWithEntity(row)).get();
    if (query == null || list.isEmpty) {
      return null;
    }
    return list;
  }

  Future<void> updateUsedStatus(String inviteCode, String status) async {
    update(eTOrderDetailInfoEntity)
      ..where((t) => t.inviteCode.upper().equals(inviteCode.toUpperCase()))
      ..write(ETOrderDetailInfoEntityCompanion(
        status: Value(status),
      ));
  }

  Future<double> getOrderIdByInviteCode(String inviteCode) async {
    final query = select(eTOrderDetailInfoEntity)
      ..where((orderDetail) => orderDetail.inviteCode.upper().equals(inviteCode.toUpperCase()));
    return ETOrderDetailInfo.copyWithEntity((await query.get()).first).orderId;
  }

  ETOrderDetailInfoEntityCompanion createCompanion(ETOrderDetailInfo etOrderInfo) {
    final companion = ETOrderDetailInfoEntityCompanion(
        id: Value(etOrderInfo.id),
        orderId: Value(etOrderInfo.orderId),
        ticketId: Value(etOrderInfo.ticketId),
        quantity: Value(etOrderInfo.quantity),
        amount: Value(etOrderInfo.amount),
        discountId: Value(etOrderInfo.discountId),
        inviteCode: Value(etOrderInfo.inviteCode),
        status: Value(etOrderInfo.status),
        ticketName: Value(etOrderInfo.ticketName),
        ticketPrice: Value(etOrderInfo.ticketPrice),
        ticketIsFree: Value(etOrderInfo.ticketIsFree),
        ticketQuantity: Value(etOrderInfo.ticketQuantity),
        ticketStartDate: Value(etOrderInfo.ticketStartDate),
        ticketEndDate: Value(etOrderInfo.ticketEndDate)
    );
    return companion;
  }

  Future deleteByOrderId(double orderId) async {
    await (delete(eTOrderDetailInfoEntity)..where((tbl) => tbl.orderId.equals(orderId))).go();
  }

  Future<void> deleteAll() async {
    delete(eTOrderDetailInfoEntity).go();
  }
}
