import 'package:auth_mock_3/app/modules/auth/infra/repositories/auth_repository.dart';
import 'package:auth_mock_3/app/modules/auth/presenter/views/login_page.dart';
import 'package:auth_mock_3/app/modules/auth/presenter/views/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => AuthRepository(auth: FirebaseAuth.instance)),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/sign', child: (_, __) => const SignUpPage()),
        ChildRoute('/login', child: (_, __) => const LoginPage()),
      ];
}
