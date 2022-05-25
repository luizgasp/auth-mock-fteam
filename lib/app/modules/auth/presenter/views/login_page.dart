import 'package:auth_mock_3/app/modules/auth/presenter/widgets/custom_elevated_button.dart';
import 'package:auth_mock_3/app/modules/auth/presenter/widgets/custom_rounded_container.dart';
import 'package:auth_mock_3/app/modules/auth/presenter/widgets/custom_text_button.dart';
import 'package:auth_mock_3/app/modules/auth/presenter/widgets/custom_textfield_and_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconly/iconly.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.31,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.08),
                    Text(
                      "🎉 Hey, \nIt's nice to see you again!",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      children: [
                        Text(
                          "if you don't have an account /",
                          style: TextStyle(color: Theme.of(context).dialogBackgroundColor),
                        ),
                        CustomTextButton(
                          labelText: 'Sign up',
                          onPressed: () => Modular.to.navigate('./sign'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CustomRoundedContainer(
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.025),
                  CustomTextFieldAndLabel(
                    label: 'E-mail',
                    iconData: IconlyLight.message,
                    controller: _emailController,
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.025),
                  CustomTextFieldAndLabel(
                    label: 'Password',
                    iconData: IconlyLight.lock,
                    controller: _passwordController,
                    validator: (value) {
                      return null;
                    },
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                    textButton: 'Login',
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
