import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/entities/country_entity.dart';

import '../../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../../core/utils/either.dart';

abstract class ICountryUsecase {
  Future<Either<IAppException, List<CountryEntity>>> getCountries();
}
