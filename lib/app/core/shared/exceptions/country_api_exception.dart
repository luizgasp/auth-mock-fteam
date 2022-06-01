import 'package:auth_mock_3/app/core/shared/exceptions/i_app_exception.dart';

class CountryApiException extends IAppException {
  CountryApiException({required super.message, super.stackTrace});
}
