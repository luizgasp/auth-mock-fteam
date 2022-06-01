import 'dart:convert';

import 'package:auth_mock_3/app/modules/auth/submodules/signup/infra/datasources/i_country_datasource.dart';
import 'package:flutter/services.dart';

class CountryDatasourceImp implements ICountryDatasource {
  CountryDatasourceImp();

  @override
  Future<List> call() async {
    final response = await rootBundle.loadString("lib/app/core/utils/countries.json");
    final data = await jsonDecode(response);

    return data['countries'] as List;
  }
}
