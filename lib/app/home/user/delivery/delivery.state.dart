part of 'delivery.cubit.dart';

@immutable
abstract class DeliveryState extends Equatable {
  const DeliveryState();
}

class DeliveryInitial extends DeliveryState {
  const DeliveryInitial();

  @override
  List<Object> get props => [];
}
