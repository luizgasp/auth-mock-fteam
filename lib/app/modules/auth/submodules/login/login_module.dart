import 'package:flutter_modular/flutter_modular.dart';

import 'domain/useCases/login_usecase.dart';
import 'external/datasources/firebase_login_datasource_imp.dart';
import 'infra/repositories/login_repository_imp.dart';
import 'presenter/controllers/login_controller.dart';
import 'presenter/stores/login_store.dart';
import 'presenter/ui/login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => FirebaseLoginDatasourceImp(i()), export: true),
        Bind.factory((i) => LoginRepositoryImp(i()), export: true),
        Bind.factory((i) => LoginUsecase(i(), i()), export: true),
        Bind.singleton((i) => LoginStore(i(), i())),
        Bind.singleton((i) => LoginController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const LoginPage()),
      ];
}
