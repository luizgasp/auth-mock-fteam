import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/useCases/countryApi/country_usecase_imp.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/useCases/signup/signup_usecase.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/external/datasources/country_datasource_imp.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/external/datasources/firebase_signup_datasource_imp.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/infra/repositories/country_repository_imp.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/infra/repositories/signup_repository_imp.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/presenter/blocs/country_api/country_bloc.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/presenter/controllers/profile_controller.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/presenter/controllers/signup_controller.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/presenter/ui/views/profile_page.dart';
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
