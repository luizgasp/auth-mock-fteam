import 'package:auth_mock_3/app/modules/auth/presenter/widgets/custom_elevated_button.dart';
import 'package:auth_mock_3/app/modules/auth/presenter/widgets/custom_rounded_container.dart';
import 'package:auth_mock_3/app/modules/auth/presenter/widgets/custom_text_button.dart';
import 'package:auth_mock_3/app/modules/auth/presenter/widgets/custom_textfield_and_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconly/iconly.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.27,
              child: Padding(
                padding: const EdgeInsets.all(32),
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
            ),
            CustomRoundedContainer(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFieldAndLabel(
                          label: 'Full Name',
                          iconData: IconlyLight.profile,
                          controller: _nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Preencha este campo';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.025),
                        CustomTextFieldAndLabel(
                          label: 'E-mail',
                          iconData: IconlyLight.message,
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Preencha este campo';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.025),
                        CustomTextFieldAndLabel(
                          label: 'Password',
                          iconData: IconlyLight.lock,
                          obscureTextProperty: true,
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Preencha este campo';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.025),
                        CustomTextFieldAndLabel(
                          label: 'Confirm Password',
                          iconData: IconlyLight.lock,
                          obscureTextProperty: true,
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Preencha este campo';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                    textButton: 'Sign Up',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Validado!');
                      } else {
                        print("Não validado");
                      }
                    },
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
