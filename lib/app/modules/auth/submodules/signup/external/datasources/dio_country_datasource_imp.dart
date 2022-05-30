import 'package:auth_mock_3/app/modules/auth/submodules/signup/infra/datasources/i_country_datasource.dart';
import 'package:dio/dio.dart';

class DioCountryDatasourceImp implements ICountryDatasource {
  final Dio dio;

  DioCountryDatasourceImp(this.dio);

  @override
  Future<List> call() async {
    const apiUrl = String.fromEnvironment('api_url');
    final response = await dio.get(apiUrl);

    return response.data as List;
  }
}
