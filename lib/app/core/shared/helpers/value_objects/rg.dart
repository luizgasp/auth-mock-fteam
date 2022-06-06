import '../specifications/string_specification.dart';
import 'i_value_object.dart';

class RG implements IValueObject {
  String value;

  RG([this.value = '']);

  @override
  bool get isValid => !StringSpecification.isSatisfiedBy(value);

  @override
  String errorMessage = 'Invalid rg';

  @override
  String? hasError() => isValid ? null : errorMessage;
}
