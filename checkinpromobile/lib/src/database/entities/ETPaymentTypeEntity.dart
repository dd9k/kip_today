import 'package:moor/moor.dart';
import 'TableCommonEntity.dart';

@DataClassName("ETPaymentTypeAllEntry")
class ETPaymentTypeEntity extends TableCommonEntity {
  String get tableName => 'cip_today_et_payment_type';

  RealColumn get eventId => real().nullable()();
  TextColumn get settingCode => text().nullable()();
  TextColumn get settingValue => text().nullable()();

  @override
  Set<Column> get primaryKey => {eventId, settingCode};
}
