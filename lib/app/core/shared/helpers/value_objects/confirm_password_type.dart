import 'package:auth_mock_3/app/core/shared/helpers/specifications/confirm_password_specification.dart';

class ConfirmPasswordType {
  static bool isValid(String? password, String? confirmPassword) =>
      ConfirmPasswordSpecification.isSatisfiedBy(password, confirmPassword);

  static String errorMessage = "Invalid confirm password";

  static String? hasError(String? password, String? confirmPassword) =>
      !isValid(password, confirmPassword) ? errorMessage : null;
}
