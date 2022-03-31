import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/InvitationExpectedEntity.dart';
import 'package:checkinpromobile/src/model/ItemInvitation.dart';
import 'package:checkinpromobile/src/model/ItemVisitor.dart';
import 'package:checkinpromobile/src/model/VisitorLog.dart';
import 'package:moor/moor.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'InvitationExpectedDAO.g.dart';

@UseDao(tables: [InvitationExpectedEntity])
class InvitationExpectedDAO extends DatabaseAccessor<Database>
    with _$InvitationExpectedDAOMixin {
  Database db;

  InvitationExpectedDAO(this.db) : super(db);

  bool isCheckCompareTwoDateInviteExpected(
      DateTime date1, DateTime date2, hourExpected) {
    final difference = date2.difference(date1).inHours;
    return difference <= hourExpected;
  }

  Future<ItemInvitation> getItemByInviteCode(
      String inviteCode, int exceedingSeconds) async {
    final date = DateTime.now().toUtc();
    final hourExpected =
        exceedingSeconds / Constants.EXCEEDING_SECONDS_SEARCH_INVITATION;
    final query = select(invitationExpectedEntity)
      ..where((t) {
        return t.startDate.year.equals(date.year) &
            t.startDate.month.equals(date.month) &
            t.startDate.day.equals(date.day) &
            t.inviteCode.equals(inviteCode);
      });
    return query.map((row) {
      final isCheck = isCheckCompareTwoDateInviteExpected(
          row.startDate, date, hourExpected);
      if (!isCheck) {
        return null;
      }
      return ItemInvitation.local(
          row.eventName,
          row.branchId,
          row.contactPersonId,
          row.visitorType,
          row.startDate == null ? null : row.startDate.toLocal().toString(),
          row.endDate == null ? null : row.endDate.toLocal().toString(),
          row.description,
          row.coverPathFile,
          row.companyId,
          row.visitorName,
          row.visitorTypeValue,
          row.contactPersonName,
          row.contactPersonPhone,
          row.contactPersonEmail,
          row.timeZone,
          row.branchName,
          row.branchAddress,
          row.preRegisterId,
          row.visitorEmail,
          row.invitationId,
          row.hostInfo,
          row.visitorPhoneNumber,
          row.visitorCompany,
          row.inviteCode);
    }).getSingle();
  }

  Future<List<ItemInvitation>> getAlls(int exceedingSeconds) async {
    final date = DateTime.now().toUtc();
    final hourExpected =
        exceedingSeconds / Constants.EXCEEDING_SECONDS_SEARCH_INVITATION;
    final query = select(invitationExpectedEntity)
      ..where((t) {
        return t.startDate.year.equals(date.year) &
            t.startDate.month.equals(date.month) &
            t.startDate.day.equals(date.day) &
            isNull(t.signIn);
      });
    List<ItemInvitation> lstReturn = List();
    for (var row in await query.get()) {
      final isCheck = isCheckCompareTwoDateInviteExpected(
          row.startDate, date, hourExpected);
      if (!isCheck) {
        continue;
      }
      final itemInvitation = ItemInvitation.local(
          row.eventName,
          row.branchId,
          row.contactPersonId,
          row.visitorType,
          row.startDate == null ? null : row.startDate.toLocal().toString(),
          row.endDate == null ? null : row.endDate.toLocal().toString(),
          row.description,
          row.coverPathFile,
          row.companyId,
          row.visitorName,
          row.visitorTypeValue,
          row.contactPersonName,
          row.contactPersonPhone,
          row.contactPersonEmail,
          row.timeZone,
          row.branchName,
          row.branchAddress,
          row.preRegisterId,
          row.visitorEmail,
          row.invitationId,
          row.hostInfo,
          row.visitorPhoneNumber,
          row.visitorCompany,
          row.inviteCode);
      lstReturn.add(itemInvitation);
    }
    return lstReturn;
  }

  Future<void> insertAlls(List<ItemInvitation> lstItems) async {
    final preference = await SharedPreferences.getInstance();
    final userName = preference.getString(Constants.KEY_EMAIL) ?? "";
    final date = DateTime.now().toUtc();
    for (var item in lstItems) {
      final query = select(invitationExpectedEntity)
        ..where((t) => t.inviteCode.equals(item.inviteCode));
      final result = await query.getSingle();
      if (result != null) {
        update(invitationExpectedEntity)
          ..whereSamePrimaryKey(result)
          ..write(InvitationExpectedEntityCompanion(
            eventName: Value(item.eventName),
            branchId: Value(item.branchId),
            contactPersonId: Value(item.contactPersonId),
            visitorType: Value(item.visitorType),
            startDate: Value(item.startDate == null
                ? item.startDate
                : DateTime.tryParse(item.startDate).toUtc()),
            endDate: Value(item.endDate == null
                ? item.endDate
                : DateTime.tryParse(item.endDate).toUtc()),
            description: Value(item.description),
            coverPathFile: Value(item.nameImgLocal),
            companyId: Value(item.companyId),
            visitorName: Value(item.visitorName),
            visitorTypeValue: Value(item.visitorTypeValue),
            contactPersonName: Value(item.contactPersonName),
            contactPersonPhone: Value(item.contactPersonPhone),
            contactPersonEmail: Value(item.contactPersonEmail),
            timeZone: Value(item.timeZone),
            branchName: Value(item.branchName),
            branchAddress: Value(item.branchAddress),
            preRegisterId: Value(item.preRegisterId),
            visitorEmail: Value(item.visitorEmail),
            invitationId: Value(item.invitationId),
            hostInfo: Value(item.hostInfo),
            visitorPhoneNumber: Value(item.visitorPhoneNumber),
            visitorCompany: Value(item.visitorCompany),
            inviteCode: Value(item.inviteCode),
            updatedBy: Value(userName),
            updatedDate: Value(date),
          ));
      } else {
        into(invitationExpectedEntity).insert(InvitationExpectedEntityCompanion(
          eventName: Value(item.eventName),
          branchId: Value(item.branchId),
          contactPersonId: Value(item.contactPersonId),
          visitorType: Value(item.visitorType),
          startDate: Value(item.startDate == null
              ? item.startDate
              : DateTime.tryParse(item.startDate).toUtc()),
          endDate: Value(item.endDate == null
              ? item.endDate
              : DateTime.tryParse(item.endDate).toUtc()),
          description: Value(item.description),
          coverPathFile: Value(item.nameImgLocal),
          companyId: Value(item.companyId),
          visitorName: Value(item.visitorName),
          visitorTypeValue: Value(item.visitorTypeValue),
          contactPersonName: Value(item.contactPersonName),
          contactPersonPhone: Value(item.contactPersonPhone),
          contactPersonEmail: Value(item.contactPersonEmail),
          timeZone: Value(item.timeZone),
          branchName: Value(item.branchName),
          branchAddress: Value(item.branchAddress),
          preRegisterId: Value(item.preRegisterId),
          visitorEmail: Value(item.visitorEmail),
          invitationId: Value(item.invitationId),
          hostInfo: Value(item.hostInfo),
          visitorPhoneNumber: Value(item.visitorPhoneNumber),
          visitorCompany: Value(item.visitorCompany),
          inviteCode: Value(item.inviteCode),
          signIn: Value.absent(),
          createdBy: Value(userName),
          createdDate: Value(date),
          updatedBy: Value(userName),
          updatedDate: Value(date),
        ));
      }
    }
  }

  Future<void> updateSignInTimeByInviteCode(
      String inviteCode, DateTime signIn) async {
    final preference = await SharedPreferences.getInstance();
    final userName = preference.getString(Constants.KEY_EMAIL) ?? "";
    final date = DateTime.now().toUtc();
    // Query
    final query = select(invitationExpectedEntity)
      ..where((t) {
        return t.startDate.year.equals(date.year) &
            t.startDate.month.equals(date.month) &
            t.startDate.day.equals(date.day) &
            t.inviteCode.equals(inviteCode);
      });
    final result = await query.getSingle();
    if (result != null) {
      // Update
      update(invitationExpectedEntity)
        ..whereSamePrimaryKey(result)
        ..write(InvitationExpectedEntityCompanion(
          signIn: Value(signIn.toUtc()),
          updatedBy: Value(userName),
          updatedDate: Value(date),
        ));
      // Insert visitor log today
      final visitorLogToday = ItemVisitor.insertLocal(
          result.visitorName,
          result.visitorEmail,
          result.visitorPhoneNumber,
          result.preRegisterId,
          signIn.toString(),
          null,
          null,
          result.visitorCompany,
          result.visitorType,
          result.description,
          null,
          null,
          result.branchName,
          result.eventName,
          0,
          result.visitorTypeValue,
          null,
          null,
          result.inviteCode);
      db.myVisitorLogTodayDAO.insert(visitorLogToday);

      // Insert visitor log
      final visitorLog = VisitorLog.insertLocal(
          0,
          result.visitorName,
          result.visitorPhoneNumber,
          result.visitorEmail,
          signIn.toString(),
          null,
          result.visitorCompany,
          result.branchId != null ? result.branchId.toInt() : null,
          result.branchName,
          null,
          null,
          null,
          result.visitorType,
          result.visitorTypeValue,
          result.inviteCode,
          null);
      db.myVisitorLogDAO.insert(visitorLog);
    }
  }

  Future<void> deleteAlls() async {
    delete(invitationExpectedEntity).go();
  }
}
