import 'package:auth_mock_3/app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconly/iconly.dart';

import '../widgets/custom_container.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_textfield_and_label.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final authController = Modular.get<AuthController>();
  final _formKey = GlobalKey<FormState>();

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
                        onPressed: () => Modular.to.navigate('./login'),
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
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFieldAndLabel(
                          label: 'Full Name',
                          iconData: IconlyLight.profile,
                          controller: authController.nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Fill';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomTextFieldAndLabel(
                          label: 'E-mail',
                          iconData: IconlyLight.message,
                          controller: authController.emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Fill';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomTextFieldAndLabel(
                          label: 'Password',
                          iconData: IconlyLight.lock,
                          obscureTextProperty: true,
                          controller: authController.passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Fill';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomTextFieldAndLabel(
                          label: 'Confirm Password',
                          iconData: IconlyLight.lock,
                          obscureTextProperty: true,
                          controller: authController.confirmPasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Fill';
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
                        if (_formKey.currentState!.validate()) {
                          await authController.signUp();
                        }
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
