import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/helpers/login_params.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/login/infra/datasources/i_login_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../core/shared/exceptions/implementations/auth_exception.dart';

class FirebaseLoginDatasourceImp implements ILoginDatasource {
  final FirebaseAuth _auth;

  FirebaseLoginDatasourceImp(FirebaseAuth auth) : _auth = auth;

  @override
  Future<void> loginWithEmail(LoginWithEmailParams params) async {
    try {
      await _auth.signInWithEmailAndPassword(email: params.email, password: params.password);
    } on FirebaseAuthException catch (e, stackTrace) {
      switch (e.code) {
        case 'invalid-email':
          throw AuthException(message: 'Invalid e-mail', stackTrace: stackTrace);
        case 'user-not-found':
          throw AuthException(message: 'User not found', stackTrace: stackTrace);
        case 'wrong-password':
          throw AuthException(message: 'Weak password, please try again', stackTrace: stackTrace);
        default:
          throw AuthException(message: 'Login error', stackTrace: stackTrace);
      }
    }
  }

  @override
  Future<void> logout() async => await _auth.signOut();

  @override
  User? getCurrentUser() => _auth.currentUser;
}
