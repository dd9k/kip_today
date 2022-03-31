import 'package:moor/moor.dart';

abstract class TableCommonEntity extends Table {
  TextColumn get createdBy => text().nullable()();
  DateTimeColumn get createdDate => dateTime().nullable()();
  TextColumn get updatedBy => text().nullable()();
  DateTimeColumn get updatedDate => dateTime().nullable()();
  TextColumn get deletedBy => text().nullable()();
  DateTimeColumn get deletedDate => dateTime().nullable()();
}
