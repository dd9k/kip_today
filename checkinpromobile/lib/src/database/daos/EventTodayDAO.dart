import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/EventTodayEntity.dart';
import 'package:checkinpromobile/src/model/EventDetailInfo.dart';
import 'package:checkinpromobile/src/model/ItemEventToday.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:moor/moor.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'EventTodayDAO.g.dart';

@UseDao(tables: [EventTodayEntity])
class EventTodayDAO extends DatabaseAccessor<Database>
    with _$EventTodayDAOMixin {
  Database db;

  EventTodayDAO(this.db) : super(db);

  Future<List<ItemEventToday>> getAlls() async {
    final date = DateTime.now().toUtc();
    final query = select(eventTodayEntity)
      ..where((tbl) =>
          tbl.startDateEvent.day.isBetweenValues(date.day, date.day) &
          tbl.startDateEvent.month.isBetweenValues(date.month, date.month) &
          tbl.startDateEvent.year.isBetweenValues(date.year, date.year))
      ..orderBy([
        (t) =>
            OrderingTerm(expression: t.startDateEvent, mode: OrderingMode.desc)
      ]);
    return query.map((row) {
      return ItemEventToday.local(
          row.eventId,
          row.coverPathFile,
          row.eventName,
          row.branchId,
          row.contactPersonId,
          row.visitorType,
          row.contactPersonName,
          row.contactPersonEmail,
          row.visitorTypeValue,
          row.companyId,
          row.siteName,
          row.siteAddress,
          row.startDateEvent.toLocal().toString(),
          row.endDateEvent.toLocal().toString(),
          row.description,
          row.notifySetting,
          row.badgeTemplateId,
          row.isPrint,
          row.branchName);
    }).get();
  }

  Future<EventDetailInfo> getEventDetailById(double eventId) async {
    final date = DateTime.now().toUtc();
    final query = select(eventTodayEntity)
      ..where((tbl) =>
          tbl.eventId.equals(eventId) &
          tbl.startDateEvent.day.isBetweenValues(date.day, date.day) &
          tbl.startDateEvent.month.isBetweenValues(date.month, date.month) &
          tbl.startDateEvent.year.isBetweenValues(date.year, date.year));
    return query.map((row) {
      return EventDetailInfo.local(
        row.eventId,
        row.eventName,
        row.branchId.toInt(),
        row.contactPersonId.toInt(),
        row.visitorType,
        row.startDateEvent.toLocal().toString(),
        row.endDateEvent.toLocal().toString(),
        row.description,
        row.coverPathFile,
        row.companyId.toInt(),
        row.visitorTypeValue,
        row.contactPersonName,
        row.contactPersonEmail,
        row.branchName,
        row.siteName,
        row.siteAddress,
        row.isPrint,
        row.badgeTemplateId,
      );
    }).getSingle();
  }

  Future<void> insertAlls(List<ItemEventToday> lstEventToday) async {
    final preference = await SharedPreferences.getInstance();
    final userName = preference.getString(Constants.KEY_EMAIL) ?? "";
    final date = DateTime.now().toUtc();
    // Insert entities
    await batch((batch) {
      batch.insertAll(
          eventTodayEntity,
          lstEventToday.map((item) {
            return EventTodayEntityCompanion.insert(
              eventId: item.id,
              eventName: Value(item.eventName),
              coverPathFile: Value(item.nameImgLocal),
              branchId: Value(item.branchId),
              contactPersonId: Value(item.contactPersonId),
              visitorType: Value(item.visitorType),
              contactPersonName: Value(item.contactPersonName),
              contactPersonEmail: Value(item.contactPersonEmail),
              visitorTypeValue: Value(item.visitorTypeValue),
              companyId: Value(item.companyId),
              siteName: Value(item.sitName),
              siteAddress: Value(item.siteAddress),
              startDateEvent: Value(DateTime.parse(item.startDate).toUtc()),
              endDateEvent: Value(DateTime.parse(item.endDate).toUtc()),
              description: Value(item.description),
              notifySetting: Value(item.notifySetting),
              badgeTemplateId: Value(item.badgeTemplateId),
              isPrint: Value(item.isPrint),
              branchName: Value(item.branchName),
              createdBy: Value(userName),
              createdDate: Value(date),
              updatedBy: Value(userName),
              updatedDate: Value(date),
            );
          }).toList());
    });
  }

  Future<void> deleteAlls() async {
    delete(eventTodayEntity).go();
  }
}
