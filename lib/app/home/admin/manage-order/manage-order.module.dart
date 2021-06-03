import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:v_post/app/home/admin/manage-order/manage-order.view.dart';

class ManageOrderModule extends WidgetModule {
  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => ManageOrderWidget()),
  ];

  @override
  final List<Bind> binds = [];

  final Widget view = ManageOrderWidget();
}
