import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../../core/constants/strings.dart';
import '../../../../login/presenter/ui/widgets/custom_container.dart';
import '../../../../login/presenter/ui/widgets/custom_elevated_button.dart';
import '../../../../login/presenter/ui/widgets/custom_textfield_and_label.dart';
import '../../controllers/signup_controller.dart';
import '../widgets/custom_panel_text_with_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final signUpController = Modular.get<SignUpController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CustomPainelTextWithButton(
              title: Strings.signUpTitle,
              subtitle: Strings.signUpSubtitle,
              buttonLabel: Strings.loginButton,
              onPressed: signUpController.navigateToLogin,
            ),
            CustomContainer(
              child: Stack(
                children: [
                  Form(
                    key: signUpController.formKey,
                    child: Column(
                      children: [
                        CustomTextFieldAndLabel(
                          label: Strings.nameField,
                          iconData: IconlyLight.profile,
                          onChanged: (value) => signUpController.name = value,
                          validator: (_) => signUpController.nameInstance.hasError(),
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomTextFieldAndLabel(
                          label: Strings.emailField,
                          iconData: IconlyLight.message,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) => signUpController.email = value,
                          validator: (_) => signUpController.emailInstace.hasError(),
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomTextFieldAndLabel(
                          label: Strings.passwordField,
                          iconData: IconlyLight.lock,
                          passwordTile: true,
                          onChanged: (value) => signUpController.password = value,
                          validator: (_) => signUpController.passwordInstace.hasError(),
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomTextFieldAndLabel(
                          label: Strings.confirmPasswordField,
                          iconData: IconlyLight.lock,
                          passwordTile: true,
                          onChanged: (value) => signUpController.confirmPassword = value,
                          validator: (_) => signUpController.confirmPasswordInstace.hasError(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.6),
                    child: CustomElevatedButton(
                      textButton: Strings.signUpButton,
                      onPressed: signUpController.pushToProfile,
                    ),
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
