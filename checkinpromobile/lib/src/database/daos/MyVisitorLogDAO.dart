import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/MyVisitorLogEntity.dart';
import 'package:checkinpromobile/src/model/VisitorLog.dart';
import 'package:moor/moor.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'MyVisitorLogDAO.g.dart';

@UseDao(tables: [MyVisitorLogEntity])
class MyVisitorLogDAO extends DatabaseAccessor<Database>
    with _$MyVisitorLogDAOMixin {
  Database db;

  MyVisitorLogDAO(this.db) : super(db);

  Future<List<VisitorLog>> getAlls(int offset, bool notYetCheckOut) async {
    final query = select(myVisitorLogEntity)
      ..where((t) {
        if (notYetCheckOut) {
          return isNull(t.signOut);
        } else {
          return isNotNull(t.signOut);
        }
      })
      ..limit(Constants.PAGE_MAX_SIZE, offset: offset * Constants.PAGE_MAX_SIZE)
      ..orderBy(
          [(t) => OrderingTerm(expression: t.signIn, mode: OrderingMode.desc)]);
    return query.map((row) {
      return VisitorLog.local(
          row.idVistor,
          row.fullName,
          row.phoneNumber,
          row.email,
          row.signIn == null ? row.signIn : row.signIn.toLocal().toString(),
          row.signOut == null ? row.signOut : row.signOut.toLocal().toString(),
          row.fromCompany,
          row.branchId,
          row.branchName,
          row.faceCaptureFile,
          row.feedback,
          row.rating,
          row.visitorType,
          row.visitorTypeValue,
          row.inviteCode);
    }).get();
  }

  Future<void> insert(VisitorLog item) async {
    final preferences = await SharedPreferences.getInstance();
    final userName = preferences.getString(Constants.KEY_EMAIL) ?? "";
    final date = DateTime.now().toUtc();
    final companion = MyVisitorLogEntityCompanion(
      idVistor: Value(item.id),
      branchId: Value(item.branchId),
      branchName: Value(item.branchName),
      email: Value(item.email),
      faceCaptureFile: Value(item.nameImgLocal),
      feedback: Value(item.feedback),
      fromCompany: Value(item.fromCompany),
      fullName: Value(item.fullName),
      inviteCode: Value(item.inviteCode),
      phoneNumber: Value(item.phoneNumber),
      rating: Value(item.rating),
      signIn: item.signIn == null
          ? Value.absent()
          : Value(DateTime.tryParse(item.signIn).toUtc()),
      signOut: item.signOut == null
          ? Value.absent()
          : Value(DateTime.tryParse(item.signOut).toUtc()),
      visitorType: Value(item.visitorType),
      visitorTypeValue: Value(item.visitorTypeValue),
      createdBy: Value(userName),
      createdDate: Value(date),
      updatedBy: Value(userName),
      updatedDate: Value(date),
    );
    into(myVisitorLogEntity).insert(companion);
  }

  Future<void> updateSignOutByInviteCode(
      String inviteCode, DateTime signOut) async {
    final preferences = await SharedPreferences.getInstance();
    final userName = preferences.getString(Constants.KEY_EMAIL) ?? "";
    final date = DateTime.now().toUtc();

    final query = select(myVisitorLogEntity)
      ..where((t) => t.inviteCode.equals(inviteCode) & isNull(t.signOut));
    final result = await query.getSingle();
    if (result != null) {
      update(myVisitorLogEntity)
        ..whereSamePrimaryKey(result)
        ..write(MyVisitorLogEntityCompanion(
          signOut: Value(signOut.toUtc()),
          updatedBy: Value(userName),
          updatedDate: Value(date),
        ));
    }
  }

  Future<void> deleteAllsSignIn() async {
    delete(myVisitorLogEntity)
      ..where((t) => isNull(t.signOut))
      ..go();
  }

  Future<void> deleteAllsSignOut() async {
    delete(myVisitorLogEntity)
      ..where((t) => isNotNull(t.signOut))
      ..go();
  }

  Future<void> deleteAlls() async {
    delete(myVisitorLogEntity).go();
  }
}
