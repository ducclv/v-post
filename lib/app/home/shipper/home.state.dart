part of 'home.cubit.dart';

@immutable
abstract class ShipperHomeState extends Equatable {
  const ShipperHomeState();
}

class ShipperHomeInitial extends ShipperHomeState {
  const ShipperHomeInitial();

  @override
  List<Object> get props => [];
}

class ShipperHomeLoading extends ShipperHomeState {
  const ShipperHomeLoading();

  @override
  List<Object> get props => [];
}

class ShipperHomeError extends ShipperHomeState {
  final String message;

  const ShipperHomeError(this.message);

  @override
  List<Object> get props => [message];
}
class OffsetChanged extends ShipperHomeState {
  final double offset;

  OffsetChanged(this.offset);

  @override
  List<Object> get props => [offset];
}
