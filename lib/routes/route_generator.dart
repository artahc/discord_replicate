import 'package:discord_replicate/view/home/landing_view.dart';
import 'package:discord_replicate/view/splash_screen/splash_screen_view.dart';
import 'package:discord_replicate/view/welcome/login_view.dart';
import 'package:discord_replicate/view/welcome/register_view.dart';
import 'package:discord_replicate/view/welcome/welcome_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String initial = '/';
  static const String welcome = 'welcome';
  static const String register = 'login';
  static const String login = 'register';
  static const String landing = 'landing';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const SplashScreenView());
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeView());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.landing:
        return MaterialPageRoute(builder: (_) => const LandingView());
      default:
        return MaterialPageRoute(builder: (_) => const WelcomeView());
    }
  }
}
