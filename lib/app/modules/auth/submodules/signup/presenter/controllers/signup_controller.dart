import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/dtos/signup_params.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/useCases/signup/i_signup_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    final params = SignUpWithEmailParamsDTO(
      email: emailController.text,
      password: passwordController.text,
    );

    await signUpUseCase.signUpWithEmail(params);

    final currentUser = signUpUseCase.getCurrentUser();

    return currentUser != null ? Modular.to.navigate('/home/') : null;
  }
}
