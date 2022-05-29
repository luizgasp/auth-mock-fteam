import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/helpers/params/signup_params.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/repositories/i_signup_repository.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/useCases/i_signup_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpUsecase implements ISignUpUsecase {
  final ISignUpRepository signUpRepository;

  SignUpUsecase(this.signUpRepository);

  @override
  Future<void> signUpWithEmail(SignUpWithEmailParams params) async {
    // TODO: implement signUpWithEmail
    throw UnimplementedError();
  }

  @override
  User? getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }
}
