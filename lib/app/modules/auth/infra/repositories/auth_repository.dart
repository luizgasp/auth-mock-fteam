import 'package:auth_mock_3/app/modules/auth/domain/helpers/params/login_params.dart';
import 'package:auth_mock_3/app/modules/auth/domain/helpers/params/signup_params.dart';
import 'package:auth_mock_3/app/modules/auth/infra/datasources/i_auth_datasource.dart';
import 'package:auth_mock_3/app/modules/auth/domain/repositories/i_auth_repository.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDatasource authDatasource;

  AuthRepository(this.authDatasource);

  @override
  Future<UserCredential> signUp(SignUpParams params) async {
    return await authDatasource.signUp(params);
  }

  @override
  Future<UserCredential> login(LoginParams params) async {
    return await authDatasource.login(params);
  }
}
