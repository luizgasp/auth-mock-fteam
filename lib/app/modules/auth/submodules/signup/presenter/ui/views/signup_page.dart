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
                    '👋 Hello, \nAre you new here?',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    children: [
                      Text(
                        'if you have an account /',
                        style: TextStyle(color: Theme.of(context).dialogBackgroundColor),
                      ),
                      CustomTextButton(
                        labelText: 'Login',
                        onPressed: () => Modular.to.navigate('/auth/login/'),
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
                          label: 'Full Name',
                          iconData: IconlyLight.profile,
                          controller: signUpController.nameController,
                          validator: (name) {
                            if (name == null || name.isEmpty) {
                              return 'Please, fill this field';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomTextFieldAndLabel(
                          label: 'E-mail',
                          iconData: IconlyLight.message,
                          controller: signUpController.emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Please, fill this field';
                            } else if (!email.contains('@') && !email.contains('.')) {
                              return 'Please, enter a valid e-mail';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomTextFieldAndLabel(
                          label: 'Password',
                          iconData: IconlyLight.lock,
                          passwordTile: true,
                          controller: signUpController.passwordController,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Please, fill this field';
                            } else if (password.length < 6) {
                              return 'Your password must contain at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomTextFieldAndLabel(
                          label: 'Confirm Password',
                          iconData: IconlyLight.lock,
                          passwordTile: true,
                          controller: signUpController.confirmPasswordController,
                          validator: (confirmPassword) {
                            if (confirmPassword == null || confirmPassword.isEmpty) {
                              return 'Please, fill this field';
                            } else if (signUpController.passwordController.text != confirmPassword) {
                              return 'Please, your passwords need to match';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.6),
                    child: CustomElevatedButton(
                      textButton: 'Sign Up',
                      onPressed: () async {
                        // TODO - VOLTAR O VALIDAÇÂO DE CONTROLLER PELO IF
                        // if (authController.formKey.currentState!.validate()) {
                        //   Modular.to.navigate('/auth/sign/profile/');
                        // }
                        Modular.to.pushNamed("/auth/sign/profile");
                      },
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
