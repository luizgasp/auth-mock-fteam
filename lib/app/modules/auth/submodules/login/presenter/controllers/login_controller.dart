import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/repositories/i_login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../core/shared/exceptions/implementations/auth_exception.dart';
import '../../../../../../core/shared/services/overlay/i_overlay_service.dart';
import '../../domain/helpers/login_params.dart';

class LoginController {
  final ILoginRepository loginRepository;
  final IOverlayService overlayService;

  LoginController(this.loginRepository, this.overlayService);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> handleLoginWithEmail() async {
    final params = LoginWithEmailParams(
      email: emailController.text,
      password: passwordController.text,
    );

    try {
      await loginRepository.loginWithEmail(params);

      final currentUser = loginRepository.getCurrentUser();

      return currentUser != null ? Modular.to.navigate('/home/') : null;
    } on AuthException catch (error) {
      overlayService.showSnackBar(error.message);
    }
  }
}
