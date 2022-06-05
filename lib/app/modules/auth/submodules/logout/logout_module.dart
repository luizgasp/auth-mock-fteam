import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/logout_usecase_imp.dart';
import 'external/datasources/logout_datasource_imp.dart';
import 'infra/repositories/logout_repository_imp.dart';
import 'presenter/stores/logout_store.dart';

class LogoutModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => LogoutDatasourceImp(i()), export: true),
        Bind.factory((i) => LogoutRepositoryImp(i()), export: true),
        Bind.factory((i) => LogoutUsecaseImp(i()), export: true),
        Bind.singleton((i) => LogoutStore(i(), i()), export: true),
      ];
}
