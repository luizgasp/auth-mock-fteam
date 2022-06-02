import 'package:auth_mock_3/app/core/shared/helpers/value_objects/email.dart';
import 'package:auth_mock_3/app/core/shared/helpers/value_objects/password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../core/shared/services/auth/dtos/login_with_email_dto.dart';
import '../stores/login_store.dart';

class LoginController {
  final LoginStore loginStore;

  LoginController(this.loginStore);

  final formKey = GlobalKey<FormState>();

  void _navigatoToHome() => Modular.to.navigate('/home/');
  void navigatoToSignUp() => Modular.to.navigate('/auth/sign/');

  // Fields
  Email emailInstace = Email();
  String get email => emailInstace.value;
  set email(String newValue) => emailInstace.value = newValue;

  Password passwordInstace = Password();
  String get password => passwordInstace.value;
  set password(String newValue) => passwordInstace.value = newValue;

  Future<void> handleLoginWithEmail() async {
    final params = LoginWithEmailDTO(
      email: email,
      password: password,
    );

    await loginStore.loginWithEmail(params);

    return loginStore.state ? _navigatoToHome() : null;
  }
}
