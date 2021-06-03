import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home.state.dart';

class AdminHomeCubit extends Cubit<AdminHomeState> {
  double scrollOffset = 0;

  AdminHomeCubit() : super(AdminHomeInitial()) {}
}
