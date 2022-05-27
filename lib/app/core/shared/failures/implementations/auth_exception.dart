import 'package:auth_mock_3/app/core/shared/failures/i_app_exception.dart';

class AuthException extends IAppException {
  AuthException({required super.message, required super.stackTrace});
}
