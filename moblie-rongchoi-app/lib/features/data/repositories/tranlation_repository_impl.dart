import 'package:dartz/dartz.dart';
import 'package:rongchoi_application/core/error/exception.dart';
import 'package:rongchoi_application/features/domain/entities/tranlations_entity.dart';
import 'package:rongchoi_application/features/domain/repositories/tranlation_repository.dart';

class TranlationRepositoryImpl implements TranlationRepository{
  @override
  Future<Either<Failure, List<TranlationsEntity>>> getAllTranlationsLocal() async{
    try{
      final response = await groupMessageTypeLocalDataSource.existGroupMessageTypeLocal(messageId);
      return Right(response);
    } on DatabaseException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<TranlationsEntity>>> getAllTranlationsRemote() {
    // TODO: implement getAllTranlationsRemote
    throw UnimplementedError();
  }

}