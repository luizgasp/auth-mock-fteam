import 'package:auth_mock_3/app/modules/auth/external/datasources/firebase_auth_datasource.dart';
import 'package:auth_mock_3/app/modules/auth/infra/repositories/auth_repository.dart';
import 'package:auth_mock_3/app/modules/auth/presenter/controllers/auth_controller.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/ui/views/login_page.dart';
import 'presenter/ui/views/signup_page.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => FirebaseAuthDatasource(FirebaseAuth.instance), export: true),
        Bind.factory((i) => AuthRepository(i()), export: true),
        // factory não funcionando quando eu tentei usar o export?
        Bind.singleton((i) => AuthController(i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/sign', child: (_, __) => const SignUpPage()),
        ChildRoute('/login', child: (_, __) => const LoginPage()),
      ];
}
