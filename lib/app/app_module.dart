import 'package:auth_mock_3/app/modules/auth/auth_module.dart';
import 'package:auth_mock_3/app/modules/home/home_module.dart';
import 'package:auth_mock_3/app/modules/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: SplashModule()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
