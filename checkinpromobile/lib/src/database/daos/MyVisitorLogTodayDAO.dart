import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/MyVisitorLogTodayEntity.dart';
import 'package:checkinpromobile/src/model/ItemVisitor.dart';
import 'package:moor/moor.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'MyVisitorLogTodayDAO.g.dart';

@UseDao(tables: [MyVisitorLogTodayEntity])
class MyVisitorLogTodayDAO extends DatabaseAccessor<Database>
    with _$MyVisitorLogTodayDAOMixin {
  Database db;

  MyVisitorLogTodayDAO(this.db) : super(db);

  Future<List<ItemVisitor>> getAllsForFours() async {
    final dateNow = DateTime.now().toUtc();
    final query = select(myVisitorLogTodayEntity)
      ..orderBy(
          [(t) => OrderingTerm(expression: t.signIn, mode: OrderingMode.desc)])
      ..limit(4, offset: 0)
      ..where((t) =>
          t.signIn.day.equals(dateNow.day) &
          t.signIn.month.equals(dateNow.month) &
          t.signIn.year.equals(dateNow.year));
    return query.map((row) {
      return ItemVisitor.local(
        row.fullName,
        row.email,
        row.phoneNumber,
        row.idVistor,
        row.signIn == null ? null : row.signIn.toLocal().toString(),
        row.signOut == null ? null : row.signOut.toLocal().toString(),
        row.toCompany,
        row.fromCompany,
        row.visitorTypeValue,
        row.purpose,
        row.feedback,
        row.rating,
        row.branchName,
        row.eventName,
        row.totalCount,
        row.typeDescription,
        row.faceCaptureFile,
      );
    }).get();
  }

  Future<void> insert(ItemVisitor itemVisitor) async {
    final preference = await SharedPreferences.getInstance();
    final userName = preference.getString(Constants.KEY_EMAIL) ?? "";
    final date = DateTime.now().toUtc();
    into(myVisitorLogTodayEntity).insert(MyVisitorLogTodayEntityCompanion(
      idVistor: Value(itemVisitor.id),
      branchName: Value(itemVisitor.brachName),
      email: Value(itemVisitor.email),
      eventName: Value(itemVisitor.evenName),
      faceCaptureFile: Value(itemVisitor.faceCaptureFile),
      feedback: Value(itemVisitor.feedback),
      fromCompany: Value(itemVisitor.fromCompany),
      fullName: Value(itemVisitor.fullName),
      phoneNumber: Value(itemVisitor.phoneNumber),
      purpose: Value(itemVisitor.purpose),
      rating: Value(itemVisitor.rating),
      signIn: itemVisitor.signIn == null
          ? Value.absent()
          : Value(DateTime.tryParse(itemVisitor.signIn).toUtc()),
      signOut: itemVisitor.signOut == null
          ? Value.absent()
          : Value(DateTime.tryParse(itemVisitor.signOut).toUtc()),
      toCompany: Value(itemVisitor.toCompany),
      totalCount: Value(itemVisitor.totalCount),
      typeDescription: Value(itemVisitor.typeDescription),
      visitorTypeValue: Value(itemVisitor.visitorTypeValue),
      inviteCode: Value(itemVisitor.inviteCode),
      createdBy: Value(userName),
      createdDate: Value(date),
      updatedBy: Value(userName),
      updatedDate: Value(date),
    ));
  }

  Future<void> insertAlls(List<ItemVisitor> lstVisitorLog) async {
    final preference = await SharedPreferences.getInstance();
    final userName = preference.getString(Constants.KEY_EMAIL) ?? "";
    final date = DateTime.now().toUtc();
    await batch((batch) {
      batch.insertAll(
          myVisitorLogTodayEntity,
          lstVisitorLog.map((item) {
            return MyVisitorLogTodayEntityCompanion.insert(
              fullName: Value(item.fullName),
              email: Value(item.email),
              phoneNumber: Value(item.phoneNumber),
              idVistor: item.id ?? 0,
              signIn: Value(item.signIn == null
                  ? item.signIn
                  : DateTime.tryParse(item.signIn).toUtc()),
              signOut: Value(item.signOut == null
                  ? item.signOut
                  : DateTime.tryParse(item.signOut).toUtc()),
              toCompany: Value(item.toCompany),
              fromCompany: Value(item.fromCompany),
              visitorTypeValue: Value(item.visitorTypeValue),
              purpose: Value(item.purpose),
              feedback: Value(item.feedback),
              rating: Value(item.rating),
              branchName: Value(item.brachName),
              eventName: Value(item.evenName),
              totalCount: Value(item.totalCount),
              typeDescription: Value(item.typeDescription),
              faceCaptureFile: Value(item.nameImgLocal),
              inviteCode: Value(item.inviteCode),
              createdBy: Value(userName),
              createdDate: Value(date),
              updatedBy: Value(userName),
              updatedDate: Value(date),
            );
          }).toList());
    });
  }

  Future<void> updateSignOutByInviteCode(
      String inviteCode, DateTime signOut) async {
    final preference = await SharedPreferences.getInstance();
    final userName = preference.getString(Constants.KEY_EMAIL) ?? "";
    final date = DateTime.now().toUtc();

    final query = select(myVisitorLogTodayEntity)
      ..where((t) => t.inviteCode.equals(inviteCode) & isNull(t.signOut));
    final result = await query.getSingle();
    if (result != null) {
      update(myVisitorLogTodayEntity)
        ..whereSamePrimaryKey(result)
        ..write(MyVisitorLogTodayEntityCompanion(
          signOut: Value(signOut.toUtc()),
          updatedBy: Value(userName),
          updatedDate: Value(date),
        ));
    }
  }

  Future<void> deleteAlls() async {
    delete(myVisitorLogTodayEntity).go();
  }
}
