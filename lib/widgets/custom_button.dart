import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matador/theme/color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? buttonColor;
  final bool isDisable;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.buttonColor,
    this.isDisable = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          MediaQuery.of(context).size.width * 0.65,
          MediaQuery.of(context).size.height * 0.06,
        ),
        shape: const StadiumBorder(),
        backgroundColor: buttonColor,
        foregroundColor: CustomColors.primaryColor,
        shadowColor: Colors.transparent,
        disabledBackgroundColor: CustomColors.greyBackgroundCOlor,
        disabledForegroundColor: CustomColors.greyBackgroundCOlor,
      ),
      onPressed: isDisable == true ? null : onTap,
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
      icon: const FaIcon(FontAwesomeIcons.google),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          MediaQuery.of(context).size.width * 0.65,
          MediaQuery.of(context).size.height * 0.06,
        ),
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
