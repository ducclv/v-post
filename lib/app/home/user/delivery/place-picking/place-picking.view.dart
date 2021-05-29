import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:v_post/app/components/appbar/appbar.component.dart';
import 'package:v_post/app/home/user/delivery/place-picking/place-picking.cubit.dart';
import 'package:v_post/config/config_screen.dart';
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
      // appBar: staticAppbar(title: Text('Chọn địa chỉ'),leading: BackButtonWidget()),
      body: Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: Stack(
            children: [
              BlocBuilder<PlacePickingCubit, PlacePickingState>(
                bloc: _cubit,
                builder: (context, state) => _buildMap(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(left: 10,right: 20),
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
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )
                            ],
                          )),
                      Container(
                        height: SizeConfig.safeBlockVertical*20,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Divider(color: Colors.grey,height: 1,),
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
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      )
                                    ],
                                  )),
                              SizedBox(height: 10),
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
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      )
                                    ],
                                  )),
                              SizedBox(height: 10),
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
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      )
                                    ],
                                  )),
                              SizedBox(height: 10),
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
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      )
                                    ],
                                  ))
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

  Widget _buildMap() {
    return Container(
        color: Colors.white,
        child: Stack(
          children: [
            WeMap(
              onMapClick: (point, latlng, _place) async {
                _cubit.place = _place;
              },
              onPlaceCardClose: () {
                // print("Place Card closed");
              },
              reverse: true,
              onMapCreated: _cubit.onMapCreate,
              initialCameraPosition: const CameraPosition(
                target: LatLng(21.036029, 105.782950),
                zoom: 16.0,
              ),
              destinationIcon: "assets/images/icon/destination.png",
            ),

          ],
        ));
  }
}
