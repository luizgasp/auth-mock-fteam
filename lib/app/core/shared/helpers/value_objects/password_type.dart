import 'package:auth_mock_3/app/core/shared/helpers/specifications/password_specification.dart';

class PasswordType {
  static bool isValid(String? value) => PasswordSpecification.isSatisfiedBy(value);

  static String errorMessage = "Invalid password";

  static String? hasError(String? value) => !isValid(value) ? errorMessage : null;
}
