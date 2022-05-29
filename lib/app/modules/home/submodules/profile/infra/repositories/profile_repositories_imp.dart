import 'package:auth_mock_3/app/modules/home/submodules/profile/domain/entities/user_entity.dart';
import 'package:auth_mock_3/app/core/shared/services/database/helpers/params/update_user_info_params.dart';
import 'package:auth_mock_3/app/modules/home/submodules/profile/domain/repositories/i_profile_repository.dart';
import 'package:auth_mock_3/app/modules/home/submodules/profile/infra/datasources/i_database_datasource.dart';
import 'package:auth_mock_3/app/modules/home/submodules/profile/infra/mappers/user_mapper.dart';

class ProfileRepositoriesImp implements IProfileRepository {
  final IDatabaseDatasource databaseDatasource;

  ProfileRepositoriesImp(this.databaseDatasource);

  @override
  Future<UserEntity> getUserInfo() async {
    final userMap = await databaseDatasource.getUserInfo();

    return UserMapper.fromMap(userMap);
  }

  @override
  Future<void> updateUserInfoInDB(UpdateUserInfoParams params) async {
    await databaseDatasource.updateUserInfoInDB(params);
  }
}
