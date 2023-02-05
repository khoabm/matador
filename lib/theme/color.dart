import 'package:flutter/material.dart';

class CustomColors {
  static const primaryColor = Color.fromRGBO(201, 33, 39, 100);
  static const scaffoldBackgroundColor = Colors.white;
  static const secondaryColor = Color.fromARGB(214, 255, 174, 0);
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static const gradient = LinearGradient(
    colors: [
      Color.fromARGB(214, 255, 174, 0),
      Color.fromRGBO(201, 33, 39, 100),
    ],
    stops: [0.5, 1.0],
  );
  static const disableGradient = LinearGradient(
    colors: [
      Color.fromARGB(213, 255, 255, 255),
      Color.fromRGBO(255, 255, 255, 0.612),
    ],
    stops: [0.5, 1.0],
  );
}
