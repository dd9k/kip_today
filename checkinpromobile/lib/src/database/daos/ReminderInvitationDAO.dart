import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/ReminderInvitationEntity.dart';
import 'package:checkinpromobile/src/model/ReminderInvitation.dart';
import 'package:moor/moor.dart';

part 'ReminderInvitationDAO.g.dart';

@UseDao(tables: [ReminderInvitationEntity])
class ReminderInvitationDAO extends DatabaseAccessor<Database> with _$ReminderInvitationDAOMixin {
  Database db;

  ReminderInvitationDAO(this.db) : super(db);

  Future<ReminderInvitation> getById(double idInvitation) async {
    final query = select(reminderInvitationEntity)..where((tbl) => tbl.idInvitation.equals(idInvitation));
    List<ReminderInvitation> list = await query.map((row) {
      final model = ReminderInvitation.copyWithEntry(row);
      return model;
    }).get();
    if (list.isEmpty) {
      return null;
    }
    return list.first;
  }

  Future<int> insert(ReminderInvitation reminderInvitation) async {
    final entityCompanion = createCompanion(reminderInvitation);
    return into(reminderInvitationEntity).insert(entityCompanion);
  }

  ReminderInvitationEntityCompanion createCompanion(ReminderInvitation reminderInvitation) {
    ReminderInvitationEntityCompanion companion = ReminderInvitationEntityCompanion(
        idInvitation: Value(reminderInvitation.idInvitation),
        contentNoti: Value(reminderInvitation.contentNoti),
        titleNoti: Value(reminderInvitation.titleNoti),
        delayNoti: Value(reminderInvitation.delayNoti),
        reminderValue: Value(reminderInvitation.reminderValue));
    return companion;
  }

  Future<void> deleteAll() async {
    delete(reminderInvitationEntity).go();
  }
}
