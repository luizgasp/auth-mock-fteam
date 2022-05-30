import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/useCases/i_login_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController {
  final ILoginUsecase loginUsecase;

  HomeController(this.loginUsecase);

  Future<void> handleLogout() async {
    await loginUsecase.logout();

    Modular.to.navigate('/auth/login/');
  }
}
