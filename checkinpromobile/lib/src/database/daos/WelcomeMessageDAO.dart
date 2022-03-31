import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/model/WelcomeMessage.dart';
import 'package:moor/moor.dart';

import '../entities/WelcomeMessageEntity.dart';

part 'WelcomeMessageDAO.g.dart';

@UseDao(tables: [WelcomeMessageEntity])
class WelcomeMessageDAO extends DatabaseAccessor<Database> with _$WelcomeMessageDAOMixin {
  Database db;

  WelcomeMessageDAO(this.db) : super(db);

  Future<void> insertAll(List<WelcomeMessage> welcomeMessages) async {
    await batch((batch) {
      batch.insertAll(
          welcomeMessageEntity,
          welcomeMessages.map((row) {
            return createCompanion(row);
          }).toList());
    });
  }

  Future<List<WelcomeMessage>> getMessageByBranchType(double branchId, String type) async {
    final query = select(welcomeMessageEntity)
      ..where(($WelcomeMessageEntityTable tbl) => tbl.locationId.equals(branchId) & tbl.type.equals(type));
    List<WelcomeMessage> list = await query
        .map((row) => WelcomeMessage.copyWithEntry(row))
        .get();
    if (list.isEmpty) {
      return List();
    }
    return list;
  }

  WelcomeMessageEntityCompanion createCompanion(WelcomeMessage message) {
    WelcomeMessageEntityCompanion companion = WelcomeMessageEntityCompanion(
        id: Value(message.id),
        messageContent: Value(message.messageContent),
        type: Value(message.type),
        locationId: Value(message.locationId),
        companyId: Value(message.companyId));
    return companion;
  }

  Future<void> deleteAll() async {
    delete(welcomeMessageEntity).go();
  }
}