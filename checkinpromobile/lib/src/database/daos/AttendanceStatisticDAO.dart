import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/AttendanceStatisticEntity.dart';
import 'package:checkinpromobile/src/model/AttendanceChart.dart';
import 'package:moor/moor.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'AttendanceStatisticDAO.g.dart';

@UseDao(tables: [AttendanceStatisticEntity])
class AttendanceStatisticDAO extends DatabaseAccessor<Database>
    with _$AttendanceStatisticDAOMixin {
  Database db;

  AttendanceStatisticDAO(this.db) : super(db);

  Future<List<AttendanceChart>> getAlls() async {
    final query = select(attendanceStatisticEntity);
    return query.map((row) {
      return AttendanceChart(row.month, row.workingTime);
    }).get();
  }

  Future<void> insertAlls(List<AttendanceChart> lstAttendanceChart) async {
    final preference = await SharedPreferences.getInstance();
    final userName = preference.getString(Constants.KEY_EMAIL) ?? "";
    final date = DateTime.now().toUtc();
    await batch((batch) {
      batch.insertAll(
          attendanceStatisticEntity,
          lstAttendanceChart.map((item) {
            return AttendanceStatisticEntityCompanion.insert(
              month: item.month,
              workingTime: item.workingTime,
              createdBy: Value(userName),
              createdDate: Value(date),
              updatedBy: Value(userName),
              updatedDate: Value(date),
            );
          }).toList());
    });
  }

  Future<void> deleteAlls() async {
    delete(attendanceStatisticEntity).go();
  }
}
