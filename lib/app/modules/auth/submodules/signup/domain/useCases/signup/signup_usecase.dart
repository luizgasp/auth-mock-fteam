import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../../core/shared/exceptions/auth_exception.dart';
import '../../../../../../../core/shared/services/overlay/i_overlay_service.dart';
import '../../dtos/signup_dto.dart';
import '../../repositories/i_signup_repository.dart';
import 'i_signup_usecase.dart';

class SignUpUsecase implements ISignUpUsecase {
  final ISignUpRepository signUpRepository;
  final IOverlayService overlayService;

  SignUpUsecase(this.signUpRepository, this.overlayService);

  @override
  Future<void> signUpWithEmail(SignUpWithEmailDTO params) async {
    try {
      await signUpRepository.signUpWithEmail(params);
    } on AuthException catch (error) {
      overlayService.showSnackBar(error.message);
    }
  }

  @override
  User? getCurrentUser() => signUpRepository.getCurrentUser();
}
