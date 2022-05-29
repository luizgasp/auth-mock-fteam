import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/helpers/params/signup_params.dart';

abstract class ISignUpDatasource {
  Future<void> signUpWithEmail(SignUpWithEmailParams params);
  User? getCurrentUser();
}
