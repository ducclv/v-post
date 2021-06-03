import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:v_post/app/home/user/delivery/delivery-confirmation/delivery-confirmation.view.dart';
import 'package:v_post/app/home/user/delivery/delivery.view.dart';
import 'package:v_post/app/home/user/delivery/place-picking/place-picking.view.dart';

class DeliveryModule extends WidgetModule {
  static String deliveryConfirmation = "/deliveryConfirmation";
  static String placePicking = "/placePicking";

  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => DeliveryWidget()),
    ChildRoute(deliveryConfirmation, child: (context, args) => DeliveryConfirmationWidget()),
    ChildRoute(placePicking, child: (context, args) => PlacePicking()),
  ];

  final Widget view = DeliveryWidget();
}
