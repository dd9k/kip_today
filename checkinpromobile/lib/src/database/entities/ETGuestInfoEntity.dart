import 'package:moor/moor.dart';
import 'TableCommonEntity.dart';

@DataClassName("ETGuestInfoAllEntry")
class ETGuestInfoEntity extends TableCommonEntity {
  String get tableName => 'cip_today_et_guest';

  RealColumn get id => real().nullable()();
  RealColumn get idGuest => real()();
  TextColumn get fullName => text().nullable()();
  TextColumn get emailAddress => text().nullable()();
  TextColumn get phoneNumber => text().nullable()();
  TextColumn get idCard => text().nullable()();
  TextColumn get company => text().nullable()();
  TextColumn get position => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
