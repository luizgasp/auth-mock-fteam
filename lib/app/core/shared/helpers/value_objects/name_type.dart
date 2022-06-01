import 'package:auth_mock_3/app/core/shared/helpers/specifications/name_specification.dart';

class NameType {
  static bool isValid(String? value) => NameSpecification.isSatisfiedBy(value);

  static String errorMessage = "Invalid name";

  static String? hasError(String? value) => !isValid(value) ? errorMessage : null;
}
