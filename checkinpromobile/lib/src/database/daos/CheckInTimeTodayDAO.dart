import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/CheckInTimeTodayEntity.dart';
import 'package:moor/moor.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'CheckInTimeTodayDAO.g.dart';

@UseDao(tables: [CheckInTimeTodayEntity])
class CheckInTimeTodayDAO extends DatabaseAccessor<Database>
    with _$CheckInTimeTodayDAOMixin {
  Database db;

  CheckInTimeTodayDAO(this.db) : super(db);

  Future<void> insert(
      String checkInTime, String checkOutTime, String date) async {
    final preference = await SharedPreferences.getInstance();
    final userName = preference.getString(Constants.KEY_EMAIL) ?? "";
    final createdDate = DateTime.now().toUtc();
    // Insert row
    into(checkInTimeTodayEntity).insert(CheckInTimeTodayEntityCompanion(
        checkIn: Value(checkInTime == null
            ? checkInTime
            : DateTime.tryParse(checkInTime).toUtc()),
        checkOut: Value(checkOutTime == null
            ? checkOutTime
            : DateTime.tryParse(checkOutTime).toUtc()),
        date: Value(date == null ? date : DateTime.tryParse(date).toUtc()),
        createdBy: Value(userName),
        createdDate: Value(createdDate),
        updatedBy: Value(userName),
        updatedDate: Value(createdDate)));
  }

  Future<Map<String, String>> getCheckInTimeToday() async {
    final today = DateTime.now().toUtc();
    final query = select(checkInTimeTodayEntity)
      ..where((t) =>
          t.checkIn.day.equals(today.day) &
          t.checkIn.month.equals(today.month) &
          t.checkIn.year.equals(today.year));
    return query.map((row) {
      return {
        'timeIn': row.checkIn == null ? null : row.checkIn.toLocal().toString(),
        'timeOut':
            row.checkOut == null ? null : row.checkOut.toLocal().toString(),
        'date': row.date == null ? null : row.date.toLocal().toString()
      };
    }).getSingle();
  }

  Future<void> deleteAlls() async {
    delete(checkInTimeTodayEntity).go();
  }
}
