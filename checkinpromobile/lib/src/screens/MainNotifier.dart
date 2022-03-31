import 'package:checkinpromobile/src/database/Database.dart';
import 'package:checkinpromobile/src/utilities/AppLocalizations.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

abstract class MainNotifier extends ChangeNotifier {
  AppLocalizations appLocalizations;
  Utilities utilities;
  Map<String, dynamic> arguments;
  Database db;
  MyApp parent;
  BuildContext context;
  SharedPreferences preferences;
}
