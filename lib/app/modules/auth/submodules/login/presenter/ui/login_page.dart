import 'package:auth_mock_3/app/modules/auth/submodules/login/presenter/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconly/iconly.dart';

import 'widgets/custom_container.dart';
import 'widgets/custom_elevated_button.dart';
import 'widgets/custom_text_button.dart';
import 'widgets/custom_textfield_and_label.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.15, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.04),
                  Text(
                    "👋 Hey, \nIt's nice to see you again!",
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
                        labelText: 'Sign Up',
                        onPressed: () => Modular.to.navigate('/auth/sign/'),
                      )
                    ],
                  ),
                ],
              ),
            ),
            CustomContainer(
              paddingTop: size.height * 0.45,
              height: size.height * 0.55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: loginController.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFieldAndLabel(
                          label: 'E-mail',
                          iconData: IconlyLight.message,
                          controller: loginController.emailController,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Please, fill this field';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomTextFieldAndLabel(
                          label: 'Password',
                          iconData: IconlyLight.lock,
                          passwordTile: true,
                          controller: loginController.passwordController,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Please, fill this field';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.1),
                  CustomElevatedButton(
                    textButton: 'Login',
                    onPressed: () {
                      if (loginController.formKey.currentState!.validate()) {
                        loginController.handleLoginWithEmail();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
