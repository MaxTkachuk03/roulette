import 'package:flutter/material.dart';
import 'package:roulette/pages/main_page.dart';
import 'package:roulette/pages/registration_pages/registration_page.dart';
import 'package:roulette/pages/screens/splash_screen.dart';

class AppRoutes {
  const AppRoutes._();

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case SplashScreen.routeName:
        builder = (_) => const SplashScreen();
        break;
      case RegistrationPage.routeName:
        builder = (_) => const RegistrationPage();
        break;
      case MainPage.routeName:
        builder = (_) => const MainPage();
        break;
      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
