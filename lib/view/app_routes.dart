import 'package:flutter/material.dart';
import 'package:my_profile/view/edit/view.dart';
import 'package:my_profile/view/home/view.dart';
import 'package:my_profile/view/login/view.dart';
import 'package:my_profile/view/splash/view.dart';

class AppRoutes {
  static const String splashPage = "/";
  static const String loginPage = "loginPage";
  static const String editProfilePage = "editProfilePage";
  static const String homePage = "homePage";

  static route(route) => MaterialPageRoute(builder: (_) => route);

  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashPage:
        return route(const SplashPage());
      case loginPage:
        return route(const LoginPage());
      case homePage:
        return route(const HomePage());
        case editProfilePage:
        return route(const EditPage());
    }
    return null;
  }
}
