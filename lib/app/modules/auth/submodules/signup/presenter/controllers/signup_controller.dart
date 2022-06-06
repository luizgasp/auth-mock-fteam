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
      email: emailInstance.value,
      password: passwordInstance.value,
    );

    await _signUpStore.signUpWithEmail(params);

    return _signUpStore.state ? navigateToHome() : null;
  }

  final nameInstance = Name();
  String get name => nameInstance.value;
  set name(String newValue) => nameInstance.value = newValue;

  final emailInstance = Email();
  String get email => emailInstance.value;
  set email(String newValue) => emailInstance.value = newValue;

  final passwordInstance = Password();
  String get password => passwordInstance.value;
  set password(String newValue) {
    passwordInstance.value = newValue;
    confirmPasswordInstance.password = newValue;
  }

  final confirmPasswordInstance = ConfirmPassword();
  String get confirmPassword => confirmPasswordInstance.confirmPassword;
  set confirmPassword(String newValue) => confirmPasswordInstance.confirmPassword = newValue;
}
