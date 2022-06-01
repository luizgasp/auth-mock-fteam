import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/shared/services/overlay/i_overlay_service.dart';
import '../../../../../../core/utils/either.dart';
import '../dtos/login_params_dto.dart';
import '../repositories/i_login_repository.dart';
import 'i_login_usecase.dart';

class LoginUsecase implements ILoginUsecase {
  final ILoginRepository loginRepository;
  final IOverlayService overlayService;

  const LoginUsecase(this.loginRepository, this.overlayService);

  @override
  Future<Either<IAppException, Unit>> loginWithEmail(LoginWithEmailParamsDTO params) async {
    return await loginRepository.loginWithEmail(params);
  }

  @override
  Future<Either<IAppException, Unit>> logout() async {
    return await loginRepository.logout();
  }

  @override
  User? getCurrentUser() => loginRepository.getCurrentUser();
}
