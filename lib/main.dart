import 'package:flutter/material.dart';
import 'package:matador/constant/routes_constraints.dart';
import 'package:matador/routes_settings.dart';
import 'package:matador/theme/color.dart';
import 'package:matador/widgets/bottom_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColor,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        
        colorScheme: const ColorScheme.light(
          primary: CustomColors.primaryColor,
        ),
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoutes(settings),
      home: const Scaffold(
        body: BottomBar(),
        // body: Center(
        //   child: Builder(
        //     builder: (context) {
        //       return ElevatedButton(
        //         onPressed: () {
        //           Navigator.pushNamedAndRemoveUntil(
        //             context,
        //             RoutesHandler.BOTTOM_BAR,
        //             (route) => true,
        //           );
        //         },
        //         child: const Text('Click!'),
        //       );
        //     },
        //   ),
        // ),
      ),
    );
  }
}
