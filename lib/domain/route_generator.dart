import 'package:discord_replicate/presentation/view/app_view.dart';
import 'package:flutter/material.dart';

export 'package:discord_replicate/presentation/route_transition/app_transition.dart' show CustomSlideTransition;

class Routes {
  static const String WelcomeRoute = '/';
  static const String RegisterRoute = '/login';
  static const String LoginRoute = '/register';
}

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.WelcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeView());
      case Routes.RegisterRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.LoginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      default:
        return MaterialPageRoute(builder: (_) => const WelcomeView());
    }
  }
}
