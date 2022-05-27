import 'package:auth_mock_3/app/modules/auth/infra/datasources/i_auth_datasource.dart';
import 'package:auth_mock_3/app/modules/auth/domain/repositories/i_auth_repository.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/helpers/params/login_params.dart';
import '../../domain/helpers/params/signup_params.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDatasource authDatasource;

  AuthRepository(this.authDatasource);

  @override
  Future<UserCredential> signUp(SignUpWithEmailParams params) async {
    return await authDatasource.signUp(params);
  }

  @override
  Future<UserCredential> login(LoginWithEmailParams params) async {
    return await authDatasource.login(params);
  }
}
