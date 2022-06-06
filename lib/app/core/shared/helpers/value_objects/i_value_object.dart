abstract class IValueObject {
  bool get isValid;

  String errorMessage = '';

  String? hasError();
}
