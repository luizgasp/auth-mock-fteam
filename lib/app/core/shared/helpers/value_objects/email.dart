import '../specifications/email_specification.dart';
import 'i_value_object.dart';

class Email implements IValueObject {
  final String? value;

  Email(this.value);

  @override
  bool get isValid => EmailSpecifications.isSatisfiedBy(value);

  String errorMessage = "Invalid name";

  @override
  String? hasError() => !isValid ? errorMessage : null;
}
