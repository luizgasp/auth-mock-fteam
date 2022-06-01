import 'package:auth_mock_3/app/core/shared/helpers/specifications/name_specification.dart';
import 'package:auth_mock_3/app/core/shared/helpers/value_objects/i_object_value.dart';

class NameType implements IObjectValue {
  final String? value;

  NameType(this.value);

  @override
  bool get isValid => NameSpecification.isSatisfiedBy(value);

  static String errorMessage = "Invalid name";

  @override
  String? hasError() => !isValid ? errorMessage : null;
}
