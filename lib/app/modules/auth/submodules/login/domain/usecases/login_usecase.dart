import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/shared/services/auth/dtos/login_with_email_dto.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../../../../../core/shared/services/overlay/i_overlay_service.dart';
import '../../../../../../core/utils/either.dart';
import '../repositories/i_login_repository.dart';
import 'i_login_usecase.dart';

class LoginUsecase implements ILoginUsecase {
  final ILoginRepository loginRepository;
  final IOverlayService overlayService;

  const LoginUsecase(this.loginRepository, this.overlayService);

  @override
  Future<Either<IAppException, Unit>> loginWithEmail(LoginWithEmailDTO params) async {
    return await loginRepository.loginWithEmail(params);
  }

  @override
  Future<Either<IAppException, Unit>> logout() async {
    return await loginRepository.logout();
  }

  @override
  UserEntityService? getCurrentUser() => loginRepository.getCurrentUser();
}
