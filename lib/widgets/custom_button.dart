import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width * 0.65, 40),
        shape: const StadiumBorder(),
        backgroundColor: Colors.blue,
      ),
      onPressed: onTap,
      child: Text(
        text,
      ),
    );
  }
}
