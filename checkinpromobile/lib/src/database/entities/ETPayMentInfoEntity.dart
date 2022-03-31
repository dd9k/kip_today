import 'package:moor/moor.dart';
import 'TableCommonEntity.dart';

@DataClassName("ETPayMentInfoAllEntry")
class ETPayMentInfoEntity extends TableCommonEntity {
  String get tableName => 'cip_today_et_payment';

  RealColumn get id => real().nullable()();
  RealColumn get eventId => real().nullable()();
  TextColumn get paymentType => text().nullable()();
  TextColumn get accountName => text().nullable()();
  TextColumn get accountNo => text().nullable()();
  TextColumn get bankName => text().nullable()();
  TextColumn get bankBranchName => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
