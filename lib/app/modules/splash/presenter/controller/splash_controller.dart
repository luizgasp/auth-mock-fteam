import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/repositories/i_login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashController {
  final ILoginRepository loginRepository;

  SplashController(this.loginRepository);

  Future<void> initApp() async {
    await Future.delayed(const Duration(seconds: 2));

    final currentUser = loginRepository.getCurrentUser();

    return currentUser != null ? Modular.to.navigate('/home/') : Modular.to.navigate('/auth/login');
  }
}
