import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/ETPayMentInfoEntity.dart';
import 'package:moor/moor.dart';
import 'package:checkinpromobile/src/model/ETPayMentInfo.dart';

part 'ETPayMentInfoDAO.g.dart';

@UseDao(tables: [ETPayMentInfoEntity])
class ETPayMentInfoDAO extends DatabaseAccessor<Database>
    with _$ETPayMentInfoDAOMixin {
  Database db;
  ETPayMentInfoDAO(this.db) : super(db);

  Future<void> insertOne(ETPayMentInfo payMentInfo) async {
    if (payMentInfo != null) {
      ETPayMentInfoEntityCompanion companion = createCompanion(payMentInfo);
      into(eTPayMentInfoEntity).insertOnConflictUpdate(companion);
    }
  }

  Future<ETPayMentInfo> getByEventId(double eventId) async {
    final query = select(eTPayMentInfoEntity)
      ..where((paymentInfoDetail) => paymentInfoDetail.eventId.equals(eventId));
    List<ETPayMentInfo> list =
        await query.map((row) => ETPayMentInfo.copyWithEntity(row)).get();
    if (query == null || list.isEmpty) {
      return null;
    }
    return list.first;
  }

  Future<void> insertAll(List<ETPayMentInfo> eTPaymentInfo) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
          eTPayMentInfoEntity,
          eTPaymentInfo.map((row) {
            return createCompanion(row);
          }).toList());
    });
  }

  ETPayMentInfoEntityCompanion createCompanion(
      ETPayMentInfo paymentInfoDetail) {
    final companion = ETPayMentInfoEntityCompanion(
      eventId: Value(paymentInfoDetail.eventId),
      paymentType: Value(paymentInfoDetail.paymentType),
      accountName: Value(paymentInfoDetail.accountName),
      accountNo: Value(paymentInfoDetail.accountNo),
      bankName: Value(paymentInfoDetail.bankName),
      bankBranchName: Value(paymentInfoDetail.bankBranchName),
    );
    return companion;
  }

  Future<void> deleteByEventId(double eventId) async {
    await (delete(eTPayMentInfoEntity)..where((tbl) => tbl.eventId.equals(eventId))).go();
  }

  Future<void> deleteAll() async {
    delete(eTPayMentInfoEntity).go();
  }
}
