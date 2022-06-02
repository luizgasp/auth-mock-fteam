import '../entities/country_entity.dart';

abstract class ICountryRepository {
  Future<List<CountryEntity>> getCountries();
}
