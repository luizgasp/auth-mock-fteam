import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../core/constants/strings.dart';
import '../../../signup/presenter/ui/widgets/custom_panel_text_with_button.dart';
import '../controllers/login_controller.dart';
import 'widgets/custom_container.dart';
import 'widgets/custom_elevated_button.dart';
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
            CustomPainelTextWithButton(
              title: Strings.loginTitle,
              subtitle: Strings.loginSubtitle,
              buttonLabel: Strings.signUpButton,
              onPressed: loginController.navigatoToSignUp,
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
                          onChanged: (value) => loginController.email = value,
                          validator: (value) => loginController.emailInstace.hasError(),
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomTextFieldAndLabel(
                          label: Strings.passwordField,
                          iconData: IconlyLight.lock,
                          passwordTile: true,
                          onChanged: (value) => loginController.password = value,
                          validator: (value) => loginController.passwordInstace.hasError(),
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
