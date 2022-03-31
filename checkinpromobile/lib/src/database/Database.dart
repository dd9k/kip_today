import 'package:checkinpromobile/src/database/daos/AttendanceDetailDAO.dart';
import 'package:checkinpromobile/src/database/daos/AttendanceStatisticDAO.dart';
import 'package:checkinpromobile/src/database/daos/CheckInTimeTodayDAO.dart';
import 'package:checkinpromobile/src/database/daos/EventGuestDAO.dart';
import 'package:checkinpromobile/src/database/daos/EventTodayDAO.dart';
import 'package:checkinpromobile/src/database/daos/InvitationExpectedDAO.dart';
import 'package:checkinpromobile/src/database/daos/MyInvitationDAO.dart';
import 'package:checkinpromobile/src/database/daos/MyVisitorLogDAO.dart';
import 'package:checkinpromobile/src/database/daos/MyVisitorLogTodayDAO.dart';
import 'package:checkinpromobile/src/database/daos/VisitorInvitationDAO.dart';
import 'package:checkinpromobile/src/database/daos/VisitorInviteCheckinSyncDAO.dart';
import 'package:checkinpromobile/src/database/daos/WorkingTimeDAO.dart';
import 'package:checkinpromobile/src/database/entities/AttendanceDetailEntity.dart';
import 'package:checkinpromobile/src/database/entities/AttendanceStatisticEntity.dart';
import 'package:checkinpromobile/src/database/entities/CheckInTimeTodayEntity.dart';
import 'package:checkinpromobile/src/database/entities/EventGuestAllEntity.dart';
import 'package:checkinpromobile/src/database/entities/EventTodayEntity.dart';
import 'package:checkinpromobile/src/database/entities/InvitationExpectedEntity.dart';
import 'package:checkinpromobile/src/database/entities/MyInvitationEntity.dart';
import 'package:checkinpromobile/src/database/entities/MyVisitorLogEntity.dart';
import 'package:checkinpromobile/src/database/entities/MyVisitorLogTodayEntity.dart';
import 'package:checkinpromobile/src/database/entities/ReminderInvitationEntity.dart';
import 'package:checkinpromobile/src/database/entities/VisitorInvitationEntity.dart';
import 'package:checkinpromobile/src/database/entities/VisitorInviteCheckinSyncEntity.dart';
import 'package:checkinpromobile/src/database/entities/WorkingTimeEntity.dart';
import 'package:moor/moor.dart';

import 'daos/ImageDownloadedDAO.dart';
import 'daos/ReminderInvitationDAO.dart';
import 'daos/WelcomeMessageDAO.dart';
import 'daos/EventTicketDAO.dart';
import 'daos/ETBookingConfigInforDAO.dart';
import 'daos/ETOrderDetailInfoDAO.dart';
import 'daos/ETOrderInfoDAO.dart';
import 'daos/ETPayMentInfoDAO.dart';
import 'daos/ETGuestInfoDAO.dart';
import 'daos/ETBookingDiscountInfoDAO.dart';
import 'daos/ETTicketInfoDAO.dart';
import 'daos/ETPaymentTypeDAO.dart';

import 'entities/EventCheckInSyncEntity.dart';
import 'entities/ImageDownloadedEntity.dart';
import 'entities/WelcomeMessageEntity.dart';
import 'entities/EventTicketEntity.dart';
import 'entities/ETBookingConfigInforEntity.dart';
import 'entities/ETOrderDetailInfoEntity.dart';
import 'entities/ETOrderInfoEntity.dart';
import 'entities/ETPayMentInfoEntity.dart';
import 'entities/ETGuestInfoEntity.dart';
import 'entities/ETBookingDiscountInfoEntity.dart';
import 'entities/ETTicketInfoEntity.dart';
import 'entities/ETPaymentTypeEntity.dart';

part 'Database.g.dart';

