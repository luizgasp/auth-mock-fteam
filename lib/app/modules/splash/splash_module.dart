import 'package:flutter_modular/flutter_modular.dart';

import '../auth/submodules/login/login_module.dart';
import 'presenter/controller/splash_controller.dart';
import 'presenter/splash_page.dart';

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
