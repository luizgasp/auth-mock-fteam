import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/entities/country_entity.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/repositories/i_country_repository.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/infra/datasources/i_country_datasource.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/infra/mappers/country_mapper.dart';

class CountryRepositoryImp implements ICountryRepository {
  final ICountryDatasource countryDatasource;

  CountryRepositoryImp(this.countryDatasource);

  @override
  Future<List<CountryEntity>> getCountries() async {
    final listData = await countryDatasource.call();

    return listData.map((country) => CountryMapper.fromMap(country)).toList();
  }
}