@UseMoor(tables: [
  EventTodayEntity,
  EventCheckInSyncEntity,
  EventGuestAllEntity,
  InvitationExpectedEntity,
  MyVisitorLogTodayEntity,
  CheckInTimeTodayEntity,
  WorkingTimeEntity,
  MyVisitorLogEntity,
  VisitorInvitationEntity,
  MyInvitationEntity,
  VisitorInviteCheckinSyncEntity,
  AttendanceDetailEntity,
  AttendanceStatisticEntity,
  WelcomeMessageEntity,
  ImageDownloadedEntity,
  ReminderInvitationEntity,
  EventTicketEntity,
  ETBookingConfigInforEntity,
  ETOrderDetailInfoEntity,
  ETOrderInfoEntity,
  ETPayMentInfoEntity,
  ETGuestInfoEntity,
  ETBookingDiscountInfoEntity,
  ETTicketInfoEntity,
  ETPaymentTypeEntity
], daos: [
  EventTodayDAO,
  EventGuestDAO,
  InvitationExpectedDAO,
  MyVisitorLogTodayDAO,
  CheckInTimeTodayDAO,
  WorkingTimeDAO,
  MyVisitorLogDAO,
  MyInvitationDAO,
  VisitorInvitationDAO,
  VisitorInviteCheckinSyncDAO,
  AttendanceDetailDAO,
  AttendanceStatisticDAO,
  WelcomeMessageDAO,
  ImageDownloadedDAO,
  ReminderInvitationDAO,
  EventTicketDAO,
  ETBookingConfigInforDAO,
  ETOrderDetailInfoDAO,
  ETOrderInfoDAO,
  ETPayMentInfoDAO,
  ETGuestInfoDAO,
  ETBookingDiscountInfoDAO,
  ETTicketInfoDAO,
  ETPaymentTypeDAO
])
class Database extends _$Database {
  Database(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (Migrator m) {
      return m.createAll();
    }, onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        // Rename table
        m.deleteTable("cip_today_visitor_log");
        m.createTable(myVisitorLogTodayEntity);
        // Create table
        m.createTable(myVisitorLogEntity);
        m.createTable(myInvitationEntity);
        m.createTable(visitorInvitationEntity);
        // Create table
        m.createTable(visitorInviteCheckinSyncEntity);
        // Add one more column
        m.addColumn(invitationExpectedEntity, invitationExpectedEntity.signIn);
        // Create table
        m.createTable(attendanceDetailEntity);
        // Create table
        m.createTable(attendanceStatisticEntity);
      }
      if (from < 3) {
        // 2021-04-20
        m.addColumn(myVisitorLogEntity, myVisitorLogEntity.visitorTypeValue);
      }
      if (from < 4) {
        // 2021-06-09
        m.createTable(welcomeMessageEntity);
        m.addColumn(
            workingTimeEntity, workingTimeEntity.totalNotCheckoutDayInMonth);
        m.addColumn(workingTimeEntity, workingTimeEntity.totalLateDayInMonth);
        m.addColumn(workingTimeEntity, workingTimeEntity.totalNotEnoughInMonth);
        m.addColumn(attendanceDetailEntity, attendanceDetailEntity.isLate);
        m.addColumn(
            attendanceDetailEntity, attendanceDetailEntity.isEnoughWorkingTime);
        m.addColumn(
            attendanceDetailEntity, attendanceDetailEntity.isEnoughWorkingTime);
        m.addColumn(attendanceDetailEntity, attendanceDetailEntity.isLate);
        m.addColumn(myInvitationEntity, myInvitationEntity.endDate);
        m.addColumn(myInvitationEntity, myInvitationEntity.color);
        m.addColumn(myInvitationEntity, myInvitationEntity.status);
        m.addColumn(visitorInvitationEntity,
            visitorInvitationEntity.visitorAvatarFileName);
        m.addColumn(visitorInvitationEntity, visitorInvitationEntity.id);
        m.createTable(imageDownloadedEntity);
        m.createTable(reminderInvitationEntity);
      }
      if (from < 5) {
        m.createTable(eventTicketEntity);
        m.createTable(eTBookingConfigInforEntity);
        m.createTable(eTOrderDetailInfoEntity);
        m.createTable(eTOrderInfoEntity);
        m.createTable(eTPayMentInfoEntity);
        m.createTable(eTGuestInfoEntity);
        m.createTable(eTBookingDiscountInfoEntity);
        m.createTable(eTTicketInfoEntity);
        m.createTable(eTPaymentTypeEntity);
      }
    });
  }

  Future<void> deleteAllDataInDB() async {
    eventGuestDAO.deleteAllsEventGuestAll();
    eventGuestDAO.deleteAllsEventCheckInSync();
    eventTodayDAO.deleteAlls();
    invitationExpectedDAO.deleteAlls();
    myVisitorLogTodayDAO.deleteAlls();
    checkInTimeTodayDAO.deleteAlls();
    myVisitorLogDAO.deleteAlls();
    workingTimeDAO.deleteAlls();
    invitationExpectedDAO.deleteAlls();
    visitorInvitationDAO.deleteAlls();
    visitorInviteCheckinSyncDAO.deleteAlls();
    attendanceDetailDAO.deleteAlls();
    attendanceStatisticDAO.deleteAlls();
    welcomeMessageDAO.deleteAll();
    imageDownloadedDAO.deleteAll();
    reminderInvitationDAO.deleteAll();
    eventTicketDAO.deleteAll();
    eTBookingConfigInforDAO.deleteAll();
    eTOrderDetailInfoDAO.deleteAll();
    eTOrderInfoDAO.deleteAll();
    eTPayMentInfoDAO.deleteAll();
    eTGuestInfoDAO.deleteAll();
    myInvitationDAO.deleteAlls();
    eTBookingDiscountInfoDAO.deleteAll();
    eTTicketInfoDAO.deleteAll();
    eTPaymentTypeDAO.deleteAll();
  }
}
