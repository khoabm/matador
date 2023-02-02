import 'package:flutter/material.dart';
import 'package:matador/theme/color.dart';
import 'package:matador/widgets/custom_button.dart';
import 'package:matador/widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Form(
        key: _signInFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Email',
              style: TextStyle(),
            ),
            CustomTextField(
              isObscure: false,
              controller: _emailController,
              hintText: "Nhập Email",
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Mật khẩu'),
            CustomTextField(
              isObscure: true,
              controller: _passwordController,
              hintText: "Nhập Mật khẩu",
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Quên mật khẩu?',
                    style: TextStyle(
                      color: CustomColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(text: 'ĐĂNG NHẬP', onTap: () {}),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
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
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: const Divider(
                      color: Colors.black45,
                      height: 36,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(text: 'ĐĂNG NHẬP', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
