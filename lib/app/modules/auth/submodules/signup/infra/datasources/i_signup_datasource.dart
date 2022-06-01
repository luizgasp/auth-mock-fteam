import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/dtos/signup_params.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ISignUpDatasource {
  Future<void> signUpWithEmail(SignUpWithEmailParamsDTO params);
  User? getCurrentUser();
}
