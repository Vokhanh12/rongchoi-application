import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rongchoi_application/core/error/exception.dart';
import 'package:rongchoi_application/core/usecase/usecase.dart';
import 'package:rongchoi_application/features/domain/entities/tranlations_entity.dart';
import 'package:rongchoi_application/features/domain/repositories/tranlation_repository.dart';

class GetAllTranlationsLocalUsecase implements UseCase<List<TranlationsEntity>, ParamsGetAllTranlationsLocalUsecase> {
  final TranlationRepository tranlationRepository;

  GetAllTranlationsLocalUsecase({required this.tranlationRepository});
  
  @override
  Future<Either<Failure, List<TranlationsEntity>>> call(ParamsGetAllTranlationsLocalUsecase params) {
    return tranlationRepository.getAllTranlationsLocal();
  }

}


class ParamsGetAllTranlationsLocalUsecase extends Equatable{
  final String tranlationId;

  const ParamsGetAllTranlationsLocalUsecase({required this.tranlationId});

  @override
  List<Object> get props => [tranlationId];

  @override
  String toString() {
    return 'ParamsGetAllTranlationsLocalUsecase Params{tranlationId: $tranlationId}';
  }

}