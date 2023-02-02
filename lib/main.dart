import 'package:flutter/material.dart';
import 'package:matador/constant/routes_constraints.dart';
import 'package:matador/routes_settings.dart';
import 'package:matador/theme/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matador',
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColor,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        colorScheme: const ColorScheme.light(
          primary: CustomColors.primaryColor,
        ),
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => generateRoutes(settings),
      home: Scaffold(
        body: Center(
          child: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesHandler.LOGIN,
                  (route) => false,
                );
              },
              child: const Text('Click!'),
            );
          }),
        ),
      ),
    );
  }
}
