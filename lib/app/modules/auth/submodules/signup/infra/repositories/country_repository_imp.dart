// ignore_for_file: unnecessary_lambdas

import 'dart:convert';

import '../../../../../../core/shared/exceptions/country_api_exception.dart';
import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/utils/either.dart';
import '../../domain/entities/country_entity.dart';
import '../../domain/repositories/i_country_repository.dart';
import '../datasources/i_country_datasource.dart';
import '../mappers/country_mapper.dart';

class CountryRepositoryImp implements ICountryRepository {
  final ICountryDatasource countryDatasource;

  const CountryRepositoryImp(this.countryDatasource);

  @override
  Future<Either<IAppException, List<CountryEntity>>> getCountries() async {
    try {
      final stringData = await countryDatasource.getCountries();

      final data = jsonDecode(stringData);

      final dataCountries = data['countries'] as List;

      final countryList = dataCountries.map((country) => CountryMapper.fromMap(country)).toList();

      return right(countryList);
    } on CountryApiException catch (error) {
      return left(error);
    }
  }
}
