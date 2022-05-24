import 'package:auth_mock_3/app/modules/auth/presenter/widgets/custom_elevated_button.dart';
import 'package:auth_mock_3/app/modules/auth/presenter/widgets/custom_rounded_container.dart';
import 'package:auth_mock_3/app/modules/auth/presenter/widgets/custom_text_button.dart';
import 'package:auth_mock_3/app/modules/auth/presenter/widgets/custom_textfield_and_label.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                        const CustomTextButton(labelText: 'Login')
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CustomRoundedContainer(
              child: Column(
                children: [
                  const CustomTextFieldAndLabel(
                    label: 'Full Name',
                    iconData: IconlyLight.profile,
                  ),
                  SizedBox(height: size.height * 0.025),
                  const CustomTextFieldAndLabel(
                    label: 'E-mail',
                    iconData: IconlyLight.message,
                  ),
                  SizedBox(height: size.height * 0.025),
                  const CustomTextFieldAndLabel(
                    label: 'Password',
                    iconData: IconlyLight.lock,
                  ),
                  const Spacer(),
                  const CustomElevatedButton(
                    textButton: 'Sign Up',
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
