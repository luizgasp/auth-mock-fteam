import '../specifications/name_specification.dart';
import 'i_value_object.dart';

class Name implements IValueObject {
  String value;

  Name([this.value = '']);

  @override
  bool get isValid => NameSpecification.isSatisfiedBy(value);

  @override
  String errorMessage = 'Invalid name';

  @override
  String? hasError() => isValid ? null : errorMessage;
}
