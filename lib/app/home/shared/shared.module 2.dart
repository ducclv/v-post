import 'package:flutter_modular/flutter_modular.dart';
import 'package:v_post/app/home/shared/delivery-detail/delivery-detail.view.dart';
import 'package:v_post/app/home/shared/profile/profile.view.dart';

class SharedModule extends Module {
  static String profile = "/profile";
  static String detailDelivery = "/detailDelivery";

  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(detailDelivery, child: (context, args) => DeliveryDetail()),
    ChildRoute(profile, child: (context, args) => ProfileWidget()),
  ];
}
