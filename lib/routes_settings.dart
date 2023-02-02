import 'package:flutter/material.dart';
import 'package:matador/utils/page_transition.dart';
import 'package:matador/view/auth_view.dart';
import 'constant/routes_constraints.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RoutesHandler.LOGIN:
      return (SlideRightRoute(
        page: const AuthScreen(),
      ));
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Screen not exist"),
          ),
        ),
      );
  }
}
