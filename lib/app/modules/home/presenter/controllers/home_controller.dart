import 'package:flutter_modular/flutter_modular.dart';

import '../../../auth/submodules/login/domain/useCases/i_login_usecase.dart';

class HomeController {
  final ILoginUsecase loginUsecase;

  HomeController(this.loginUsecase);

  Future<void> handleLogout() async {
    await loginUsecase.logout();

    Modular.to.navigate('/auth/login/');
  }
}
