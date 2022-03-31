import 'package:checkinpromobile/src/database/entities/TableCommonEntity.dart';
import 'package:moor/moor.dart';

@DataClassName('MyInvitationEntry')
class MyInvitationEntity extends TableCommonEntity {
  String get tableName => 'cip_today_my_invitation';

  RealColumn get id => real()();
  TextColumn get invitationName => text().nullable()();
  RealColumn get branchId => real().nullable()();
  TextColumn get branchName => text().nullable()();
  TextColumn get branchAddress => text().nullable()();
  TextColumn get visitorType => text().nullable()();
  TextColumn get visitorTypeValue => text().nullable()();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()();
  TextColumn get color => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get status => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
