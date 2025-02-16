part of 'tranlation_bloc.dart';

@immutable
abstract class TranlationEvent extends Equatable {
  const TranlationEvent();

  @override
  List<Object?> get props => [];
}

class GetAllTranlationsLocalEvent extends TranlationEvent {
  final String tranlationId;
  const GetAllTranlationsLocalEvent(this.tranlationId);

  @override
  List<Object> get props => [tranlationId];
}
