import 'package:flutter_modular/flutter_modular.dart';

import 'domain/useCases/signup/signup_usecase.dart';
import 'domain/usecases/country_api/country_usecase_imp.dart';
import 'external/datasources/country_datasource_imp.dart';
import 'external/datasources/firebase_signup_datasource_imp.dart';
import 'infra/repositories/country_repository_imp.dart';
import 'infra/repositories/signup_repository_imp.dart';
import 'presenter/controllers/profile_controller.dart';
import 'presenter/controllers/signup_controller.dart';
import 'presenter/stores/signup_store.dart';
import 'presenter/ui/views/profile_page.dart';
import 'presenter/ui/views/signup_page.dart';

class SignUpModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => FirebaseSignUpDatasourceImp(i())),
        Bind.factory((i) => SignUpRepositoryImp(i())),
        Bind.factory((i) => SignUpUsecase(i())),
        Bind.singleton((i) => SignUpStore(i(), i())),
        Bind.singleton((i) => SignUpController(i())),

        // Country API
        Bind.factory((i) => const CountryDatasourceImp()),
        Bind.factory((i) => CountryRepositoryImp(i())),
        Bind.factory((i) => CountryUsecaseImp(i())),

        //Profile
        Bind.singleton((i) => ProfileController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const SignUpPage()),
        ChildRoute('/profile', child: (_, __) => const ProfilePage()),
      ];
}
