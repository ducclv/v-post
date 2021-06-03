import 'package:flutter_modular/flutter_modular.dart';
import 'package:v_post/app/home/shared/profile/profile.view.dart';
import 'package:v_post/app/home/shipper/home.view.dart';
import 'package:v_post/app/home/shipper/shipping-order/shipping-order.view.dart';
import 'package:v_post/app/home/user/history/history.view.dart';

class ShipperHomeModule extends Module {
  static String profile = "/profile";
  static String shipping = "/shipping";
  static String history = "/history";

  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => ShipperHomeWidget()),
    ChildRoute(history, child: (context, args) => HistoryWidget()),
    ChildRoute(shipping, child: (context, args) => ShippingOrderWidget()),
    ChildRoute(profile, child: (context, args) => ProfileWidget()),
  ];
}
