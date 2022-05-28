import 'package:firebase_auth/firebase_auth.dart';

import '../helpers/params/login_params.dart';
import '../helpers/params/signup_params.dart';

abstract class IAuthRepository {
  Future<void> signUp(SignUpWithEmailParams params);
  Future<void> login(LoginWithEmailParams params);
  Future<void> logout();
  User? getCurrentUser();
}
