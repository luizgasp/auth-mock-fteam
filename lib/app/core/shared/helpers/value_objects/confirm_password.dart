import '../specifications/confirm_password_specification.dart';
import 'i_value_object.dart';

class ConfirmPassword implements IValueObject {
  String password;
  String confirmPassword;

  ConfirmPassword([this.password = '', this.confirmPassword = '']);

  @override
  bool get isValid => ConfirmPasswordSpecification.isSatisfiedBy(password, confirmPassword);

  @override
  String errorMessage = 'Invalid confirm password';

  @override
  String? hasError() => !isValid ? errorMessage : null;
}
