import 'package:auth_mock_3/app/core/shared/services/database/helpers/params/update_user_info_params.dart';
import 'package:auth_mock_3/app/core/shared/services/database/i_database_service.dart';

import '../../infra/datasources/i_database_datasource.dart';

class FirestoreDatasourceImp implements IDatabaseDatasource {
  final IDatabaseService _databaseService;

  FirestoreDatasourceImp({required IDatabaseService databaseService}) : _databaseService = databaseService;

  @override
  Future<void> updateUserInfoInDB(UpdateUserInfoParams params) async {
    await _databaseService.updateUserInfoInDB(params);
  }
}
