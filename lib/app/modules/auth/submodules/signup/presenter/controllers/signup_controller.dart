import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../core/shared/services/auth/dtos/signup_with_email_dto.dart';
import '../stores/signup_store.dart';

//
class SignUpController {
  final SignUpStore _signUpStore;

  SignUpController(SignUpStore signUpStore) : _signUpStore = signUpStore;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void navigateToLogin() => Modular.to.navigate('/auth/login/');
  void pushToProfile() => Modular.to.pushNamed("/auth/sign/profile");
  void navigateToHome() => Modular.to.navigate('/home/');

  Future<void> handleSignUpWithEmail() async {
    final params = SignUpWithEmailDTO(
      email: emailController.text,
      password: passwordController.text,
    );

    await _signUpStore.signUpWithEmail(params);

    return _signUpStore.state ? navigateToHome() : null;
  }
}
