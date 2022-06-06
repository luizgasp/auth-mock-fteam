import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../core/constants/strings.dart';
import '../../../signup/presenter/ui/widgets/custom_panel_text_with_button.dart';
import '../controllers/login_controller.dart';
import 'widgets/login_widgets.dart';

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
              padding: EdgeInsets.only(top: size.height * 0.1),
              child: CustomPainelTextWithButton(
                title: Strings.loginTitle,
                subtitle: Strings.loginSubtitle,
                buttonLabel: Strings.signUpButton,
                onPressed: loginController.navigatoToSignUp,
              ),
            ),
            CustomContainer(
              paddingTop: size.height * 0.4,
              height: size.height * 0.6,
              child: Column(
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
                          validator: (_) => loginController.emailInstace.hasError(),
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomTextFieldAndLabel(
                          label: Strings.passwordField,
                          iconData: IconlyLight.lock,
                          passwordTile: true,
                          onChanged: (value) => loginController.password = value,
                          validator: (_) => loginController.passwordInstace.hasError(),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: size.height * 0.1),
                  const Spacer(),
                  CustomElevatedButton(
                    textButton: Strings.loginButton,
                    onPressed: () {
                      if (loginController.formKey.currentState!.validate()) {
                        loginController.handleLoginWithEmail();
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
