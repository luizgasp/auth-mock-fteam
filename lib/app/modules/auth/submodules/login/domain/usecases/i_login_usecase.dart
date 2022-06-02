import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/utils/either.dart';
import '../dtos/login_params_dto.dart';

abstract class ILoginUsecase {
  Future<Either<IAppException, Unit>> loginWithEmail(LoginWithEmailDTO params);
  Future<Either<IAppException, Unit>> logout();
  User? getCurrentUser();
}
