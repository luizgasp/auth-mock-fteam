import '../../../../../../core/shared/services/auth/dtos/login_with_email_dto.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';

abstract class ILoginDatasource {
  Future<void> loginWithEmail(LoginWithEmailDTO params);
  UserEntityService? getCurrentUser();
}
