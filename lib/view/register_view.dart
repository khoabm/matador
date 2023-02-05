import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:matador/theme/color.dart';
import 'package:matador/widgets/custom_button.dart';
import 'package:matador/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _signUpFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _isFilled;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setFilled();
    _emailController.addListener(setFilled);
    _passwordController.addListener(setFilled);
  }

  void setFilled() async {
    ((_emailController.text.isEmpty) || (_passwordController.text.isEmpty))
        ? _isFilled = true
        : _isFilled = false;
    Future.delayed(
      const Duration(seconds: 2),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GlowingOverscrollIndicator(
        showTrailing: true,
        axisDirection: AxisDirection.down,
        color: CustomColors.primaryColor,
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              color: Colors.white,
              child: Form(
                key: _signUpFormKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 3.0,
                          ),
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      isObscure: false,
                      controller: _emailController,
                      hintText: "Nhập Email",
                      inputType: TextInputType.emailAddress,
                      prefixIcons: const Icon(Icons.email),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 3.0,
                          ),
                          child: Text(
                            'Mật khẩu',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      isObscure: true,
                      controller: _passwordController,
                      hintText: "Nhập Mật khẩu",
                      prefixIcons: const Icon(Icons.key),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    CustomButton(
                      text: 'ĐĂNG KÝ',
                      onTap: () {
                        if (_signUpFormKey.currentState!.validate()) {
                          log('validate complete');
                        }
                      },
                      buttonColor: CustomColors.primaryColor,
                      isDisable: _isFilled,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
