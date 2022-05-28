import 'package:auth_mock_3/app/modules/auth/domain/repositories/i_auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashController {
  final IAuthRepository authRepository;

  SplashController(this.authRepository);

  Future<void> initApp() async {
    await Future.delayed(const Duration(seconds: 2));

    final currentUser = authRepository.getCurrentUser();

    return currentUser != null ? Modular.to.navigate('/home/') : Modular.to.navigate('/auth/login');
  }
}
