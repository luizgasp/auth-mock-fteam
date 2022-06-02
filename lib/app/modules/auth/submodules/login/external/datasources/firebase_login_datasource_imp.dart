import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../core/shared/exceptions/auth_exception.dart';
import '../../domain/dtos/login_params_dto.dart';
import '../../infra/datasources/i_login_datasource.dart';

class FirebaseLoginDatasourceImp implements ILoginDatasource {
  final FirebaseAuth _auth;

  FirebaseLoginDatasourceImp(FirebaseAuth auth) : _auth = auth;

  @override
  Future<void> loginWithEmail(LoginWithEmailDTO params) async {
    try {
      await _auth.signInWithEmailAndPassword(email: params.email, password: params.password);
    } on FirebaseAuthException catch (e, stackTrace) {
      switch (e.code) {
        case 'invalid-email':
          throw AuthException(message: 'Invalid e-mail', stackTrace: stackTrace);
        case 'user-not-found':
          throw AuthException(message: 'User not found', stackTrace: stackTrace);
        case 'wrong-password':
          throw AuthException(message: 'Wrong password, please try again', stackTrace: stackTrace);
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
