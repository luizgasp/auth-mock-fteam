import 'package:auth_mock_3/app/modules/splash/presenter/controller/splash_controller.dart';
import 'package:auth_mock_3/app/modules/splash/presenter/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => SplashController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const SplashPage()),
      ];
}
