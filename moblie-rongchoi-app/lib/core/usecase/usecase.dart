import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rongchoi_application/core/error/failure.dart';

abstract class UseCase<T, P>{
  /// Future<T> call(P param);
  Future<Either<Failure, T>> call(P params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
