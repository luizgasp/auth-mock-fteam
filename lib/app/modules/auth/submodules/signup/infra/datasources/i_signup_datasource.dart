import '../../../../../../core/shared/services/auth/dtos/signup_with_email_dto.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';

abstract class ISignUpDatasource {
  Future<void> signUpWithEmail(SignUpWithEmailDTO params);
  UserEntityService? getCurrentUser();
}
