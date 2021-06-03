import 'package:flutter/material.dart';
import 'package:v_post/app/home/admin/shipper-list/shipper-list.view.dart';
import 'package:v_post/app/home/shared/profile/profile.view.dart';
import 'package:v_post/app/home/shipper/history/history.view.dart';
import 'package:v_post/app/home/shipper/home.module.dart';
import 'package:v_post/app/home/shipper/shipping-order/shipping-order.view.dart';

class ShipperHomeWidget extends StatefulWidget {
  const ShipperHomeWidget({Key? key}) : super(key: key);

  @override
  _ShipperHomeWidgetState createState() => _ShipperHomeWidgetState();
}

class _ShipperHomeWidgetState extends State<ShipperHomeWidget> {
  List<Map<String, dynamic>> _mainModules = [
    {
      'icon': Icon(Icons.local_shipping_outlined),
      'label': 'Đơn hàng đang giao',
      'widget': ShippingOrderWidget(),
      'route': ShipperHomeModule.shipping
    },
    {'icon': Icon(Icons.view_list_outlined), 'label': 'Lịch sử', 'widget': HistoryWidget(), 'route': ShipperHomeModule.history},
    {'icon': Icon(Icons.person_outlined), 'label': 'Cá nhân', 'widget': ProfileWidget(), 'route': ShipperHomeModule.profile},
  ];

  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainModules[_selectIndex]['widget'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 11),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 10),
          onTap: (index) => setState(() => _selectIndex = index),
          currentIndex: _selectIndex,
          items: _mainModules
              .map((e) => BottomNavigationBarItem(
                    icon: e["icon"] as Icon,
                    label: e["label"] as String,
                  ))
              .toList()),
    );
  }
}
