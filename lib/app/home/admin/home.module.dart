import 'package:flutter_modular/flutter_modular.dart';
import 'package:v_post/app/home/admin/home.cubit.dart';
import 'package:v_post/app/home/admin/home.view.dart';
import 'package:v_post/app/home/shared/profile/profile.view.dart';
import 'package:v_post/app/home/user/delivery/delivery.module.dart';
import 'package:v_post/app/home/user/history/history.view.dart';

class AdminHomeModule extends Module {
  static String profile = "/profile";
  static String delivery = "/delivery";
  static String history = "/history";

  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => AdminHomeCubit())];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(delivery, module: DeliveryModule()),
    ChildRoute('/', child: (context, args) => AdminHomeWidget()),
    ChildRoute(history, child: (context, args) => HistoryWidget()),
    ChildRoute(profile, child: (context, args) => ProfileWidget()),
  ];
}
