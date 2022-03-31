import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/ETOrderDetailInfoEntity.dart';
import 'package:checkinpromobile/src/database/entities/ETOrderInfoEntity.dart';
import 'package:checkinpromobile/src/model/ETOrderInfo.dart';
import 'package:moor/moor.dart';
part 'ETOrderInfoDAO.g.dart';

@UseDao(tables: [ETOrderInfoEntity, ETOrderDetailInfoEntity])
class ETOrderInfoDAO extends DatabaseAccessor<Database>
    with _$ETOrderInfoDAOMixin {
  Database db;
  ETOrderInfoDAO(this.db) : super(db);

  Future<void> insertAll(List<ETOrderInfo> eTOrderInfos) async {
    if (eTOrderInfos?.isNotEmpty == true) {
      for (ETOrderInfo eTOrderInfo in eTOrderInfos) {
        await db.eTOrderDetailInfoDAO.insertAll(eTOrderInfo.orderDetails);
        insertOne(eTOrderInfo);
      }
    }
  }

  void insertOne(ETOrderInfo eTOrderInfo) {
    ETOrderInfoEntityCompanion companion = createCompanion(eTOrderInfo);
    into(eTOrderInfoEntity).insert(companion,
        onConflict: DoUpdate((old) => createCompanionUpdate(eTOrderInfo)));
  }

  Future<List<ETOrderInfo>> getOrdersByEventId(double eventId) async {
    final query = select(eTOrderInfoEntity)
      ..where((order) => order.eventId.equals(eventId))..orderBy([
            (t) => OrderingTerm(expression: t.guestName, mode: OrderingMode.asc),
      ]);
    List<ETOrderInfo> list = await query.map((row) => ETOrderInfo.copyWithEntity(row)).get();
    if (query == null || list.isEmpty) {
      return null;
    }
    for (ETOrderInfo order in list) {
      order.orderDetails = await db.eTOrderDetailInfoDAO.getEventTicket(order.id);
    }
    return list;
  }

  Future<List<ETOrderInfo>> getOrdersPaidByEventId(double eventId) async {
    final query = select(eTOrderInfoEntity)
      ..where((order) => order.eventId.equals(eventId) & order.isPaidByOwn)..orderBy([
            (t) => OrderingTerm(expression: t.guestName, mode: OrderingMode.asc),
      ]);
    List<ETOrderInfo> list = await query.map((row) => ETOrderInfo.copyWithEntity(row)).get();
    if (query == null || list.isEmpty) {
      return List();
    }
    for (ETOrderInfo order in list) {
      order.orderDetails = await db.eTOrderDetailInfoDAO.getEventTicket(order.id);
    }
    return list;
  }

  Future<List<ETOrderInfo>> searchOrdersByKey(double eventId, String key) async {
    String keySearch = key.toLowerCase();
    final query = selectOnly(eTOrderInfoEntity, distinct: true)
      ..addColumns([
        eTOrderInfoEntity.id,
        eTOrderInfoEntity.orderNo,
        eTOrderInfoEntity.guestId,
        eTOrderInfoEntity.eventId,
        eTOrderInfoEntity.paymentType,
        eTOrderInfoEntity.totalAmount,
        eTOrderInfoEntity.status,
        eTOrderInfoEntity.quantity,
        eTOrderInfoEntity.guestName,
        eTOrderInfoEntity.guestPhone,
        eTOrderInfoEntity.guestEmail,
        eTOrderInfoEntity.isPaidByOwn,
        eTOrderDetailInfoEntity.inviteCode
      ])
      ..join([innerJoin(eTOrderDetailInfoEntity, eTOrderInfoEntity.id.equalsExp(eTOrderDetailInfoEntity.orderId))])
      ..where((eTOrderInfoEntity.eventId.equals(eventId) &
          (eTOrderInfoEntity.guestName.lower().contains(keySearch) |
              eTOrderInfoEntity.guestEmail.lower().contains(keySearch) |
              eTOrderInfoEntity.guestPhone.lower().contains(keySearch) |
          eTOrderDetailInfoEntity.inviteCode.lower().contains(keySearch) |
              eTOrderInfoEntity.orderNo.lower().contains(keySearch))))
      ..orderBy([OrderingTerm.asc(eTOrderInfoEntity.guestEmail)]);
    List<ETOrderInfo> list = await query.map((row) {
      return ETOrderInfo.local(
          row.read(eTOrderInfoEntity.id),
          row.read(eTOrderInfoEntity.orderNo),
          row.read(eTOrderInfoEntity.guestId),
          row.read(eTOrderInfoEntity.eventId),
          row.read(eTOrderInfoEntity.paymentType),
          row.read(eTOrderInfoEntity.totalAmount),
          row.read(eTOrderInfoEntity.status),
          row.read(eTOrderInfoEntity.quantity),
          row.read(eTOrderInfoEntity.guestName),
          row.read(eTOrderInfoEntity.guestPhone),
          row.read(eTOrderInfoEntity.guestEmail),
          row.read(eTOrderInfoEntity.isPaidByOwn));
    }).get();
    if (query == null || list.isEmpty) {
      return List();
    }
    for (ETOrderInfo order in list) {
      order.orderDetails = await db.eTOrderDetailInfoDAO.getEventTicket(order.id);
    }
    return list;
  }

  Future<List<ETOrderInfo>> searchOrdersPaidByKey(double eventId, String key) async {
    String keySearch = key.toLowerCase();
    final query = selectOnly(eTOrderInfoEntity, distinct: true)
      ..addColumns([
        eTOrderInfoEntity.id,
        eTOrderInfoEntity.orderNo,
        eTOrderInfoEntity.guestId,
        eTOrderInfoEntity.eventId,
        eTOrderInfoEntity.paymentType,
        eTOrderInfoEntity.totalAmount,
        eTOrderInfoEntity.status,
        eTOrderInfoEntity.quantity,
        eTOrderInfoEntity.guestName,
        eTOrderInfoEntity.guestPhone,
        eTOrderInfoEntity.guestEmail,
        eTOrderInfoEntity.isPaidByOwn,
        eTOrderDetailInfoEntity.inviteCode
      ])
      ..join([innerJoin(eTOrderDetailInfoEntity, eTOrderInfoEntity.id.equalsExp(eTOrderDetailInfoEntity.orderId))])
      ..where((eTOrderInfoEntity.eventId.equals(eventId) &
      eTOrderInfoEntity.isPaidByOwn &
      (eTOrderInfoEntity.guestName.lower().contains(keySearch) |
      eTOrderInfoEntity.guestEmail.lower().contains(keySearch) |
      eTOrderInfoEntity.guestPhone.lower().contains(keySearch) |
      eTOrderDetailInfoEntity.inviteCode.lower().contains(keySearch) |
      eTOrderInfoEntity.orderNo.lower().contains(keySearch))))
      ..orderBy([OrderingTerm.asc(eTOrderInfoEntity.guestEmail)]);
    List<ETOrderInfo> list = await query.map((row) {
      return ETOrderInfo.local(
          row.read(eTOrderInfoEntity.id),
          row.read(eTOrderInfoEntity.orderNo),
          row.read(eTOrderInfoEntity.guestId),
          row.read(eTOrderInfoEntity.eventId),
          row.read(eTOrderInfoEntity.paymentType),
          row.read(eTOrderInfoEntity.totalAmount),
          row.read(eTOrderInfoEntity.status),
          row.read(eTOrderInfoEntity.quantity),
          row.read(eTOrderInfoEntity.guestName),
          row.read(eTOrderInfoEntity.guestPhone),
          row.read(eTOrderInfoEntity.guestEmail),
          row.read(eTOrderInfoEntity.isPaidByOwn));
    }).get();
    if (query == null || list.isEmpty) {
      return List();
    }
    for (ETOrderInfo order in list) {
      order.orderDetails = await db.eTOrderDetailInfoDAO.getEventTicket(order.id);
    }
    return list;
  }

  Future<ETOrderInfo> getOrdersByInviteCode(String inviteCode) async {
    double id = await db.eTOrderDetailInfoDAO.getOrderIdByInviteCode(inviteCode);
    final query = select(eTOrderInfoEntity)
      ..where((order) => order.id.equals(id));
    ETOrderInfo order = ETOrderInfo.copyWithEntity((await query.get()).first);
    order.orderDetails = await db.eTOrderDetailInfoDAO.getEventTicket(order.id);
    return order;
  }

  Future<void> updateStatusOrdersByInviteCode(String inviteCode, String status) async {
    ETOrderInfo etOrderInfo = await getOrdersByInviteCode(inviteCode);
    update(eTOrderInfoEntity)
      ..where((t) => t.id.equals(etOrderInfo.id))
      ..write(ETOrderInfoEntityCompanion(
        status: Value(status),
          isPaidByOwn: Value(true)
      ));
  }

  Future<void> updateStatusOrdersById(double id, String status, bool isPaidByOwn) async {
    update(eTOrderInfoEntity)
      ..where((t) => t.id.equals(id))
      ..write(ETOrderInfoEntityCompanion(
        status: Value(status),
        isPaidByOwn: Value(isPaidByOwn)
      ));
  }

  ETOrderInfoEntityCompanion createCompanion(ETOrderInfo etOrderInfo) {
    final companion = ETOrderInfoEntityCompanion(
        id: Value(etOrderInfo.id),
        orderNo: Value(etOrderInfo.orderNo),
        guestId: Value(etOrderInfo.guestId),
        eventId: Value(etOrderInfo.eventId),
        paymentType: Value(etOrderInfo.paymentType),
        totalAmount: Value(etOrderInfo.totalAmount),
        status: Value(etOrderInfo.status),
        quantity: Value(etOrderInfo.quantity),
        guestName: Value(etOrderInfo.guestName),
        guestPhone: Value(etOrderInfo.guestPhone),
        guestEmail: Value(etOrderInfo.guestEmail),
        isPaidByOwn: Value(false));
    return companion;
  }

  ETOrderInfoEntityCompanion createCompanionUpdate(ETOrderInfo etOrderInfo) {
    final companion = ETOrderInfoEntityCompanion(
      orderNo: Value(etOrderInfo.orderNo),
      guestId: Value(etOrderInfo.guestId),
      eventId: Value(etOrderInfo.eventId),
      paymentType: Value(etOrderInfo.paymentType),
      totalAmount: Value(etOrderInfo.totalAmount),
      status: Value(etOrderInfo.status),
      quantity: Value(etOrderInfo.quantity),
      guestName: Value(etOrderInfo.guestName),
      guestPhone: Value(etOrderInfo.guestPhone),
      guestEmail: Value(etOrderInfo.guestEmail),
    );
    return companion;
  }

  Future<void> deleteByEventId(double eventId) async {
    final query = select(eTOrderInfoEntity)
      ..where((order) => order.eventId.equals(eventId));
    List<ETOrderInfo> list = await query.map((row) => ETOrderInfo.copyWithEntity(row)).get();
    if (query == null || list?.isNotEmpty == true) {
      for (ETOrderInfo order in list) {
        await db.eTOrderDetailInfoDAO.deleteByOrderId(order.id);
        await (delete(eTOrderInfoEntity)..where((tbl) => tbl.id.equals(order.id))).go();
      }
    }
    await db.eTBookingConfigInforDAO.deleteByEventId(eventId);
    await db.eTTicketInfoDAO.deleteByEventId(eventId);
    await db.eTPayMentInfoDAO.deleteByEventId(eventId);
    await db.eTPaymentTypeDAO.deleteByEventId(eventId);
  }

  Future<void> deleteAll() async {
    delete(eTOrderInfoEntity).go();
  }
}
