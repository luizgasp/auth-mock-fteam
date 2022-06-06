import '../specifications/string_specification.dart';
import 'i_value_object.dart';

class Phone implements IValueObject {
  String value;

  Phone([this.value = '']);

  @override
  bool get isValid => !StringSpecification.isSatisfiedBy(value);

  @override
  String errorMessage = 'Invalid phone';

  @override
  String? hasError() => isValid ? null : errorMessage;
}
