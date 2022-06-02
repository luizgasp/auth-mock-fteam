import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../core/shared/exceptions/auth_exception.dart';
import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/utils/either.dart';

import '../../domain/dtos/login_params_dto.dart';
import '../../domain/repositories/i_login_repository.dart';
import '../datasources/i_login_datasource.dart';

class LoginRepositoryImp implements ILoginRepository {
  final ILoginDatasource loginDatasource;

  LoginRepositoryImp(this.loginDatasource);

  @override
  Future<Either<IAppException, Unit>> loginWithEmail(LoginWithEmailDTO params) async {
    try {
      await loginDatasource.loginWithEmail(params);
      return right(unit);
    } on AuthException catch (error) {
      return left(error);
    }
  }

  @override
  User? getCurrentUser() => loginDatasource.getCurrentUser();

  @override
  Future<Either<IAppException, Unit>> logout() async {
    try {
      await loginDatasource.logout();
      return right(unit);
    } on AuthException catch (error) {
      return left(error);
    }
  }
}
