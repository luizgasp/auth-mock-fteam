import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/useCases/countryApi/country_usecase_imp.dart';
import 'domain/useCases/signup/signup_usecase.dart';
import 'external/datasources/country_datasource_imp.dart';
import 'external/datasources/firebase_signup_datasource_imp.dart';
import 'infra/repositories/country_repository_imp.dart';
import 'infra/repositories/signup_repository_imp.dart';
import 'presenter/blocs/country_api/country_bloc.dart';
import 'presenter/controllers/profile_controller.dart';
import 'presenter/controllers/signup_controller.dart';
import 'presenter/ui/views/profile_page.dart';
import 'presenter/ui/views/signup_page.dart';

class SignUpModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => FirebaseSignUpDatasourceImp(FirebaseAuth.instance)),
        Bind.factory((i) => SignUpRepositoryImp(i())),
        Bind.factory((i) => SignUpUsecase(i(), i())),
        Bind.singleton((i) => SignUpController(i())),

        // Country API
        Bind.factory((i) => CountryDatasourceImp()),
        Bind.factory((i) => CountryRepositoryImp(i())),
        Bind.factory((i) => CountryUsecaseImp(i(), i())),
        Bind.singleton((i) => CountryBloc(i())),

        //Profile
        Bind.singleton((i) => ProfileController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const SignUpPage()),
        ChildRoute('/profile', child: (_, __) => const ProfilePage()),
      ];
}
