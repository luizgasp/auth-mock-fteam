import 'package:auth_mock_3/app/modules/auth/auth_module.dart';
import 'package:auth_mock_3/app/modules/home/presenter/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
      ];
}
