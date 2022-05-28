import 'package:auth_mock_3/app/core/shared/services/database/helpers/params/create_user_params.dart';
import 'package:auth_mock_3/app/core/shared/services/database/helpers/params/update_user_info_params.dart';

abstract class IDatabaseService {
  Future<void> createUserInDB(CreateUserParams params);
  Future<void> updateUserInfoInDB(UpdateUserInfoParams params);
  Future<Map<String, dynamic>?> getUserInfo();
}
