import 'dart:convert';

import 'package:flutter/services.dart';
import '../../../../../../core/shared/exceptions/country_api_exception.dart';
import '../../infra/datasources/i_country_datasource.dart';

// TODO - Change datasource passing the jsonDecode to my repository, just returning a Response on my datasource
// All code handling is a repository activity.
class CountryDatasourceImp implements ICountryDatasource {
  const CountryDatasourceImp();

  @override
  Future<List> getCountries() async {
    try {
      final response = await rootBundle.loadString('lib/app/core/utils/countries.json');
      final data = await jsonDecode(response);

      return data['countries'] as List;
    } catch (error, stackTrace) {
      throw CountryApiException(message: 'API Load Error', stackTrace: stackTrace);
    }
  }
}
