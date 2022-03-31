import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/VisitorInviteCheckinSyncEntity.dart';
import 'package:checkinpromobile/src/model/VisitorInviteCheckinSync.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:moor/moor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

part 'VisitorInviteCheckinSyncDAO.g.dart';

@UseDao(tables: [VisitorInviteCheckinSyncEntity])
class VisitorInviteCheckinSyncDAO extends DatabaseAccessor<Database>
    with _$VisitorInviteCheckinSyncDAOMixin {
  Database db;

  VisitorInviteCheckinSyncDAO(this.db) : super(db);

  Future<VisitorInviteCheckinSync> getItemByInviteCode(String inviteCode) {
    final query = select(visitorInviteCheckinSyncEntity)
      ..where((t) => t.inviteCode.equals(inviteCode));
    return query.map((row) {
      return VisitorInviteCheckinSync(
          row.id,
          row.signIn == null ? null : row.signIn.toLocal().toString(),
          row.timezone,
          row.signOut == null ? null : row.signOut.toLocal().toString(),
          row.invitationId,
          row.inviteCode,
          row.visitorName,
          row.visitorType,
          row.visitorEmail,
          row.visitorPhoneNumber,
          row.branchId,
          row.contactPersonId);
    }).getSingle();
  }

  Future<List<VisitorInviteCheckinSync>> getVisitorInviteNotYetSync() async {
    final query = select(visitorInviteCheckinSyncEntity)
      ..where((t) => t.isSync.equals(false));
    return query.map((row) {
      final signIn = row.signIn == null
          ? null
          : DateFormat(Constants.DATE_FORMAT_TO_SQL).format(row.signIn.toUtc());
      final signOut = row.signOut == null
          ? null
          : DateFormat(Constants.DATE_FORMAT_TO_SQL)
              .format(row.signOut.toUtc());
      return VisitorInviteCheckinSync(
          row.id,
          signIn,
          row.timezone,
          signOut,
          row.invitationId,
          row.inviteCode,
          row.visitorName,
          row.visitorType,
          row.visitorEmail,
          row.visitorPhoneNumber,
          row.branchId,
          row.contactPersonId);
    }).get();
  }

  Future<void> checkInForInvitationSync(VisitorInviteCheckinSync model,
      {isSync = false}) async {
    final preferences = await SharedPreferences.getInstance();
    final userName = preferences.getString(Constants.KEY_EMAIL) ?? "";
    final date = DateTime.now().toUtc();
    final companion = VisitorInviteCheckinSyncEntityCompanion(
      branchId: Value(model.branchId),
      contactPersonId: Value(model.contactPersonId),
      invitationId: Value(model.invitationId),
      inviteCode: Value(model.inviteCode),
      timezone: Value(model.timezone),
      signIn: model.signIn == null
          ? Value.absent()
          : Value(DateTime.tryParse(model.signIn).toUtc()),
      signOut: model.signOut == null
          ? Value.absent()
          : Value(DateTime.tryParse(model.signOut).toUtc()),
      visitorEmail: Value(model.visitorEmail),
      visitorName: Value(model.visitorName),
      visitorPhoneNumber: Value(model.visitorPhoneNumber),
      visitorType: Value(model.visitorType),
      isSync: Value(isSync),
      statusSync: isSync ? Value('Synced') : Value.absent(),
      createdBy: Value(userName),
      createdDate: Value(date),
      updatedBy: Value(userName),
      updatedDate: Value(date),
    );
    // Insert
    into(visitorInviteCheckinSyncEntity).insert(companion);
  }

  Future<void> checkOutForInvitationSync(String inviteCode, DateTime signOut,
      {isSync = false}) async {
    final preference = await SharedPreferences.getInstance();
    final userName = preference.getString(Constants.KEY_EMAIL) ?? "";
    final date = DateTime.now().toUtc();
    // Update row = sign out
    update(visitorInviteCheckinSyncEntity)
      ..where((t) => t.inviteCode.equals(inviteCode))
      ..write(VisitorInviteCheckinSyncEntityCompanion(
          signOut: Value(signOut.toUtc()),
          isSync: Value(isSync),
          statusSync: isSync ? Value('Synced') : Value.absent(),
          updatedBy: Value(userName),
          updatedDate: Value(date)));
    // Update sign out in visitor log today table
    db.myVisitorLogTodayDAO.updateSignOutByInviteCode(inviteCode, signOut);
    // Update sign out in visitor log table
    db.myVisitorLogDAO.updateSignOutByInviteCode(inviteCode, signOut);
  }

  Future<void> updateStatusSyncForInvitationCheckInOutSync(
      List<VisitorInviteCheckinSync> lstItems) async {
    final preference = await SharedPreferences.getInstance();
    final userName = preference.getString(Constants.KEY_EMAIL) ?? "";
    lstItems.forEach((item) {
      update(visitorInviteCheckinSyncEntity)
        ..where((t) => t.id.equals(item.id))
        ..write(
          VisitorInviteCheckinSyncEntityCompanion(
              isSync: Value(true),
              statusSync: Value('Synced'),
              updatedBy: Value(userName),
              updatedDate: Value(DateTime.now().toUtc())),
        );
    });
  }

  Future<void> deleteAlls() async {
    delete(visitorInviteCheckinSyncEntity).go();
  }
}
