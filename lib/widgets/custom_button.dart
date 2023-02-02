import 'package:flutter/material.dart';
import 'package:matador/theme/color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? buttonColor;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width * 0.65, 40),
        shape: const StadiumBorder(),
        backgroundColor: buttonColor,
        foregroundColor: CustomColors.primaryColor,
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? buttonColor;
  const CustomButtonWithIcon({
    super.key,
    required this.text,
    required this.onTap,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.access_alarm_sharp, color: Colors.black),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width * 0.65, 40),
        shape: const StadiumBorder(),
        backgroundColor: buttonColor,
        foregroundColor: CustomColors.primaryColor,
      ),
      onPressed: onTap,
      label: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
