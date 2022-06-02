import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../core/shared/helpers/value_objects/email.dart';
import '../../../../../../core/shared/services/auth/dtos/login_with_email_dto.dart';
import '../stores/login_store.dart';

class LoginController {
  final LoginStore loginStore;

  LoginController(this.loginStore);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Email? get email => Email(emailController.text);

  Future<void> handleLoginWithEmail() async {
    final params = LoginWithEmailDTO(
      email: emailController.text,
      password: passwordController.text,
    );

    await loginStore.loginWithEmail(params);

    return loginStore.state ? Modular.to.navigate('/home/') : null;
  }
}
