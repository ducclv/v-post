import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v_post/app/components/appbar/appbar.component.dart';
import 'package:v_post/app/home/user/delivery/place-picking/place-picking.cubit.dart';
import 'package:v_post/config/config_screen.dart';
import 'package:v_post/themes/style.dart';
import 'package:wemapgl/wemapgl.dart';

class PlacePicking extends StatefulWidget {
  const PlacePicking({Key? key}) : super(key: key);

  @override
  _PlacePickingState createState() => _PlacePickingState();
}

class _PlacePickingState extends State<PlacePicking> {
  PlacePickingCubit _cubit = PlacePickingCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: staticAppbar(
        centerTitle: true,
        title: Text(
          'Chọn địa chỉ',
          style: TextStyle(color: AppColor.accentColor),
        ),
        leading: BackButtonWidget(),
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            child: IconButton(
              icon: Icon(Icons.check, color: AppColor.accentColor,),
              onPressed: () {
                Navigator.pop(context,_cubit.place);
              },
            ),
          ),
        ],
      ),
      body: Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: Stack(
            children: [
              _buildMap(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 20),
                  height: SizeConfig.blockSizeVertical * 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      WeMapSearchBar(
                        location: _cubit.myLatLng,
                        onSelected: (_place) {
                          setState(() {
                            _cubit.place = _place;
                          });
                          _cubit.mapController.moveCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(target: _cubit.place?.location, zoom: 14.0),
                            ),
                          );
                          _cubit.mapController.addSymbol(SymbolOptions(
                            geometry: _place.location,
                            iconImage: "asset/images/icon/destination.png",
                            iconSize: 50,
                          ));
                          _cubit.mapController.showPlaceCard?.call(_cubit.place);
                        },
                        onClearInput: () {
                          setState(() {
                            _cubit.place = null;
                            _cubit.mapController.showPlaceCard?.call(_cubit.place);
                          });
                        },
                      ),
                      SizedBox(height: 5),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.my_location),
                              SizedBox(
                                width: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              Text(
                                'Vị trí của tôi',
                                style: TextStyle(color: Colors.black, fontSize: 18),
                              )
                            ],
                          )),
                      Container(
                        height: SizeConfig.safeBlockVertical * 20,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Divider(
                                color: Colors.grey,
                                height: 1,
                              ),
                              ...List.generate(_cubit.nearByLocation.length, (index) => _buildNearLocation(index))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget _buildNearLocation(int index) {
    return TextButton(
      onPressed: () {},
      child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 40,
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _cubit.nearByLocation.elementAt(index).name ?? "",
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical / 2,
                  ),
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 70,
                    child: Text(
                      _cubit.nearByLocation.elementAt(index).address ?? "",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }

  Widget _buildMap() {
    return Container(
        color: Colors.white,
        child: Stack(
          children: [
            WeMap(
              compassEnabled: true,
              reverse: true,
              compassViewMargins: Point(24, 550),
              onMapCreated: _cubit.onMapCreate,
              initialCameraPosition: const CameraPosition(
                target: LatLng(21.036029, 105.782950),
                zoom: 16.0,
              ),
              myLocationEnabled: true,
            ),
          ],
        ));
  }
}
