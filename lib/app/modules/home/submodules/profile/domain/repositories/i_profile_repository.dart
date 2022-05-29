import 'package:auth_mock_3/app/modules/home/submodules/profile/domain/entities/user_entity.dart';

import '../../../../../../core/shared/services/database/helpers/params/update_user_info_params.dart';

abstract class IProfileRepository {
  Future<void> updateUserInfoInDB(UpdateUserInfoParams params);
  Future<UserEntity> getUserInfo();
}
