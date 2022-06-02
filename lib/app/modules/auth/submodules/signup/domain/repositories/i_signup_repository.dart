import 'package:firebase_auth/firebase_auth.dart';

import '../dtos/signup_dto.dart';

abstract class ISignUpRepository {
  Future<void> signUpWithEmail(SignUpWithEmailDTO params);
  User? getCurrentUser();
}
