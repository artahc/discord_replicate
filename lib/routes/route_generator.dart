
import 'package:discord_replicate/view/home/channel_view.dart';
import 'package:discord_replicate/view/splash_screen/splash_screen_view.dart';
import 'package:discord_replicate/view/welcome/login_view.dart';
import 'package:discord_replicate/view/welcome/register_view.dart';
import 'package:discord_replicate/view/welcome/welcome_view.dart';
import 'package:flutter/material.dart';

export 'package:discord_replicate/route_transition/app_transition.dart' show CustomSlideTransition;

class Routes {
  static const String InitialRoute = '/';
  static const String WelcomeRoute = '/welcome';
  static const String RegisterRoute = '/login';
  static const String LoginRoute = '/register';
  static const String LandingRoute = '/landing';
}

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.InitialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreenView());
      case Routes.WelcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeView());
      case Routes.RegisterRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.LoginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.LandingRoute:
        return MaterialPageRoute(builder: (_) => const ChannelView());
      default:
        return MaterialPageRoute(builder: (_) => const WelcomeView());
    }
  }
}
