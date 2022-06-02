import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/dtos/signup_dto.dart';
import '../../domain/useCases/signup/i_signup_usecase.dart';

//
class SignUpController {
  final ISignUpUsecase signUpUseCase;

  SignUpController(this.signUpUseCase);

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void goToLogin() => Modular.to.navigate('/auth/login/');
  void goToProfile() => Modular.to.pushNamed("/auth/sign/profile");

  Future<void> handleSignUpWithEmail() async {
    final params = SignUpWithEmailDTO(
      email: emailController.text,
      password: passwordController.text,
    );

    await signUpUseCase.signUpWithEmail(params);

    final currentUser = signUpUseCase.getCurrentUser();

    return currentUser != null ? Modular.to.navigate('/home/') : null;
  }
}
