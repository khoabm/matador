import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  final int maxLines;
  final TextInputType inputType;
  final Icon? prefixIcons;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isObscure,
    this.inputType = TextInputType.text,
    this.maxLines = 1,
    this.prefixIcons,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      maxLines: maxLines,
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        prefixIcon: prefixIcons,
        contentPadding: const EdgeInsets.only(
          left: 10.0,
          top: 15.0,
          bottom: 15.0,
        ),
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black45,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black45,
          ),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
    );
  }
}
