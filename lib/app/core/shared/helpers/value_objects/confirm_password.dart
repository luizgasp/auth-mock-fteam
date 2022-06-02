import 'i_value_object.dart';

class ConfirmPassword implements IValueObject {
  final String? password;
  final String? confirmPassword;

  ConfirmPassword(this.password, this.confirmPassword);

  @override
  bool get isValid => throw UnimplementedError();

  String errorMensage = "Invalid confirm password";

  @override
  String? hasError() => !isValid ? errorMensage : null;
}
