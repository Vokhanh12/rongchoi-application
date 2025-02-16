
import 'package:rongchoi_application/core/error/exception.dart';
import 'package:rongchoi_application/features/data/datasources/db/database_helper.dart';
import 'package:rongchoi_application/features/domain/entities/tranlations_entity.dart';

abstract class TranlationLocalDataSource {
  Future<List<TranlationsEntity>> getALlTranlationLocal(String tranlationId);

  
}

class TrnaltionLocalDataSourceImpl implements TranlationLocalDataSource {

  final DatabaseHelper databaseHelper;
  TrnaltionLocalDataSourceImpl(this.databaseHelper);

  @override
  Future<List<TranlationsEntity>> getALlTranlationLocal(String tranlationId) async{
    try{
      return await databaseHelper.getTranlationsAllLocal(tranlationId);
    } catch (e) {
      throw DatabaseException();
    }
  }

}