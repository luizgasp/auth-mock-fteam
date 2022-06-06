import '../specifications/string_specification.dart';
import 'i_value_object.dart';

class CPF implements IValueObject {
  String value;

  CPF([this.value = '']);

  @override
  bool get isValid => !StringSpecification.isSatisfiedBy(value);

  @override
  String errorMessage = 'Invalid cpf';

  @override
  String? hasError() => isValid ? null : errorMessage;
}
