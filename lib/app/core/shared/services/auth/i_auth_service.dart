import 'dtos/login_with_email_dto.dart';
import 'dtos/signup_with_email_dto.dart';

abstract class IAuthService {
  Future<void> signUpWithEmail(SignUpWithEmailDTO params);
  Future<void> loginWithEmail(LoginWithEmailDTO params);
  Future<void> logout();
  UserEntityService? getCurrentUser();
}

class UserEntityService {
  final String email;

  const UserEntityService(this.email);
}
