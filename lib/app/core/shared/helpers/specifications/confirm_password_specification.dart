import 'password_specification.dart';

class ConfirmPasswordSpecification {
  static bool isSatisfiedBy(String? password, String? confirmPassword) {
    if (confirmPassword != password && PasswordSpecification.isSatisfiedBy(password)) {
      return false;
    }

    return true;
  }
}
