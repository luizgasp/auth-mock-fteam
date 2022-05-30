import 'package:auth_mock_3/app/modules/auth/submodules/login/login_module.dart';
import 'package:auth_mock_3/app/modules/splash/presenter/controller/splash_controller.dart';
import 'package:auth_mock_3/app/modules/splash/presenter/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [
        LoginModule(),
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => SplashController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const SplashPage()),
      ];
}
