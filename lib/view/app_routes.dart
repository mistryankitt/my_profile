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
        return route(SplashPage());
      case loginPage:
        return route(LoginPage());
      case homePage:
        return route(HomePage());
        case editProfilePage:
        return route(EditPage());
    }
    return null;
  }
}
