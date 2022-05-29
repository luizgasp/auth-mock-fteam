import 'package:firebase_auth/firebase_auth.dart';

import '../helpers/params/signup_params.dart';

abstract class ISignUpRepository {
  Future<void> signUpWithEmail(SignUpWithEmailParams params);
  User? getCurrentUser();
}
