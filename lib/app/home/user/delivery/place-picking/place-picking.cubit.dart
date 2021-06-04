import 'dart:math' as math;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_post/config/config_screen.dart';
import 'package:v_post/model/user/place-picking/near_by_location.dart';
import 'package:wemapgl/wemapgl.dart';

part 'place-picking.state.dart';

class PlacePickingCubit extends Cubit<PlacePickingState> {
  late WeMapController mapController;
  int searchType = 1; //Type of search bar
  String searchInfoPlace = "Tìm kiếm ở đây"; //Hint text for InfoBar
  LatLng myLatLng = LatLng(21.038282, 105.782885);
  bool reverse = true;
  WeMapPlace? place;
  List<NearByLocation> nearByLocation = [
    NearByLocation(
      address: "177 Trung Kính, Yên Hòa Cầu Giấy, Hà Nội",
      name: "Home City Văn Phú",
    ),
    NearByLocation(
      address: "177 Trung Kính, Yên Hòa Cầu Giấy, Hà Nội",
      name: "Home City Văn Phú",
    ),
  ];

  PlacePickingCubit() : super(PlacePickingInitial()) {}

  void onMapCreate(WeMapController controller) {
    mapController = controller;
  }
}
