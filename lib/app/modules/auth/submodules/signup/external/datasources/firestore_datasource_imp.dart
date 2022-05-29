import 'package:auth_mock_3/app/core/shared/services/database/helpers/params/create_user_params.dart';
import 'package:auth_mock_3/app/core/shared/services/database/i_database_service.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/infra/datasources/i_database_datasource.dart';

class FirestoreDatasourceImp implements IDatabaseDatasource {
  final IDatabaseService databaseService;

  FirestoreDatasourceImp(this.databaseService);

  @override
  Future<void> createUserInDB(CreateUserParams params) async {
    await databaseService.createUserInDB(params);
  }
}
