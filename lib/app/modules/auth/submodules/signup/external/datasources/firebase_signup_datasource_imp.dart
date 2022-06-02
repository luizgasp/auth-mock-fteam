import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../core/shared/exceptions/auth_exception.dart';
import '../../domain/dtos/signup_dto.dart';
import '../../infra/datasources/i_signup_datasource.dart';

class FirebaseSignUpDatasourceImp implements ISignUpDatasource {
  final FirebaseAuth _auth;

  FirebaseSignUpDatasourceImp(FirebaseAuth auth) : _auth = auth;

  @override
  Future<void> signUpWithEmail(SignUpWithEmailDTO params) async {
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
