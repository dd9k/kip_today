import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/database/entities/EventCheckInSyncEntity.dart';
import 'package:checkinpromobile/src/database/entities/EventGuestAllEntity.dart';
import 'package:checkinpromobile/src/model/EventCheckInSync.dart';
import 'package:checkinpromobile/src/model/EventGuest.dart';
import 'package:checkinpromobile/src/model/EventGuestOffline.dart';
import 'package:checkinpromobile/src/model/ItemVisitor.dart';
import 'package:checkinpromobile/src/model/VisitorLog.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:moor/moor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

part 'EventGuestDAO.g.dart';

@UseDao(tables: [EventCheckInSyncEntity, EventGuestAllEntity])
class EventGuestDAO extends DatabaseAccessor<Database>
    with _$EventGuestDAOMixin {
  Database db;

  EventGuestDAO(this.db) : super(db);

  Future<bool> checkSynchronizedGuestAll(double eventId) async {
    final query = select(eventGuestAllEntity)
      ..where((tbl) => tbl.eventId.equals(eventId));
    final lst = await query.get();

    return lst.length > 0;
  }

  Future<List<EventGuest>> getAlls(double eventId, int offset) {
    final query = select(eventGuestAllEntity)
      ..where((tbl) => tbl.eventId.equals(eventId))
      ..limit(Constants.PAGE_MAX_SIZE,
          offset: offset * Constants.PAGE_MAX_SIZE);
    return query.map((row) {
      return EventGuest.local(
          row.eventId,
          row.visitorName,
          row.visitorEmail,
          row.visitorPhoneNumber,
          row.visitorType,
          row.inviteCode,
          row.checkinStatus,
          row.visitorCompany,
          row.signIn != null ? row.signIn.toLocal().toString() : null,
          row.signOut != null ? row.signOut.toLocal().toString() : null,
          row.timeZone,
          row.guestId,
          row.totalCount);
    }).get();
  }

  Future<List<EventGuest>> getSearchAlls(
      double eventId, String searchText, int offset) {
    final query = select(eventGuestAllEntity)
      ..where((tbl) =>
          tbl.eventId.equals(eventId) &
          (tbl.inviteCode.like('%$searchText%') |
              tbl.visitorEmail.like('%$searchText%') |
              tbl.visitorPhoneNumber.like('%$searchText%') |
              tbl.visitorName.like('%$searchText%')))
      ..limit(Constants.PAGE_MAX_SIZE,
          offset: offset * Constants.PAGE_MAX_SIZE);
    return query.map((row) {
      return EventGuest.local(
          row.eventId,
          row.visitorName,
          row.visitorEmail,
          row.visitorPhoneNumber,
          row.visitorType,
          row.inviteCode,
          row.checkinStatus,
          row.visitorCompany,
          row.signIn != null ? row.signIn.toLocal().toString() : null,
          row.signOut != null ? row.signOut.toLocal().toString() : null,
          row.timeZone,
          row.guestId,
          row.totalCount);
    }).get();
  }

  Future<void> insertAlls(
      List<EventGuestOffline> lstEventGuest, double eventId) async {
    final preference = await SharedPreferences.getInstance();
    final userName = preference.getString(Constants.KEY_EMAIL) ?? "";
    final createdDate = DateTime.now().toUtc();
    // Insert entities
    await batch((batch) {
      batch.insertAll(
          eventGuestAllEntity,
          lstEventGuest.map((item) {
            return EventGuestAllEntityCompanion.insert(
              eventId: eventId,
              guestId: item.guestId,
              visitorName: Value(item.visitorName),
              visitorEmail: Value(item.visitorEmail),
              visitorPhoneNumber: Value(item.visitorPhoneNumber),
              visitorCompany: Value(item.visitorCompany),
              visitorType: Value(item.visitorType),
              inviteCode: Value(item.inviteCode),
              emailLogId: Value(item.emailLogId),
              description: Value(item.description),
              visitorLogId: Value(item.visitorLogId),
              signIn: item.signIn == null || item.signIn.isEmpty
                  ? Value.absent()
                  : Value(DateTime.parse(item.signIn).toUtc()),
              signOut: item.signOut == null || item.signOut.isEmpty
                  ? Value.absent()
                  : Value(DateTime.parse(item.signOut).toUtc()),
              checkinStatus: Value(item.checkinStatus),
              timeZone: Value(item.timezone),
              totalCount: Value(item.totalCount),
              createdBy: Value(userName),
              createdDate: Value(createdDate),
              updatedBy: Value(userName),
              updatedDate: Value(createdDate),
            );
          }).toList());
    });
  }

  Future<void> deleteAllGuestAllsForScanQRByEventId(double eventId) async {
    (delete(eventGuestAllEntity)..where((t) => t.eventId.equals(eventId))).go();
  }

  Future<EventGuestOffline> getGuestForScanQRByInviteCode(String inviteCode) {
    final query = select(eventGuestAllEntity)
      ..where((t) => t.inviteCode.equals(inviteCode));
    return query.map((row) {
      return EventGuestOffline.local(
          row.guestId,
          row.visitorName,
          row.visitorEmail,
          row.visitorPhoneNumber,
          row.inviteCode,
          row.checkinStatus,
          row.visitorType,
          row.visitorCompany,
          row.emailLogId,
          row.description,
          row.visitorLogId,
          row.totalCount,
          row.timeZone,
          row.signIn != null ? row.signIn.toLocal().toString() : null,
          row.signOut != null ? row.signOut.toLocal().toString() : null,
          row.eventId);
    }).getSingle();
  }

  Future<void> checkInForGuestByInviteCode(
      String inviteCode, double branchId, double contactPersonId) async {
    final preference = await SharedPreferences.getInstance();
    final userName = preference.getString(Constants.KEY_EMAIL) ?? "";
    DateTime signIn, signOut;
    // Get guest id
    final query = select(eventGuestAllEntity)
      ..where((t) => t.inviteCode.equals(inviteCode));
    final eventGuestEntry = await query.getSingle();
    if (eventGuestEntry == null) {
      Utilities().printLog(
          'Class EventGuestDAO === Function checkInForGuestByInviteCode === Not found event guest row',
          isOutputFile: Constants.PRINT_LOG_OUTPUT_FILE);
      return;
    }
    // If guest checked-in
    if (eventGuestEntry.signIn == null) {
      signIn = DateTime.now().toUtc();
      // Insert visitor log today and history
      _insertVisitorLogForSignInEventGuest(eventGuestEntry, signIn);
    } else {
      signIn = eventGuestEntry.signIn;
      signOut = DateTime.now().toUtc();
      // Update sign out for visior log today and history
      db.myVisitorLogTodayDAO.updateSignOutByInviteCode(inviteCode, signOut);
      db.myVisitorLogDAO.updateSignOutByInviteCode(inviteCode, signOut);
    }
    // Update model
    update(eventGuestAllEntity)
      ..where((t) => t.guestId.equals(eventGuestEntry.guestId))
      ..write(
        EventGuestAllEntityCompanion(
            signIn: Value(signIn),
            signOut: Value(signOut),
            checkinStatus: Value(1),
            updatedBy: Value(userName),
            updatedDate: Value(DateTime.now().toUtc())),
      );
    final eventGuestSync = EventCheckInSync(
        0,
        eventGuestEntry.guestId,
        signIn == null ? null : signIn.toString(),
        signOut == null ? null : signOut.toString(),
        eventGuestEntry.timeZone,
        eventGuestEntry.eventId,
        eventGuestEntry.inviteCode,
        eventGuestEntry.visitorName,
        eventGuestEntry.visitorType,
        eventGuestEntry.visitorEmail,
        eventGuestEntry.visitorPhoneNumber,
        branchId,
        contactPersonId);
    // Delete before insert new
    _deleteForEventCheckInSyncByInviteCode(inviteCode).then((v) {
      // Insert new in table event check in sync
      _insertForEventCheckInSync(eventGuestSync, false, userName);
    });
  }

  Future<void> _deleteForEventCheckInSyncByInviteCode(String inviteCode) async {
    delete(eventCheckInSyncEntity)
      ..where((t) => t.inviteCode.equals(inviteCode))
      ..go();
  }

  Future<void> _insertForEventCheckInSync(EventCheckInSync eventCheckInSync,
      bool isConnectInternet, String userName) async {
    final date = DateTime.now().toUtc();
    // Insert into table
    into(eventCheckInSyncEntity).insert(EventCheckInSyncEntityCompanion(
      eventId: Value(eventCheckInSync.eventId),
      guestId: Value(eventCheckInSync.id),
      signIn: eventCheckInSync.signIn == null
          ? Value.absent()
          : Value(DateTime.parse(eventCheckInSync.signIn)),
      signOut: eventCheckInSync.signOut == null
          ? Value.absent()
          : Value(DateTime.parse(eventCheckInSync.signOut)),
      timeZone: Value(eventCheckInSync.timezone),
      visitorName: Value(eventCheckInSync.visitorName),
      visitorEmail: Value(eventCheckInSync.visitorEmail),
      visitorPhoneNumber: Value(eventCheckInSync.visitorPhoneNumber),
      visitorType: Value(eventCheckInSync.visitorType),
      branchId: Value(eventCheckInSync.branchId),
      inviteCode: Value(eventCheckInSync.inviteCode),
      isSync: Value(isConnectInternet ? true : false),
      statusSync:
          isConnectInternet ? Value('Sync successfully') : Value.absent(),
      contactPersonId: Value(eventCheckInSync.contactPersonId),
      createdBy: Value(userName),
      createdDate: Value(date),
      updatedBy: Value(userName),
      updatedDate: Value(date),
    ));
  }

  Future<void> updateStatusSyncForEventCheckInSync(
      List<EventCheckInSync> lstEventCheckInSync) async {
    final preference = await SharedPreferences.getInstance();
    final userName = preference.getString(Constants.KEY_EMAIL) ?? "";
    lstEventCheckInSync.forEach((item) {
      update(eventCheckInSyncEntity)
        ..where((t) => t.idSync.equals(item.idSync))
        ..write(
          EventCheckInSyncEntityCompanion(
              isSync: Value(true),
              statusSync: Value('Synced'),
              updatedBy: Value(userName),
              updatedDate: Value(DateTime.now().toUtc())),
        );
    });
  }

  Future<List<EventCheckInSync>> getGuestCheckedNotSync() {
    final query = select(eventCheckInSyncEntity)
      ..where((t) => t.isSync.equals(false));
    return query.map((row) {
      final signIn = row.signIn == null
          ? null
          : DateFormat(Constants.DATE_FORMAT_TO_SQL).format(row.signIn.toUtc());
      final signOut = row.signOut == null
          ? null
          : DateFormat(Constants.DATE_FORMAT_TO_SQL)
              .format(row.signOut.toUtc());
      return EventCheckInSync(
          row.idSync,
          row.guestId,
          signIn,
          signOut,
          row.timeZone,
          row.eventId,
          row.inviteCode,
          row.visitorName,
          row.visitorType,
          row.visitorEmail,
          row.visitorPhoneNumber,
          row.branchId,
          row.contactPersonId);
    }).get();
  }

  Future<void> _insertVisitorLogForSignInEventGuest(
      EventGuestAllEntry eventGuestEntry, DateTime signIn) async {
    // Insert visitor log today and history in local DB
    final queryEventDetail = select(db.eventTodayEntity)
      ..where((t) => t.eventId.equals(eventGuestEntry.eventId));
    final resultEventDetail = await queryEventDetail.getSingle();
    if (resultEventDetail != null) {
      // Insert visitor log today
      final visitorLogToday = ItemVisitor.insertLocal(
          eventGuestEntry.visitorName,
          eventGuestEntry.visitorEmail,
          eventGuestEntry.visitorPhoneNumber,
          0,
          signIn.toString(),
          null,
          null,
          eventGuestEntry.visitorCompany,
          eventGuestEntry.visitorType,
          resultEventDetail.description,
          null,
          null,
          resultEventDetail.branchName,
          resultEventDetail.eventName,
          0,
          resultEventDetail.visitorTypeValue,
          null,
          null,
          eventGuestEntry.inviteCode);
      db.myVisitorLogTodayDAO.insert(visitorLogToday);
      // Insert visitor log
      final visitorLog = VisitorLog.insertLocal(
          0,
          eventGuestEntry.visitorName,
          eventGuestEntry.visitorPhoneNumber,
          eventGuestEntry.visitorEmail,
          signIn.toString(),
          null,
          eventGuestEntry.visitorCompany,
          resultEventDetail.branchId != null
              ? resultEventDetail.branchId.toInt()
              : null,
          resultEventDetail.branchName,
          null,
          null,
          null,
          resultEventDetail.visitorType,
          resultEventDetail.visitorTypeValue,
          eventGuestEntry.inviteCode,
          null);
      db.myVisitorLogDAO.insert(visitorLog);
    }
  }

  Future<void> deleteAllsEventCheckInSync() async {
    delete(eventCheckInSyncEntity).go();
  }

  Future<void> deleteAllsEventGuestAll() async {
    delete(eventGuestAllEntity).go();
  }
}
