import 'package:flutter/material.dart';
import 'package:mvvm/Utils/routes/routes_name.dart';
import 'package:mvvm/View/home_screen.dart';
import 'package:mvvm/View/login_view.dart';
import 'package:mvvm/View/signup_vew.dart';
import 'package:mvvm/View/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());
            case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignupView());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('No Routes Found')),
          );
        });
    }
  }
}
