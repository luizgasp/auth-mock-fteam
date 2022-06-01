import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/dtos/signup_params.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/repositories/i_signup_repository.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/infra/datasources/i_signup_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepositoryImp implements ISignUpRepository {
  final ISignUpDatasource signUpDatasource;

  SignUpRepositoryImp(this.signUpDatasource);

  @override
  Future<void> signUpWithEmail(SignUpWithEmailParamsDTO params) async {
    await signUpDatasource.signUpWithEmail(params);
  }

  @override
  User? getCurrentUser() => signUpDatasource.getCurrentUser();
}
