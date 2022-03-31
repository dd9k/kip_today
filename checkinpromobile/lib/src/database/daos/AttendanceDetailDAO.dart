import 'dart:convert';

import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/AttendanceDetailEntity.dart';
import 'package:checkinpromobile/src/model/AttendanceDetailResponse.dart';
import 'package:checkinpromobile/src/model/AttendanceList.dart';
import 'package:moor/moor.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'AttendanceDetailDAO.g.dart';

@UseDao(tables: [AttendanceDetailEntity])
class AttendanceDetailDAO extends DatabaseAccessor<Database>
    with _$AttendanceDetailDAOMixin {
  Database db;

  AttendanceDetailDAO(this.db) : super(db);

  Future<List<AttendanceDetail>> getAlls(DateTime date) async {
    final dayOfMonthCompare = '${date.year}${date.month}';
    final query = select(attendanceDetailEntity)
      ..where((t) => t.dayOfMonthCompare.equals(dayOfMonthCompare))
      ..orderBy([
        (t) => OrderingTerm(expression: t.dayOfMonth, mode: OrderingMode.asc)
      ]);
    return query.map((row) {
      List<AttendanceList> lstAttendanceTimeData;
      if (row.dataJson != null) {
        List<dynamic> lstMap = JsonDecoder().convert(row.dataJson);
        lstAttendanceTimeData =
            (lstMap).map((map) => AttendanceList.fromJson(map)).toList();
      }
      return AttendanceDetail(
          row.dayOfMonth,
          row.location,
          row.isLate,
          row.isEnoughWorkingTime,
          row.totalWorkingTime,
          row.checkin == null ? null : row.checkin.toLocal().toString(),
          row.checkout == null ? null : row.checkout.toLocal().toString(),
          lstAttendanceTimeData);
    }).get();
  }

  Future<void> insertAlls(List<AttendanceDetail> lstAttendanceDetail) async {
    final preference = await SharedPreferences.getInstance();
    final userName = preference.getString(Constants.KEY_EMAIL) ?? "";
    final date = DateTime.now().toUtc();
    // Insert all
    await batch((batch) {
      batch.insertAll(
          attendanceDetailEntity,
          lstAttendanceDetail.map((item) {
            List<Map<String, dynamic>> dataJson;
            if (item.attendanceList != null) {
              dataJson = item.attendanceList.map((item) {
                return item.toJson();
              }).toList();
            }
            final dateOfMonthDateTime =
                DateTime.tryParse(item.dayOfMonth ?? '');
            final dayOfMonthCompare = dateOfMonthDateTime == null
                ? null
                : '${dateOfMonthDateTime.year}${dateOfMonthDateTime.month}';
            // Insert model to table
            return AttendanceDetailEntityCompanion.insert(
              checkin: item.checkin == null
                  ? Value.absent()
                  : Value(DateTime.tryParse(item.checkin).toUtc()),
              checkout: item.checkout == null
                  ? Value.absent()
                  : Value(DateTime.tryParse(item.checkout).toUtc()),
              dayOfMonth: item.dayOfMonth == null
                  ? Value.absent()
                  : Value(item.dayOfMonth),
              location: Value(item.location),
              totalWorkingTime: Value(item.totalWorkingTime),
              isLate: Value(item.isLate),
              isEnoughWorkingTime: Value(item.isEnoughWorkingTime),
              note: Value.absent(),
              dataJson: dataJson == null
                  ? Value.absent()
                  : Value(JsonEncoder().convert(dataJson)),
              dayOfMonthCompare: dayOfMonthCompare == null
                  ? Value.absent()
                  : Value(dayOfMonthCompare),
              createdBy: Value(userName),
              createdDate: Value(date),
              updatedBy: Value(userName),
              updatedDate: Value(date),
            );
          }).toList());
    });
  }

  Future<void> deleteAllsByDate(DateTime date) async {
    final dayOfMonthCompare = '${date.year}${date.month}';
    delete(attendanceDetailEntity)
      ..where((t) => t.dayOfMonthCompare.equals(dayOfMonthCompare))
      ..go();
  }

  Future<void> deleteAlls() async {
    delete(attendanceDetailEntity).go();
  }
}
