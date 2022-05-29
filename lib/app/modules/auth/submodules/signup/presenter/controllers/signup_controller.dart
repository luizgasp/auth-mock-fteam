import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/repositories/i_signup_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../core/shared/exceptions/implementations/auth_exception.dart';
import '../../../../../../core/shared/services/overlay/i_overlay_service.dart';
import '../../domain/helpers/params/signup_params.dart';

class SignUpController {
  final ISignUpRepository signUpRepository;
  final IOverlayService overlayService;

  SignUpController(this.signUpRepository, this.overlayService);

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> handleSignUpWithEmail() async {
    final params = SignUpWithEmailParams(
      email: emailController.text,
      password: passwordController.text,
    );

    try {
      await signUpRepository.signUpWithEmail(params);

      final currentUser = signUpRepository.getCurrentUser();

      return currentUser != null ? Modular.to.navigate('/home/') : null;
    } on AuthException catch (error) {
      overlayService.showSnackBar(error.message);
    }
  }
}
