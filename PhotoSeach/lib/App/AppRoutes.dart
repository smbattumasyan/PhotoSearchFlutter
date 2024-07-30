import 'package:flutter/material.dart';
import '../Screens/CardScreen.dart';
import '../Screens/MainScreen.dart';
import '../utils/AppRoute.dart';

class AppRoutes {
  AppRoutes._();

  static route(
    Widget materialPage, {
    bool isScreenLogged = true,
    String? logScreenName,
    Type routeType = MaterialPageRoute,
  }) {
    switch (routeType) {
      case MaterialPageRoute _:
        Route<Object> route =
            MaterialPageRoute(builder: (context) => materialPage);
        return route;
      case FadeRoute:
        return FadeRoute(materialPage);
      case SlideRoute:
        return SlideRoute(materialPage);
      default:
        Route<Object> route =
            MaterialPageRoute(builder: (context) => materialPage);
        return route;
    }
  }

  static mainScreen() => route(MainScreen());
  static cardScreen() => route(CardScreen());
}
