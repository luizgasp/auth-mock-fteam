import 'package:auth_mock_3/app/core/shared/exceptions/i_app_exception.dart';
import 'package:auth_mock_3/app/core/utils/either.dart';

abstract class ILogoutRepository {
  Future<Either<IAppException, Unit>> call();
}
