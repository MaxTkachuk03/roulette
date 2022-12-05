import 'package:flutter/material.dart';
import 'package:roulette/pages/main_page.dart';
import 'package:roulette/pages/registration_pages/set_name_page.dart';
import 'package:roulette/pages/registration_pages/registration_page.dart';
import 'package:roulette/pages/roulette_pages/game_page.dart';
import 'package:roulette/pages/roulette_pages/rating_page.dart';
import 'package:roulette/pages/roulette_pages/settings_page.dart';
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
      case GamePage.routeName:
        builder = (_) => const GamePage();
        break;
      case RatingPage.routeName:
        builder = (_) => const RatingPage();
        break;
      case SettingsPage.routeName:
        builder = (_) => const SettingsPage();
        break;
      case SetNamePage.routeName:
        builder = (_) => const SetNamePage();
        break;
      case AuthWrapper.routeName:
        builder = (_) => const AuthWrapper();
        break;
      default:
        throw Exception(
          'Invalid route: ${settings.name}',
        );
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
