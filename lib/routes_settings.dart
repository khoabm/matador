import 'package:flutter/material.dart';
import 'package:matador/utils/page_transition.dart';
import 'package:matador/view/auth_view.dart';
import 'package:matador/view/authenticated_view.dart';
import 'package:matador/widgets/bottom_bar.dart';
import 'constant/routes_constraints.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RoutesHandler.LOGIN:
      return (SlideBottomRoute(
        page: const AuthScreen(),
      ));
    case RoutesHandler.BOTTOM_BAR:
      return (SlideBottomRoute(
        page: const BottomBar(),
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
