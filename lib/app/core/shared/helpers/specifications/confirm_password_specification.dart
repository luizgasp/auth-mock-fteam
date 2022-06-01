class ConfirmPasswordSpecification {
  static bool isSatisfiedBy(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return false;
    } else if (confirmPassword != password) {
      return false;
    }

    return true;
  }
}
