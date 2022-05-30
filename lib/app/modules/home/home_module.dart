import 'package:auth_mock_3/app/modules/auth/submodules/login/login_module.dart';
import 'package:auth_mock_3/app/modules/home/presenter/controllers/home_controller.dart';
import 'package:auth_mock_3/app/modules/home/presenter/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        LoginModule(),
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => HomeController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
      ];
}
