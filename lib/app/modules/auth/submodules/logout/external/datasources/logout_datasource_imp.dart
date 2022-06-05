import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../infra/datasources/i_logout_datasource.dart';

class LogoutDatasourceImp implements ILogoutDatasource {
  final IAuthService _authService;

  const LogoutDatasourceImp(IAuthService authService) : _authService = authService;

  @override
  Future<void> call() async {
    return await _authService.logout();
  }
}
