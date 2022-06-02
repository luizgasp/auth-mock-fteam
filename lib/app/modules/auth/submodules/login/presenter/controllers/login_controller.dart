import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/dtos/login_params_dto.dart';
import '../stores/login_store.dart';

class LoginController {
  final LoginStore loginStore;

  LoginController(this.loginStore);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> handleLoginWithEmail() async {
    final params = LoginWithEmailDTO(
      email: emailController.text,
      password: passwordController.text,
    );

    await loginStore.loginWithEmail(params);

    return loginStore.state ? Modular.to.navigate('/home/') : null;
  }
}
