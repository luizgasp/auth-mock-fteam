abstract class IAuthRepository {
  Future<void> signUp({required String email, required String password});
  Future<void> login({required String email, required String password});
}
