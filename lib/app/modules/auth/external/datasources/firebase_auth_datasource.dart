import 'package:auth_mock_3/app/modules/auth/domain/helpers/params/signup_params.dart';
import 'package:auth_mock_3/app/modules/auth/infra/datasources/i_auth_datasource.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/shared/exceptions/implementations/auth_exception.dart';
import '../../domain/helpers/params/login_params.dart';

// TODO - Transform this datasource into a service
class FirebaseAuthDatasource implements IAuthDatasource {
  final FirebaseAuth _auth;

  FirebaseAuthDatasource(this._auth);

  @override
  Future<void> signUp(SignUpWithEmailParams params) async {
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
          throw AuthException(message: 'Sign Up error', stackTrace: stackTrace);
      }
    }
  }

  @override
  Future<void> login(LoginWithEmailParams params) async {
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
