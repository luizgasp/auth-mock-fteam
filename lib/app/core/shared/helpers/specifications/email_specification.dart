import 'package:string_validator/string_validator.dart';

class EmailSpecifications {
  static bool isSatisfiedBy(String? email) => isEmail(email!);
}
