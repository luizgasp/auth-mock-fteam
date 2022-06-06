import 'package:flutter/services.dart';
import '../../../../../../core/shared/exceptions/country_api_exception.dart';
import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../infra/datasources/i_country_datasource.dart';

class CountryDatasourceImp implements ICountryDatasource {
  const CountryDatasourceImp();

  @override
  Future<String> getCountries() async {
    try {
      final response = await rootBundle.loadString('lib/app/core/utils/countries.json');
      return response;
    } on IAppException catch (error, stackTrace) {
      throw CountryApiException(message: 'Country API Fetch Error', stackTrace: stackTrace);
    }
  }
}
