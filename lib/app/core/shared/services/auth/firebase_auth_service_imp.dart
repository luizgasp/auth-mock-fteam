import 'package:firebase_auth/firebase_auth.dart';

import '../../exceptions/auth_exception.dart';
import 'dtos/login_with_email_dto.dart';
import 'dtos/signup_with_email_dto.dart';
import 'i_auth_service.dart';

// TODO - Implement logou functionality
class FirebaseAuthServiceImp implements IAuthService {
  final FirebaseAuth _auth;

  const FirebaseAuthServiceImp(FirebaseAuth auth) : _auth = auth;

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
  UserEntityService? getCurrentUser() {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      return null;
    } else {
      return UserEntityService(currentUser.email!);
    }
  }
}
