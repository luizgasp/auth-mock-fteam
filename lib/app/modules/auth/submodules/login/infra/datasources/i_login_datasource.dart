import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/helpers/login_params.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ILoginDatasource {
  Future<void> loginWithEmail(LoginWithEmailParams params);
  Future<void> logout();
  User? getCurrentUser();
}
