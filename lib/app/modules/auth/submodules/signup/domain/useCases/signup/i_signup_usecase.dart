import 'package:firebase_auth/firebase_auth.dart';

import '../../dtos/signup_dto.dart';

abstract class ISignUpUsecase {
  Future<void> signUpWithEmail(SignUpWithEmailDTO params);
  User? getCurrentUser();
}
