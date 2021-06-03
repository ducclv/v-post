import 'package:flutter/material.dart';
import 'package:v_post/app/home/admin/home.module.dart';
import 'package:v_post/app/home/admin/manage-order/manage-order.module.dart';
import 'package:v_post/app/home/admin/shipper-list/shipper-list.view.dart';
import 'package:v_post/app/home/shared/profile/profile.view.dart';

class AdminHomeWidget extends StatefulWidget {
  const AdminHomeWidget({Key? key}) : super(key: key);

  @override
  _AdminHomeWidgetState createState() => _AdminHomeWidgetState();
}

class _AdminHomeWidgetState extends State<AdminHomeWidget> {
  List<Map<String, dynamic>> _mainModules = [
    {'icon': Icon(Icons.local_shipping_outlined), 'label': 'Quản lý đơn hàng', 'widget': ManageOrderModule(), 'route': AdminHomeModule.delivery},
    {'icon': Icon(Icons.view_list_outlined), 'label': 'Danh sách tài xế', 'widget': ShipperListWidget(), 'route': AdminHomeModule.history},
    {'icon': Icon(Icons.person_outlined), 'label': 'Cá nhân', 'widget': ProfileWidget(), 'route': AdminHomeModule.profile},
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
