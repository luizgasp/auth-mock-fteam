import '../specifications/email_specification.dart';
import 'i_value_object.dart';

class Email implements IValueObject {
  String value;

  Email([this.value = '']);

  @override
  bool get isValid => EmailSpecifications.isSatisfiedBy(value);

  String errorMessage = 'Invalid e-mail';

  @override
  String? hasError() => !isValid ? errorMessage : null;
}
