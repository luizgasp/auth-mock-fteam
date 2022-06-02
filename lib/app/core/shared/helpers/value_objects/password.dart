import '../specifications/password_specification.dart';
import 'i_value_object.dart';

class Password implements IValueObject {
  final String? value;

  Password(this.value);

  @override
  bool get isValid => PasswordSpecification.isSatisfiedBy(value);

  String errorMessage = "Invalid password";

  @override
  String? hasError() => !isValid ? errorMessage : null;
}
