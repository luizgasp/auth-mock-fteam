import 'package:auth_mock_3/app/core/shared/exceptions/i_app_exception.dart';

class DatabaseException extends IAppException {
  DatabaseException({required super.message, required super.stackTrace});
}
