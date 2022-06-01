import 'package:firebase_auth/firebase_auth.dart';

import '../dtos/signup_params.dart';

abstract class ISignUpRepository {
  Future<void> signUpWithEmail(SignUpWithEmailParamsDTO params);
  User? getCurrentUser();
}
