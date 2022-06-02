import '../../../../../../core/shared/exceptions/auth_exception.dart';
import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/shared/services/auth/dtos/login_with_email_dto.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../../../../../core/utils/either.dart';

import '../../domain/repositories/i_login_repository.dart';
import '../datasources/i_login_datasource.dart';

class LoginRepositoryImp implements ILoginRepository {
  final ILoginDatasource loginDatasource;

  const LoginRepositoryImp(this.loginDatasource);

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
  Future<Either<IAppException, Unit>> logout() async {
    try {
      await loginDatasource.logout();
      return right(unit);
    } on AuthException catch (error) {
      return left(error);
    }
  }

  @override
  UserEntityService? getCurrentUser() => loginDatasource.getCurrentUser();
}
