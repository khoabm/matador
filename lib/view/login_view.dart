// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:matador/theme/color.dart';
import 'package:matador/widgets/custom_button.dart';
import 'package:matador/widgets/custom_text_field.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginView extends StatefulWidget {
  final Function? callback;
  const LoginView({
    Key? key,
    this.callback,
  }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _isFilled;
  bool _isLoading = false;
  double opacity = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setFilled();
    _emailController.addListener(setFilled);
    _passwordController.addListener(setFilled);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void setFilled() async {
    ((_emailController.text.isEmpty) || (_passwordController.text.isEmpty))
        ? _isFilled = true
        : _isFilled = false;
    setState(() {});
  }

  void _submit() {
    setState(() {
      _isLoading = true;
    });
    FocusManager.instance.primaryFocus?.unfocus();
    //Simulate a service call
    print('submitting to backend...');
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _isLoading = false;
      });

      widget.callback!(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GlowingOverscrollIndicator(
        showTrailing: true,
        axisDirection: AxisDirection.down,
        color: CustomColors.primaryColor,
        child: ModalProgressHUD(
          inAsyncCall: _isLoading,
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
                  key: _signInFormKey,
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
                        inputType: TextInputType.emailAddress,
                        isObscure: false,
                        controller: _emailController,
                        hintText: "Nhập Email",
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
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Material(
                            color: Colors.transparent,
                            shadowColor: Colors.transparent,
                            child: Ink(
                              child: InkWell(
                                splashColor: CustomColors.greyBackgroundCOlor,
                                onTapDown: (TapDownDetails details) {
                                  opacity = 0.5;
                                  setState(() {});
                                  //print("tapped");
                                },
                                onTapUp: (TapUpDetails details) async {
                                  opacity = 1.0;
                                  await Future.delayed(
                                    const Duration(
                                      milliseconds: 200,
                                    ),
                                  );
                                  setState(() {});
                                },
                                child: AnimatedOpacity(
                                  opacity: opacity,
                                  duration: const Duration(milliseconds: 200),
                                  child: const Text(
                                    'Quên mật khẩu?',
                                    style: TextStyle(
                                      color: CustomColors.secondaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      CustomButton(
                        text: 'ĐĂNG NHẬP',
                        onTap: () {
                          if (_signInFormKey.currentState!.validate()) {
                            log('validate complete');
                            _submit();
                          }
                        },
                        buttonColor: CustomColors.primaryColor,
                        isDisable: _isFilled,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: const Divider(
                                color: Colors.black45,
                                height: 36,
                              ),
                            ),
                          ),
                          const Text(
                            "HOẶC",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black45,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: const Divider(
                                color: Colors.black45,
                                height: 36,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButtonWithIcon(
                        text: 'ĐĂNG NHẬP VỚI GOOGLE',
                        onTap: () {},
                        buttonColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
