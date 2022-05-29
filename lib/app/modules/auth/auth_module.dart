import 'package:flutter_modular/flutter_modular.dart';

import 'submodules/login/presenter/ui/views/login_page.dart';
import 'submodules/signup/presenter/ui/views/signup_page.dart';

class AuthModule extends Module {
  // TODO - Instanciar tudo o que eu preciso, lembrando que eu preciso utilizar o meu loginRepository na splash
  // @override
  // List<Bind<Object>> get binds => [

  //       Bind.factory((i) => FirebaseAuthDatasourceImp(FirebaseAuth.instance), export: true),
  //       Bind.factory((i) => AuthRepository(i()), export: true),
  //       // factory não funcionando quando eu tentei usar o export?
  //       Bind.singleton((i) => AuthController(i(), i())),
  //     ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/sign', child: (_, __) => const SignUpPage()),
        ChildRoute('/login', child: (_, __) => const LoginPage()),
      ];
}
