import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/shared/services/auth/dtos/signup_with_email_dto.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../../../../../core/utils/either.dart';

// interface
abstract class ISignUpRepository {
  Future<Either<IAppException, Unit>> signUpWithEmail(SignUpWithEmailDTO params);
  UserEntityService? getCurrentUser();
}
