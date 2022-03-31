import 'dart:io';

import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:path/path.dart' as p;

// For mobile
Database constructDb({bool logStatements = false}) {
  if (Platform.isIOS || Platform.isAndroid) {
    final executor = LazyDatabase(() async {
      var path = await Utilities().localPathDB("DB");
      final dbFile = File(p.join(path, 'cip_today_db.sqlite'));
      return VmDatabase(dbFile, logStatements: logStatements);
    });
    return Database(executor);
  }
  return Database(VmDatabase.memory(logStatements: logStatements));
}
