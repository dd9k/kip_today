import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/WorkingTimeEntity.dart';
import 'package:checkinpromobile/src/model/WorkingTimeInfo.dart';
import 'package:moor/moor.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'WorkingTimeDAO.g.dart';

@UseDao(tables: [WorkingTimeEntity])
class WorkingTimeDAO extends DatabaseAccessor<Database>
    with _$WorkingTimeDAOMixin {
  Database db;

  WorkingTimeDAO(this.db) : super(db);

  Future<WorkingTimeInfo> getWorkingTimeInfo() async {
    final query = select(workingTimeEntity);
    return query.map((row) {
      return WorkingTimeInfo(row.totalhourOfWeek, row.totalHourOfMonth, row.totalLateDayInMonth, row.totalNotCheckoutDayInMonth, row.totalNotEnoughInMonth);
    }).getSingle();
  }

  Future<void> insert(double totalHourOfWeek, double totalHourOfMonth, int totalLateDayInMonth, int totalNotCheckoutDayInMonth, int totalNotEnoughInMonth) async {
    final preference = await SharedPreferences.getInstance();
    final userName = preference.getString(Constants.KEY_EMAIL) ?? "";
    final createdDate = DateTime.now().toUtc();
    // Insert row
    into(workingTimeEntity).insert(WorkingTimeEntityCompanion(
        totalhourOfWeek: Value(totalHourOfWeek),
        totalHourOfMonth: Value(totalHourOfMonth),
        totalLateDayInMonth: Value(totalLateDayInMonth),
        totalNotCheckoutDayInMonth: Value(totalNotCheckoutDayInMonth),
        totalNotEnoughInMonth: Value(totalNotEnoughInMonth),
        createdBy: Value(userName),
        createdDate: Value(createdDate),
        updatedBy: Value(userName),
        updatedDate: Value(createdDate)));
  }

  Future<void> deleteAlls() async {
    delete(workingTimeEntity).go();
  }
}
