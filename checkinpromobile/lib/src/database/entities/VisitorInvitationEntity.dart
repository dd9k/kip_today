import 'package:checkinpromobile/src/database/entities/TableCommonEntity.dart';
import 'package:moor/moor.dart';

@DataClassName('VisitorInvitationEntry')
class VisitorInvitationEntity extends TableCommonEntity {
  String get tableName => 'cip_today_visitor_invitation';

  RealColumn get idInvitation => real()();
  TextColumn get visitorName => text().nullable()();
  TextColumn get visitorEmail => text().nullable()();
  TextColumn get visitorPhoneNumber => text().nullable()();
  TextColumn get visitorCompany => text().nullable()();
  TextColumn get visitorAvatarFileName => text().nullable()();
  TextColumn get inviteCode => text().nullable()();
  RealColumn get id => real().nullable()();

  @override
  Set<Column> get primaryKey => {visitorName, visitorEmail, idInvitation};
}
