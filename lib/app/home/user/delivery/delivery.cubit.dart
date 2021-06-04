import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wemapgl/wemapgl.dart';

part 'delivery.state.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  WeMapPlace? placeSender;
  WeMapPlace? placeReceiver;
  DeliveryCubit() : super(DeliveryInitial()) {}

}
