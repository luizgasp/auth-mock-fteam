import 'package:auth_mock_3/app/modules/auth/presenter/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.1),
                Text('👋 Hello, \nAre you new here?', style: Theme.of(context).textTheme.headline1),
                SizedBox(height: size.height * 0.04),
                Row(
                  children: [
                    Text(
                      'if you have an account /',
                      style: TextStyle(color: Theme.of(context).dialogBackgroundColor),
                    ),
                    const CustomTextButton(labelText: 'Login')
                  ],
                ),
                SizedBox(height: size.height * 0.05),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

            // Container(
            //   width: double.infinity,
            //   height: size.height,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     color: Colors.blue,
            //   ),
            // ),
