import 'package:firebase_auth/firebase_auth.dart';

import '../helpers/params/login_params.dart';
import '../helpers/params/signup_params.dart';

abstract class IAuthRepository {
  Future<UserCredential> signUp(SignUpWithEmailParams params);
  Future<UserCredential> login(LoginWithEmailParams params);
}
