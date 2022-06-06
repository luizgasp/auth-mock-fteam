import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../core/shared/helpers/value_objects/confirm_password.dart';
import '../../../../../../core/shared/helpers/value_objects/email.dart';
import '../../../../../../core/shared/helpers/value_objects/name.dart';
import '../../../../../../core/shared/helpers/value_objects/password.dart';
import '../../../../../../core/shared/services/auth/dtos/signup_with_email_dto.dart';
import '../stores/signup_store.dart';

//
class SignUpController {
  final SignUpStore _signUpStore;

  SignUpController(SignUpStore signUpStore) : _signUpStore = signUpStore;

  final formKey = GlobalKey<FormState>();

  void navigateToLogin() => Modular.to.navigate('/auth/login/');
  void pushToProfile() => Modular.to.pushNamed('/auth/sign/profile/', arguments: name);
  void navigateToHome() => Modular.to.navigate('/home/');

  Future<void> handleSignUpWithEmail() async {
    final params = SignUpWithEmailDTO(
      email: emailInstace.value,
      password: passwordInstace.value,
    );

    await _signUpStore.signUpWithEmail(params);

    return _signUpStore.state ? navigateToHome() : null;
  }

  Name nameInstance = Name();
  String get name => nameInstance.value;
  set name(String newValue) => nameInstance.value = newValue;

  Email emailInstace = Email();
  String get email => emailInstace.value;
  set email(String newValue) => emailInstace.value = newValue;

  Password passwordInstace = Password();
  String get password => passwordInstace.value;
  set password(String newValue) {
    passwordInstace.value = newValue;
    confirmPasswordInstace.password = newValue;
  }

  ConfirmPassword confirmPasswordInstace = ConfirmPassword();
  String get confirmPassword => confirmPasswordInstace.confirmPassword;
  set confirmPassword(String newValue) => confirmPasswordInstace.confirmPassword = newValue;
}
