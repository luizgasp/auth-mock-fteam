import 'package:firebase_auth/firebase_auth.dart';

import '../helpers/login_params.dart';

abstract class ILoginRepository {
  Future<void> loginWithEmail(LoginWithEmailParams params);
  User? getCurrentUser();
}
