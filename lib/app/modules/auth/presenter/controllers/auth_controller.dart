import 'package:auth_mock_3/app/modules/auth/domain/helpers/params/login_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:auth_mock_3/app/modules/auth/domain/helpers/params/signup_params.dart';
import 'package:auth_mock_3/app/modules/auth/domain/repositories/i_auth_repository.dart';

class AuthController {
  final IAuthRepository authRepository;

  AuthController(this.authRepository);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> signUp() async {
    final params = SignUpParams(
      email: emailController.text,
      password: passwordController.text,
    );

    final userCredential = await authRepository.signUp(params);

    return userCredential.user!.uid.isNotEmpty ? Modular.to.navigate('/home/') : null;
  }

  Future<void> login() async {
    final params = LoginParams(
      email: emailController.text,
      password: passwordController.text,
    );

    final userCredential = await authRepository.login(params);

    return userCredential.user!.uid.isNotEmpty ? Modular.to.navigate('/home/') : null;
  }
}
