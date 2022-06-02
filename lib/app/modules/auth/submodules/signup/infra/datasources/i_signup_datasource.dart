import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/dtos/signup_dto.dart';

abstract class ISignUpDatasource {
  Future<void> signUpWithEmail(SignUpWithEmailDTO params);
  User? getCurrentUser();
}
