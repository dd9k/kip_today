import 'package:checkinpromobile/src/constants/AppDestination.dart';
import 'package:checkinpromobile/src/constants/Constants.dart';
import 'package:checkinpromobile/src/constants/SizeConfig.dart';
import 'package:checkinpromobile/src/utilities/Utilities.dart';
import 'package:get_it/get_it.dart';
import 'SyncService.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AppDestination());
  locator.registerLazySingleton(() => Utilities());
  locator.registerLazySingleton(() => Constants());
  locator.registerLazySingleton(() => SizeConfig());
  locator.registerLazySingleton(() => SyncService());
}
