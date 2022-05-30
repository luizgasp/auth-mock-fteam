import 'package:auth_mock_3/app/core/shared/services/overlay/i_overlay_service.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/helpers/login_params.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/repositories/i_login_repository.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/useCases/i_login_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../core/shared/exceptions/implementations/auth_exception.dart';

class LoginUsecase implements ILoginUsecase {
  final ILoginRepository loginRepository;
  final IOverlayService overlayService;

  LoginUsecase(this.loginRepository, this.overlayService);

  @override
  Future<void> loginWithEmail(LoginWithEmailParams params) async {
    try {
      await loginRepository.loginWithEmail(params);
    } on AuthException catch (error) {
      overlayService.showSnackBar(error.message);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await loginRepository.logout();
    } on AuthException catch (error) {
      overlayService.showSnackBar(error.message);
    }
  }

  @override
  User? getCurrentUser() => loginRepository.getCurrentUser();
}
