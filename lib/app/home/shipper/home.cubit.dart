import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home.state.dart';

class ShipperHomeCubit extends Cubit<ShipperHomeState> {
  double scrollOffset = 0;

  ShipperHomeCubit() : super(ShipperHomeInitial());
}
