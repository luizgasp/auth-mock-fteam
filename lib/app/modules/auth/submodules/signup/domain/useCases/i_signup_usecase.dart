import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/helpers/params/signup_params.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ISignUpUsecase {
  Future<void> signUpWithEmail(SignUpWithEmailParams params);
  User? getCurrentUser();
}
