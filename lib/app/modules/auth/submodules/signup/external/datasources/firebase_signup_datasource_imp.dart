import '../../../../../../core/shared/services/auth/dtos/signup_with_email_dto.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../infra/datasources/i_signup_datasource.dart';

class FirebaseSignUpDatasourceImp implements ISignUpDatasource {
  final IAuthService _authService;

  const FirebaseSignUpDatasourceImp(IAuthService authService) : _authService = authService;

  @override
  Future<void> signUpWithEmail(SignUpWithEmailDTO params) async {
    return await _authService.signUpWithEmail(params);
  }

  @override
  UserEntityService? getCurrentUser() => _authService.getCurrentUser();
}
