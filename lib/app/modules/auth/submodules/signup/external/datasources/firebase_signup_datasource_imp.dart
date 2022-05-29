import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/helpers/params/signup_params.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/infra/datasources/i_signup_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../core/shared/exceptions/implementations/auth_exception.dart';

class FirebaseSignUpDatasourceImp implements ISignUpDatasource {
  final FirebaseAuth _auth;

  FirebaseSignUpDatasourceImp(FirebaseAuth auth) : _auth = auth;

  @override
  Future<void> signUpWithEmail(SignUpWithEmailParams params) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: params.email, password: params.password);
    } on FirebaseAuthException catch (e, stackTrace) {
      switch (e.code) {
        case 'invalid-email':
          throw AuthException(message: 'Invalid e-mail', stackTrace: stackTrace);
        case 'email-already-in-use':
          throw AuthException(message: 'E-mail already in use', stackTrace: stackTrace);
        case 'weak-password':
          throw AuthException(message: 'Weak password, please try again', stackTrace: stackTrace);
        default:
          throw AuthException(message: 'Sign up error', stackTrace: stackTrace);
      }
    }
  }

  @override
  User? getCurrentUser() => _auth.currentUser;
}
