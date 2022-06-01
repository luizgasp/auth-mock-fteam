import 'package:auth_mock_3/app/core/shared/services/overlay/i_overlay_service.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/dtos/signup_params.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/repositories/i_signup_repository.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/useCases/signup/i_signup_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../../core/shared/exceptions/auth_exception.dart';

class SignUpUsecase implements ISignUpUsecase {
  final ISignUpRepository signUpRepository;
  final IOverlayService overlayService;

  SignUpUsecase(this.signUpRepository, this.overlayService);

  @override
  Future<void> signUpWithEmail(SignUpWithEmailParamsDTO params) async {
    try {
      await signUpRepository.signUpWithEmail(params);
    } on AuthException catch (error) {
      overlayService.showSnackBar(error.message);
    }
  }

  @override
  User? getCurrentUser() => signUpRepository.getCurrentUser();
}
