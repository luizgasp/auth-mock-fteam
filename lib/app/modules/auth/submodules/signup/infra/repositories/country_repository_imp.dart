// ignore_for_file: unnecessary_lambdas

import '../../domain/entities/country_entity.dart';
import '../../domain/repositories/i_country_repository.dart';
import '../datasources/i_country_datasource.dart';
import '../mappers/country_mapper.dart';

class CountryRepositoryImp implements ICountryRepository {
  final ICountryDatasource countryDatasource;

  const CountryRepositoryImp(this.countryDatasource);

  @override
  Future<List<CountryEntity>> getCountries() async {
    final listData = await countryDatasource.call();

    return listData.map((country) => CountryMapper.fromMap(country)).toList();
  }
}
