import '../specifications/password_specification.dart';
import 'i_value_object.dart';

class Password implements IValueObject {
  String value;

  Password([this.value = '']);

  @override
  bool get isValid => PasswordSpecification.isSatisfiedBy(value);

  @override
  String errorMessage = 'Invalid password';

  @override
  String? hasError() => isValid ? null : errorMessage;
}
