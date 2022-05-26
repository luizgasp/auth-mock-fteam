import 'package:auth_mock_3/app/modules/auth/domain/helpers/params/login_params.dart';
import 'package:auth_mock_3/app/modules/auth/domain/helpers/params/signup_params.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthDatasource {
  Future<UserCredential> signUp(SignUpParams params);
  Future<UserCredential> login(LoginParams params);
}
