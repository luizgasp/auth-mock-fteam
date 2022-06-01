import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/dtos/login_params_dto.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/repositories/i_login_repository.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/login/infra/datasources/i_login_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepositoryImp implements ILoginRepository {
  final ILoginDatasource loginDatasource;

  LoginRepositoryImp(this.loginDatasource);

  @override
  Future<void> loginWithEmail(LoginWithEmailParamsDTO params) async {
    await loginDatasource.loginWithEmail(params);
  }

  @override
  User? getCurrentUser() => loginDatasource.getCurrentUser();

  @override
  Future<void> logout() async => await loginDatasource.logout();
}
