import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/ETBookingConfigInforEntity.dart';
import 'package:moor/moor.dart';
import 'package:checkinpromobile/src/model/ETBookingConfigInfor.dart';
part 'ETBookingConfigInforDAO.g.dart';

@UseDao(tables: [ETBookingConfigInforEntity])
class ETBookingConfigInforDAO extends DatabaseAccessor<Database>
    with _$ETBookingConfigInforDAOMixin {
  Database db;
  ETBookingConfigInforDAO(this.db) : super(db);

  void insertOne(ETBookingConfigInfor etBookingConfigInfor) {
    if (etBookingConfigInfor != null) {
      ETBookingConfigInforEntityCompanion companion = createCompanion(etBookingConfigInfor);
      into(eTBookingConfigInforEntity).insertOnConflictUpdate(companion);
    }
  }

  Future<ETBookingConfigInfor> getByEventId(double eventId) async {
    final query = select(eTBookingConfigInforEntity)
      ..where((bookingConfigInfo) => bookingConfigInfo.eventId.equals(eventId));
    List<ETBookingConfigInfor> list = await query
        .map((row) => ETBookingConfigInfor.copyWithEntity(row))
        .get();
    if (query == null || list.isEmpty) {
      return null;
    }
    return list.first;
  }

  Future<void> insertAll(List<ETBookingConfigInfor> eTBookingConfigInfo) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
          eTBookingConfigInforEntity,
          eTBookingConfigInfo.map((row) {
            return createCompanion(row);
          }).toList());
    });
  }

  ETBookingConfigInforEntityCompanion createCompanion(
      ETBookingConfigInfor eTBookingConfigInfo) {
    final companion = ETBookingConfigInforEntityCompanion(
      idBooking: Value(eTBookingConfigInfo.idBooking),
      eventId: Value(eTBookingConfigInfo.eventId),
      bookingLink: Value(eTBookingConfigInfo.bookingLink),
      emailTemplateContent: Value(eTBookingConfigInfo.emailTemplateContent),
      bookingField: Value(eTBookingConfigInfo.bookingField),
    );
    return companion;
  }

  Future deleteByEventId(double eventId) async {
    await (delete(eTBookingConfigInforEntity)
      ..where((tbl) => tbl.eventId.equals(eventId))).go();
  }

  Future<void> deleteAll() async {
    delete(eTBookingConfigInforEntity).go();
  }
}
