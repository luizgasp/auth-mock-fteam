import '../../../../../../core/shared/services/auth/dtos/login_with_email_dto.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../infra/datasources/i_login_datasource.dart';

class FirebaseLoginDatasourceImp implements ILoginDatasource {
  final IAuthService _authService;

  const FirebaseLoginDatasourceImp(IAuthService authService) : _authService = authService;

  @override
  Future<void> loginWithEmail(LoginWithEmailDTO params) async {
    return await _authService.loginWithEmail(params);
  }

  @override
  UserEntityService? getCurrentUser() => _authService.getCurrentUser();
}
