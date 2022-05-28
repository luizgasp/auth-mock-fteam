import 'package:auth_mock_3/app/modules/auth/auth_module.dart';
import 'package:auth_mock_3/app/modules/home/home_page.dart';
import 'package:auth_mock_3/app/modules/home/submodules/profile/presenter/controllers/profile_controller.dart';
import 'package:auth_mock_3/app/modules/home/submodules/profile/presenter/profile_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => ProfileController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
        ChildRoute('/profile', child: (_, __) => const ProfilePage()),
      ];
}
