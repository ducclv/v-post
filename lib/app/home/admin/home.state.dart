part of 'home.cubit.dart';

@immutable
abstract class AdminHomeState extends Equatable {
  const AdminHomeState();
}

class AdminHomeInitial extends AdminHomeState {
  const AdminHomeInitial();

  @override
  List<Object> get props => [];
}

class AdminHomeLoading extends AdminHomeState {
  const AdminHomeLoading();

  @override
  List<Object> get props => [];
}

class AdminHomeError extends AdminHomeState {
  final String message;

  const AdminHomeError(this.message);

  @override
  List<Object> get props => [message];
}
class OffsetChanged extends AdminHomeState {
  final double offset;

  OffsetChanged(this.offset);

  @override
  List<Object> get props => [offset];
}
