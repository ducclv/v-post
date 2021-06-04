import 'package:flutter_modular/flutter_modular.dart';
import 'package:v_post/app/home/shared/shared.module.dart';
import 'package:v_post/app/home/switching.view.dart';
import 'package:v_post/app/home/user/home.module.dart';
import 'package:v_post/app/login/login.view.dart';
import 'package:v_post/app/signup/signup.view.dart';
import 'package:v_post/app/splash-screen/splash-screen.view.dart';

class AppModule extends Module {
  static String user = "/user";
  static String admin = "/admin";
  static String shipper = "/shipper";
  static String shared = "/shared";
  static String switching = "/switching";
  static String login = "/login";
  static String signup = "/signup";
  static String splashScreen = "/";

  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(user, module: UserHomeModule(), transition: TransitionType.rightToLeftWithFade),
    ModuleRoute(shared, module: SharedModule(), transition: TransitionType.rightToLeftWithFade),
    ChildRoute(splashScreen, child: (context, args) => SplashScreen()),
    ChildRoute(login, child: (context, args) => Login(), transition: TransitionType.downToUp),
    ChildRoute(signup, child: (context, args) => SignUp(), transition: TransitionType.rightToLeftWithFade),
    ChildRoute(switching, child: (context, args) => SwitchingWidget(), transition: TransitionType.rightToLeftWithFade),
  ];
}
