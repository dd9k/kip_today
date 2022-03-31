import 'package:moor/moor.dart';

@DataClassName('WelcomeMessageEntry')
class WelcomeMessageEntity extends Table {
  String get tableName => 'cip_welcome_message';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get messageContent => text().nullable()();

  TextColumn get type => text().nullable()();

  RealColumn get locationId => real().nullable()();

  RealColumn get companyId => real().nullable()();
}