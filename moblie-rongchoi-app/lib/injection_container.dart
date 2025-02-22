import 'package:get_it/get_it.dart';
import 'package:rongchoi_application/features/data/datasources/db/database_helper.dart';
import 'package:rongchoi_application/features/data/repositories/tranlation_repository_impl.dart';
import 'package:rongchoi_application/features/domain/repositories/tranlation_repository.dart';

final locator = GetIt.instance;


Future<void> initLocator() async {

  /// Database
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());


  /// Reopsitory ////////////////////////////////////////////////////////////////////////////////////////////////
  /// Tranlations
  locator.registerLazySingleton<TranlationRepository>(() => TranlationRepositoryImpl(
      tranlationLocalDataSource: locator(),
    ),
  );


}