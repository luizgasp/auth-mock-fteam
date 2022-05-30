import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/useCases/signup/signup_usecase.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/external/datasources/firebase_signup_datasource_imp.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/infra/repositories/signup_repository_imp.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/presenter/controllers/signup_controller.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/presenter/ui/views/profile_settings_page.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/presenter/ui/views/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => FirebaseSignUpDatasourceImp(FirebaseAuth.instance)),
        Bind.factory((i) => SignUpRepositoryImp(i())),
        Bind.factory((i) => SignUpUsecase(i(), i())),
        Bind.singleton((i) => SignUpController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const SignUpPage()),
        ChildRoute('/profile', child: (_, __) => const ProfileSettingsPage()),
      ];
}
