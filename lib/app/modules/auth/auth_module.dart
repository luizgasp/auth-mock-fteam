import 'package:flutter_modular/flutter_modular.dart';

import 'submodules/login/login_module.dart';
import 'submodules/signup/signup_module.dart';

class AuthModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/sign', module: SignUpModule()),
        ModuleRoute('/login', module: LoginModule()),
      ];
}
