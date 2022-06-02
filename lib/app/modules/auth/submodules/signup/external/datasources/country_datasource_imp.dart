import 'dart:convert';

import 'package:flutter/services.dart';
import '../../infra/datasources/i_country_datasource.dart';

class CountryDatasourceImp implements ICountryDatasource {
  const CountryDatasourceImp();

  @override
  Future<List> call() async {
    final response = await rootBundle.loadString("lib/app/core/utils/countries.json");
    final data = await jsonDecode(response);

    return data['countries'] as List;
  }
}
