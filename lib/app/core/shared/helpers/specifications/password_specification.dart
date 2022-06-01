class PasswordSpecification {
  static bool isSatisfiedBy(String? password) {
    if (password == null || password.isEmpty) {
      return false;
    } else if (password.length < 6) {
      return false;
    }

    return true;
  }
}
