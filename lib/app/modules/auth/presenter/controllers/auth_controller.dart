import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:auth_mock_3/app/modules/auth/domain/repositories/i_auth_repository.dart';
import 'package:auth_mock_3/app/core/shared/services/overlay/i_overlay_service.dart';

import '../../../../core/shared/exceptions/implementations/auth_exception.dart';
import '../../domain/helpers/params/login_params.dart';
import '../../domain/helpers/params/signup_params.dart';

class AuthController {
  final IAuthRepository authRepository;
  final IOverlayService overlayService;

  AuthController(this.authRepository, this.overlayService);

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> signUp() async {
    final params = SignUpWithEmailParams(
      email: emailController.text,
      password: passwordController.text,
    );

    final userCredential = await authRepository.signUp(params);

    return userCredential.user!.uid.isNotEmpty ? Modular.to.navigate('/home/') : null;
  }

  Future<void> login() async {
    final params = LoginWithEmailParams(
      email: emailController.text,
      password: passwordController.text,
    );

    try {
      final userCredential = await authRepository.login(params);
      return userCredential.user!.uid.isNotEmpty ? Modular.to.navigate('/home/') : null;
    } on AuthException catch (e) {
      overlayService.showSnackBar(e.message);
    }
  }
}
