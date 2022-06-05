import '../../../../../../core/shared/exceptions/auth_exception.dart';
import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/utils/either.dart';
import '../../domain/repositories/i_logout_repository.dart';
import '../datasources/i_logout_datasource.dart';

class LogoutRepositoryImp implements ILogoutRepository {
  final ILogoutDatasource _logoutDatasource;

  const LogoutRepositoryImp(ILogoutDatasource logoutDatasource) : _logoutDatasource = logoutDatasource;

  @override
  Future<Either<IAppException, Unit>> call() async {
    try {
      await _logoutDatasource();
      return right(unit);
    } on AuthException catch (error) {
      return left(error);
    }
  }
}
