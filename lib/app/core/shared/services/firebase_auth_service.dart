import 'package:auth_mock_3/app/core/shared/services/i_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements IAuthService {
  @override
  Future<void> forgotPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e, stackTrace) {}
  }

  @override
  Future<void> loginWithEmail() async {
    throw UnimplementedError();
  }

  @override
  Future<void> registerWithEmail() async {
    throw UnimplementedError();
  }
}
