import 'package:string_validator/string_validator.dart';

class EmailSpecifications {
  static bool isSatisfiedBy(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    } else {
      return isEmail(email);
    }
  }
}
