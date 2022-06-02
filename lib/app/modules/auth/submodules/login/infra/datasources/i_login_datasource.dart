import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/dtos/login_params_dto.dart';

abstract class ILoginDatasource {
  Future<void> loginWithEmail(LoginWithEmailDTO params);
  Future<void> logout();
  User? getCurrentUser();
}
