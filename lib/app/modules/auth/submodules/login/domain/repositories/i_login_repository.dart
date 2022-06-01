import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/dtos/login_params_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ILoginRepository {
  Future<void> loginWithEmail(LoginWithEmailParamsDTO params);
  Future<void> logout();
  User? getCurrentUser();
}
