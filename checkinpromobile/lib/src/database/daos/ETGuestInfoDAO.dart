import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/ETGuestInfoEntity.dart';
import 'package:checkinpromobile/src/model/ETGuestInfo.dart';

import 'package:moor/moor.dart';
part 'ETGuestInfoDAO.g.dart';

@UseDao(tables: [ETGuestInfoEntity])
class ETGuestInfoDAO extends DatabaseAccessor<Database>
    with _$ETGuestInfoDAOMixin {
  Database db;
  ETGuestInfoDAO(this.db) : super(db);

  Future<ETGuestInfo> getByTicketId(double eventId) async {
    final query = select(eTGuestInfoEntity)
      ..where((guestInfoDetail) => guestInfoDetail.idGuest.equals(eventId));
    List<ETGuestInfo> list =
        await query.map((row) => ETGuestInfo.copyWithEntity(row)).get();
    if (query == null || list.isEmpty) {
      return null;
    }
    return list.first;
  }

  Future<void> insertAll(List<ETGuestInfo> eTGuestInfo) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
          eTGuestInfoEntity,
          eTGuestInfo.map((row) {
            return createCompanion(row);
          }).toList());
    });
  }

  ETGuestInfoEntityCompanion createCompanion(ETGuestInfo eTGuestInfo) {
    final companion = ETGuestInfoEntityCompanion(
      idGuest: Value(eTGuestInfo.idGuest),
      fullName: Value(eTGuestInfo.fullName),
      emailAddress: Value(eTGuestInfo.emailAddress),
      phoneNumber: Value(eTGuestInfo.phoneNumber),
      idCard: Value(eTGuestInfo.idCard),
      company: Value(eTGuestInfo.company),
      position: Value(eTGuestInfo.position),
    );
    return companion;
  }

  void deleteByTicketId(double eventId) {
    delete(eTGuestInfoEntity)..where((tbl) => tbl.idGuest.equals(eventId))..go();
  }

  Future<void> deleteAll() async {
    delete(eTGuestInfoEntity).go();
  }
}
