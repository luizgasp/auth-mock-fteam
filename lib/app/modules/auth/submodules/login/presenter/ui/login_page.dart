import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../core/constants/strings.dart';
import '../../../../../../core/shared/helpers/value_objects/email.dart';
import '../../../../../../core/shared/helpers/value_objects/password.dart';
import '../controllers/login_controller.dart';
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
                    Strings.loginTitle,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    children: [
                      Text(
                        Strings.loginSubtitle,
                        style: TextStyle(color: Theme.of(context).dialogBackgroundColor),
                      ),
                      CustomTextButton(
                        labelText: Strings.signUpButton,
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
                          label: Strings.emailField,
                          iconData: IconlyLight.message,
                          controller: loginController.emailController,
                          validator: Email.hasError,
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomTextFieldAndLabel(
                          label: Strings.passwordField,
                          iconData: IconlyLight.lock,
                          passwordTile: true,
                          controller: loginController.passwordController,
                          validator: Password.hasError,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.1),
                  CustomElevatedButton(
                    textButton: Strings.loginButton,
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
