import 'package:auth_mock_3/app/modules/auth/presenter/views/signup_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/sign', child: (_, __) => const SignUpPage()),
      ];
}
