import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/EventTicketEntity.dart';
import 'package:checkinpromobile/src/model/EventTicket.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:moor/moor.dart';

part 'EventTicketDAO.g.dart';

@UseDao(tables: [EventTicketEntity])
class EventTicketDAO extends DatabaseAccessor<Database> with _$EventTicketDAOMixin {
  Database db;

  EventTicketDAO(this.db) : super(db);

  Future<void> insert(EventTicket eventTicket) async {
    EventTicketEntityCompanion companion = createCompanion(eventTicket);

    into(eventTicketEntity).insertOnConflictUpdate(companion);
  }

  Future<void> insertAll(List<EventTicket> eventTickets) async {
    if (eventTickets?.isNotEmpty == true) {
      await batch((batch) {
        batch.insertAllOnConflictUpdate(
            eventTicketEntity,
            eventTickets.map((row) {
              return createCompanion(row);
            }).toList());
      });
    }
  }

  Future<EventTicket> getEventTicketById(double id) async {
    final query = select(eventTicketEntity)..where((tbl) => tbl.id.equals(id));
    List<EventTicket> list = await query.map((row) => EventTicket.copyWithEntity(row)).get();
    if (query == null || list.isEmpty) {
      return null;
    }
    return list.first;
  }

  Future<List<EventTicket>> getAllEventTicket(bool isConnection, bool isEnded) async {
    DateTime now = await Utilities().getDateTimeNow(isConnection);
    final query = select(eventTicketEntity)
      ..where((tbl) => isEnded ? tbl.endDate.isSmallerThanValue(now) : tbl.endDate.isBiggerOrEqualValue(now))
      ..orderBy([
        (t) => OrderingTerm(expression: t.startDate, mode: OrderingMode.asc),
      ]);
    List<EventTicket> list = await query.map((row) => EventTicket.copyWithEntity(row)).get();
    if (query == null || list.isEmpty) {
      return List();
    }
    return list;
  }

  EventTicketEntityCompanion createCompanion(EventTicket eventTicket) {
    final companion = EventTicketEntityCompanion(
        id: Value(eventTicket.id),
        eventName: Value(eventTicket.eventName),
        siteName: Value(eventTicket.siteName),
        siteAddress: Value(eventTicket.siteAddress),
        eventType: Value(eventTicket.eventType),
        startDate: eventTicket.startDate == null ? Value.absent() : Value(DateTime.tryParse(eventTicket.startDate)),
        endDate: eventTicket.endDate == null ? Value.absent() : Value(DateTime.tryParse(eventTicket.endDate)),
        description: Value(eventTicket.description),
        coverPathFile: Value(eventTicket.coverPathFile),
        coverRepoId: Value(eventTicket.coverRepoId),
        contactPhone: Value(eventTicket.contactPhone),
        contactEmail: Value(eventTicket.contactEmail),
        organizersName: Value(eventTicket.organizersName),
        organizersInfo: Value(eventTicket.organizersInfo),
        reminderDays: Value(eventTicket.reminderDays),
        sendReminder: Value(eventTicket.sendReminder),
        branchId: Value(eventTicket.branchId),
        companyId: Value(eventTicket.companyId),
        startedState: Value(eventTicket.startedState),
        orderedState: Value(eventTicket.orderedState),
        isOnline: Value(eventTicket.isOnline));
    return companion;
  }

  Future<void> deleteByEventId(double eventId) async {
    await (delete(eventTicketEntity)..where((tbl) => tbl.id.equals(eventId))).go();
  }

  Future<void> deleteAll() async {
    delete(eventTicketEntity).go();
  }
}
