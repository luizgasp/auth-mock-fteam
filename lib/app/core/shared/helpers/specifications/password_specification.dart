import 'string_specification.dart';

class PasswordSpecification {
  static bool isSatisfiedBy(String? password) {
    if (!StringSpecification.isSatisfiedBy(password) || password!.length < 6) {
      return false;
    }

    return true;
  }
}
