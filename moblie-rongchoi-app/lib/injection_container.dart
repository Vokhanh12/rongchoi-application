import 'package:get_it/get_it.dart';
import 'package:rongchoi_application/features/data/datasources/db/database_helper.dart';

final locator = GetIt.instance;


Future<void> initLocator() async {

  /// Database
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

}