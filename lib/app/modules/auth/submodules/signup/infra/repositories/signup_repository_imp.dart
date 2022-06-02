import '../../../../../../core/shared/exceptions/auth_exception.dart';
import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/shared/services/auth/dtos/signup_with_email_dto.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../../../../../core/utils/either.dart';
import '../../domain/repositories/i_signup_repository.dart';
import '../datasources/i_signup_datasource.dart';

class SignUpRepositoryImp implements ISignUpRepository {
  final ISignUpDatasource _signUpDatasource;

  const SignUpRepositoryImp(ISignUpDatasource signUpDatasource) : _signUpDatasource = signUpDatasource;

  @override
  Future<Either<IAppException, Unit>> signUpWithEmail(SignUpWithEmailDTO params) async {
    try {
      await _signUpDatasource.signUpWithEmail(params);

      return right(unit);
    } on AuthException catch (error) {
      return left(error);
    }
  }

  @override
  UserEntityService? getCurrentUser() => _signUpDatasource.getCurrentUser();
}
