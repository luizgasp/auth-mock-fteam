abstract class IAuthService {
  Future<void> loginWithEmail();
  Future<void> registerWithEmail();
  Future<void> forgotPassword(String email);
}
