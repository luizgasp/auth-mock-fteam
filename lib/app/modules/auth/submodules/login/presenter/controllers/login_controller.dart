import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/dtos/login_params_dto.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/useCases/i_login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginController {
  final ILoginUsecase loginUsecase;

  LoginController(this.loginUsecase);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> handleLoginWithEmail() async {
    final params = LoginWithEmailParamsDTO(
      email: emailController.text,
      password: passwordController.text,
    );

    await loginUsecase.loginWithEmail(params);

    final currentUser = loginUsecase.getCurrentUser();

    return currentUser != null ? Modular.to.navigate('/home/') : null;
  }
}
