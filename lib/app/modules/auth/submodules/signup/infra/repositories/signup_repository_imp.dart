import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/dtos/signup_dto.dart';
import '../../domain/repositories/i_signup_repository.dart';
import '../datasources/i_signup_datasource.dart';

class SignUpRepositoryImp implements ISignUpRepository {
  final ISignUpDatasource signUpDatasource;

  SignUpRepositoryImp(this.signUpDatasource);

  @override
  Future<void> signUpWithEmail(SignUpWithEmailDTO params) async {
    await signUpDatasource.signUpWithEmail(params);
  }

  @override
  User? getCurrentUser() => signUpDatasource.getCurrentUser();
}
