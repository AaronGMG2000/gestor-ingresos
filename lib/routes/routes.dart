import 'package:gestor_ingresos/pages/index.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const initialRoute = SplashPage.routeName;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.routeName:
        return getRoute(settings, const LoginPage());
      case HomePage.routeName:
        return getRoute(settings, const HomePage());
      case SignupPage.routeName:
        return getRoute(settings, const SignupPage());
      case NavigationPage.routeName:
        return getRoute(settings, const NavigationPage());
      case SplashPage.routeName:
        return getRoute(settings, const SplashPage());
      case ConfigurationPage.routeName:
        return getRoute(settings, const ConfigurationPage());
      default:
        return getRoute(settings, const SplashPage());
    }
  }

  static getRoute(RouteSettings settings, Widget page) => GetPageRoute(
        page: () => page,
        routeName: settings.name,
        settings: settings,
        transitionDuration: const Duration(milliseconds: 500),
      );
}
