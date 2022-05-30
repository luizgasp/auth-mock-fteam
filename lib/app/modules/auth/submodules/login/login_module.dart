import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/useCases/login_usecase.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/login/external/datasources/firebase_login_datasource_imp.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/login/infra/repositories/login_repository_imp.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/login/presenter/controllers/login_controller.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/login/presenter/ui/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => FirebaseLoginDatasourceImp(FirebaseAuth.instance)),
        Bind.factory((i) => LoginRepositoryImp(i())),
        Bind.factory((i) => LoginUsecase(i(), i())),
        Bind.singleton((i) => LoginController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const LoginPage()),
      ];
}
