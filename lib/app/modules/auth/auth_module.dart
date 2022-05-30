import 'package:auth_mock_3/app/modules/auth/submodules/login/login_module.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/signup_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/sign', module: SignUpModule()),
        ModuleRoute('/login', module: LoginModule()),
      ];
}
