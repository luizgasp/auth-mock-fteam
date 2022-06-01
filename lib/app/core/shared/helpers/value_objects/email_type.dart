import '../specifications/email_specification.dart';

class EmailType {
  static bool isValid(String? value) => EmailSpecifications.isSatisfiedBy(value);

  static String errorMessage = "Invalid e-mail";

  static String? hasError(String? value) => !isValid(value) ? errorMessage : null;
}
