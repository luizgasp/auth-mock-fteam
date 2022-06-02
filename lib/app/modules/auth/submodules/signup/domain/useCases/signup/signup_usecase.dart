import '../../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../../core/shared/services/auth/dtos/signup_with_email_dto.dart';
import '../../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../../../../../../core/utils/either.dart';
import '../../repositories/i_signup_repository.dart';
import 'i_signup_usecase.dart';

class SignUpUsecase implements ISignUpUsecase {
  final ISignUpRepository _signUpRepository;

  SignUpUsecase(ISignUpRepository signUpRepository) : _signUpRepository = signUpRepository;

  @override
  Future<Either<IAppException, Unit>> signUpWithEmail(SignUpWithEmailDTO params) async {
    return await _signUpRepository.signUpWithEmail(params);
  }

  @override
  UserEntityService? getCurrentUser() => _signUpRepository.getCurrentUser();
}
