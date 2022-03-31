import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/MyInvitationEntity.dart';
import 'package:checkinpromobile/src/model/InviteNewVisitor.dart';
import 'package:moor/moor.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'MyInvitationDAO.g.dart';

@UseDao(tables: [
  MyInvitationEntity
], queries: {
  '_invitationWithCount': 'SELECT COUNT(*) FROM cip_today_my_invitation'
})
class MyInvitationDAO extends DatabaseAccessor<Database>
    with _$MyInvitationDAOMixin {
  Database db;

  MyInvitationDAO(this.db) : super(db);

  Future<int> getCounts() {
    return _invitationWithCount().getSingle();
  }

  Future<List<InviteNewVisitor>> getAlls(int offset) async {
    DateTime now = DateTime.now();
    final query = select(myInvitationEntity)
      ..where((tbl) =>
      afterDate(tbl, now))
      ..limit(Constants.PAGE_MAX_SIZE, offset: offset * Constants.PAGE_MAX_SIZE)
      ..orderBy([
        (t) => OrderingTerm(expression: t.startDate, mode: OrderingMode.asc)
      ]);
    final lst = await query.map((row) {
      return InviteNewVisitor.local(
          row.id,
          row.invitationName,
          row.branchId,
          row.branchName,
          row.branchAddress,
          row.visitorType,
          row.visitorTypeValue,
          row.startDate == null ? null : row.startDate.toLocal().toString(),
          row.description,
          [],
          row.endDate == null ? null : row.endDate.toLocal().toString(),
          row.color,
          row.status);
    }).get();
    for (var item in lst) {
      final guest = await db.visitorInvitationDAO.getAlls(item.id);
      item.guests = guest;
    }
    return lst;
  }

  Future<List<InviteNewVisitor>> getByMonth(int month) async {
    DateTime now = DateTime.now();
    final query = select(myInvitationEntity)
      ..where(
          (tbl) => (tbl.startDate + now.timeZoneOffset).month.equals(month));
    final lst = await query.map((row) {
      return InviteNewVisitor.local(
          row.id,
          row.invitationName,
          row.branchId,
          row.branchName,
          row.branchAddress,
          row.visitorType,
          row.visitorTypeValue,
          row.startDate == null ? null : row.startDate.toLocal().toString(),
          row.description,
          [],
          row.endDate == null ? null : row.endDate.toLocal().toString(),
          row.color,
          row.status);
    }).get();
    for (var item in lst) {
      final guest = await db.visitorInvitationDAO.getAlls(item.id);
      item.guests = guest;
    }
    return lst;
  }

  Expression<bool> equalsInDate($MyInvitationEntityTable tbl, DateTime now) {
    var startDate = (tbl.startDate + now.timeZoneOffset);
    return startDate.day.equals(now.day) &
        startDate.month.equals(now.month) &
        startDate.year.equals(now.year);
  }

  Expression<bool> afterDate($MyInvitationEntityTable tbl, DateTime now) {
    return tbl.startDate.isBiggerOrEqualValue(now);
  }

  Future<void> insertAlls(List<InviteNewVisitor> lstInviteNewVisitor) async {
    final preferences = await SharedPreferences.getInstance();
    final userName = preferences.getString(Constants.KEY_EMAIL) ?? "";
    final date = DateTime.now().toUtc();
    for (var item in lstInviteNewVisitor) {
      into(myInvitationEntity)
          .insertOnConflictUpdate(MyInvitationEntityCompanion(
        id: Value(item.id),
        invitationName: Value(item.invitationName),
        branchAddress: Value(item.branchAddress),
        branchId: Value(item.branchId),
        branchName: Value(item.branchName),
        description: Value(item.description),
        startDate: item.startDate == null
            ? Value.absent()
            : Value(DateTime.tryParse(item.startDate)),
        endDate: item.endDate == null
            ? Value.absent()
            : Value(DateTime.tryParse(item.endDate)),
        color: Value(item.color),
        visitorType: Value(item.visitorType),
        visitorTypeValue: Value(item.visitorTypeValue),
        status: Value(item.status),
        createdBy: Value(userName),
        createdDate: Value(date),
        updatedBy: Value(userName),
        updatedDate: Value(date),
      ))
          .then((rowId) {
        db.visitorInvitationDAO.insertAlls(item.guests, item.id);
      });
    }
  }

  Future<void> deleteAlls() async {
    delete(myInvitationEntity).go();
  }
}
