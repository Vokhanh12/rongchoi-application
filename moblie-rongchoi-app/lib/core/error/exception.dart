import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties = const <dynamic>[];

  const Failure([properties]);

  @override
  List<dynamic> get props => properties;
}

class ServerFailure extends Failure {}

//date
class ServerException implements Exception {}

class CacheException implements Exception {}

//route
class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}