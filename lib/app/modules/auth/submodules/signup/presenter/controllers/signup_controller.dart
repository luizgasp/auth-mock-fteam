import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/useCases/signup/i_signup_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/helpers/params/signup_params.dart';

class SignUpController {
  final ISignUpUsecase signUpUseCase;

  SignUpController(this.signUpUseCase);

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> handleSignUpWithEmail() async {
    final params = SignUpWithEmailParams(
      email: emailController.text,
      password: passwordController.text,
    );

    await signUpUseCase.signUpWithEmail(params);

    final currentUser = signUpUseCase.getCurrentUser();

    return currentUser != null ? Modular.to.navigate('/home/') : null;
  }
}
