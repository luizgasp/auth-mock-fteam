import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/entities/country_entity.dart';

abstract class ICountryUsecase {
  Future<List<CountryEntity>> getCountries();
}
