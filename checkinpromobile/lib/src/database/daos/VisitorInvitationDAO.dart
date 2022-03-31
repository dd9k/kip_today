import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/VisitorInvitationEntity.dart';
import 'package:checkinpromobile/src/model/NewVisitor.dart';
import 'package:moor/moor.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'VisitorInvitationDAO.g.dart';

@UseDao(tables: [VisitorInvitationEntity])
class VisitorInvitationDAO extends DatabaseAccessor<Database>
    with _$VisitorInvitationDAOMixin {
  Database db;

  VisitorInvitationDAO(this.db) : super(db);

  Future<List<NewVisitor>> getAlls(double idInvitation) {
    final query = select(visitorInvitationEntity)
      ..where((t) => t.idInvitation.equals(idInvitation));
    return query.map((row) {
      return NewVisitor.local(
          row.visitorName,
          row.visitorEmail,
          row.visitorPhoneNumber,
          row.visitorCompany,
          row.inviteCode,
          row.visitorAvatarFileName,
          row.id);
    }).get();
  }

  Future<List<NewVisitor>> searchVisitor(String keyword) {
    final query = selectOnly(visitorInvitationEntity, distinct: true)
      ..addColumns([
        visitorInvitationEntity.visitorName,
        visitorInvitationEntity.visitorEmail,
        visitorInvitationEntity.visitorPhoneNumber,
        visitorInvitationEntity.visitorCompany,
        visitorInvitationEntity.visitorAvatarFileName,
      ])
      ..where((visitorInvitationEntity.visitorName.contains(keyword) |
          visitorInvitationEntity.visitorEmail.contains(keyword)));
    return query.map((row) {
      return NewVisitor.local(
          row.read(visitorInvitationEntity.visitorName),
          row.read(visitorInvitationEntity.visitorEmail),
          row.read(visitorInvitationEntity.visitorPhoneNumber),
          row.read(visitorInvitationEntity.visitorCompany),
          null,
          row.read(visitorInvitationEntity.visitorAvatarFileName),
          0);
    }).get();
  }

  Future<void> insertAlls(
      List<NewVisitor> lstNewVisitor, double idInvitation) async {
    final preferences = await SharedPreferences.getInstance();
    final userName = preferences.getString(Constants.KEY_EMAIL) ?? "";
    final date = DateTime.now().toUtc();
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
          visitorInvitationEntity,
          lstNewVisitor.map((item) {
            var convertId = idInvitation;
            if (convertId == null) {
              convertId = Constants.MAX_INT.toDouble();
            }
            return VisitorInvitationEntityCompanion.insert(
              idInvitation: convertId,
              inviteCode: Value(item.inviteCode),
              visitorCompany: Value(item.visitorCompany),
              visitorEmail: Value(item.visitorEmail),
              visitorName: Value(item.visitorName),
              visitorPhoneNumber: Value(item.visitorPhoneNumber),
              visitorAvatarFileName: Value(item.visitorAvatarFileName),
              id: Value(item.id),
              createdBy: Value(userName),
              createdDate: Value(date),
              updatedBy: Value(userName),
              updatedDate: Value(date),
            );
          }).toList());
    });
  }

  Future<void> deleteAlls() async {
    delete(visitorInvitationEntity).go();
  }
}
