import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/dtos/login_params_dto.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/login/presenter/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginController {
  final LoginStore loginStore;

  LoginController(this.loginStore);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> handleLoginWithEmail() async {
    final params = LoginWithEmailParamsDTO(
      email: emailController.text,
      password: passwordController.text,
    );

    await loginStore.loginWithEmail(params);

    return loginStore.state ? Modular.to.navigate('/home/') : null;
  }
}
