import 'package:firebase_auth/firebase_auth.dart';

import 'package:auth_mock_3/app/modules/auth/domain/repositories/i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth auth;

  AuthRepository({required this.auth});

  @override
  Future<void> signUp({required String email, required String password}) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> login({required String email, required String password}) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
