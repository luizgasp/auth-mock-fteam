import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/helpers/params/login_params.dart';
import '../../domain/helpers/params/signup_params.dart';

abstract class IAuthDatasource {
  Future<UserCredential> signUp(SignUpWithEmailParams params);
  Future<UserCredential> login(LoginWithEmailParams params);
}
