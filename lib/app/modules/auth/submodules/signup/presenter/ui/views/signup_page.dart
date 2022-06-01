import 'package:auth_mock_3/app/core/constants/strings.dart';
import 'package:auth_mock_3/app/core/shared/helpers/value_objects/confirm_password_type.dart';
import 'package:auth_mock_3/app/core/shared/helpers/value_objects/email_type.dart';
import 'package:auth_mock_3/app/core/shared/helpers/value_objects/name_type.dart';
import 'package:auth_mock_3/app/core/shared/helpers/value_objects/password_type.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/presenter/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconly/iconly.dart';

import '../../../../login/presenter/ui/widgets/custom_container.dart';
import '../../../../login/presenter/ui/widgets/custom_elevated_button.dart';
import '../../../../login/presenter/ui/widgets/custom_text_button.dart';
import '../../../../login/presenter/ui/widgets/custom_textfield_and_label.dart';

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
            Padding(
              padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.04),
                  Text(
                    Strings.signUpTitle,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    children: [
                      Text(
                        Strings.signUpSubtitle,
                        style: TextStyle(color: Theme.of(context).dialogBackgroundColor),
                      ),
                      CustomTextButton(
                        labelText: Strings.loginButton,
                        onPressed: signUpController.goToLogin,
                      )
                    ],
                  ),
                ],
              ),
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
                          controller: signUpController.nameController,
                          validator: NameType.hasError,
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomTextFieldAndLabel(
                          label: Strings.emailField,
                          iconData: IconlyLight.message,
                          controller: signUpController.emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: EmailType.hasError,
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomTextFieldAndLabel(
                          label: Strings.passwordField,
                          iconData: IconlyLight.lock,
                          passwordTile: true,
                          controller: signUpController.passwordController,
                          validator: PasswordType.hasError,
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomTextFieldAndLabel(
                          label: Strings.confirmPasswordField,
                          iconData: IconlyLight.lock,
                          passwordTile: true,
                          controller: signUpController.confirmPasswordController,
                          validator: (confirmPassword) => ConfirmPasswordType.hasError(
                              signUpController.confirmPasswordController.text, confirmPassword),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.6),
                    child: CustomElevatedButton(
                      textButton: Strings.signUpButton,
                      onPressed: signUpController.goToProfile,
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
