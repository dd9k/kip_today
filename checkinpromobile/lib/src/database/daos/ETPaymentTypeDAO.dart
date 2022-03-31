import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/ETPaymentTypeEntity.dart';
import 'package:moor/moor.dart';
import 'package:checkinpromobile/src/model/ETPaymentType.dart';

part 'ETPaymentTypeDAO.g.dart';

@UseDao(tables: [ETPaymentTypeEntity])
class ETPaymentTypeDAO extends DatabaseAccessor<Database>
    with _$ETPaymentTypeDAOMixin {
  Database db;
  ETPaymentTypeDAO(this.db) : super(db);

  Future<void> insertOne(ETPaymentType payMentType) async {
    if (payMentType != null) {
      ETPaymentTypeEntityCompanion companion = createCompanion(payMentType);
      into(eTPaymentTypeEntity).insertOnConflictUpdate(companion);
    }
  }

  Future<void> insertAll(List<ETPaymentType> payMentType, double eventId) async {
    if (payMentType?.isNotEmpty == true) {
      await batch((batch) {
        batch.insertAllOnConflictUpdate(
            eTPaymentTypeEntity,
            payMentType.map((row) {
              row.eventId = eventId;
              return createCompanion(row);
            }).toList());
      });
    }
  }

  Future<List<ETPaymentType>> getByEventId(double eventId) async {
    final query = select(eTPaymentTypeEntity)
      ..where((paymentTypeDetail) => paymentTypeDetail.eventId.equals(eventId));
    List<ETPaymentType> list =
        await query.map((row) => ETPaymentType.copyWithEntity(row)).get();
    if (query == null || list.isEmpty) {
      return null;
    }
    return list;
  }

  ETPaymentTypeEntityCompanion createCompanion(
      ETPaymentType paymentTypeDetail) {
    final companion = ETPaymentTypeEntityCompanion(
      eventId: Value(paymentTypeDetail.eventId),
      settingCode: Value(paymentTypeDetail.settingCode),
      settingValue: Value(paymentTypeDetail.settingValue),
    );
    return companion;
  }

  Future<void> deleteByEventId(double eventId) async {
    await (delete(eTPaymentTypeEntity)..where((tbl) => tbl.eventId.equals(eventId))).go();
  }

  Future<void> deleteAll() async {
    delete(eTPaymentTypeEntity).go();
  }
}
