import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/utils/either.dart';

abstract class ILogoutUsecase {
  Future<Either<IAppException, Unit>> call();
}
