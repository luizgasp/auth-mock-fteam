import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/shared/services/auth/dtos/login_with_email_dto.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../../../../../core/utils/either.dart';

abstract class ILoginUsecase {
  Future<Either<IAppException, Unit>> loginWithEmail(LoginWithEmailDTO params);
  Future<Either<IAppException, Unit>> logout();
  UserEntityService? getCurrentUser();
}
