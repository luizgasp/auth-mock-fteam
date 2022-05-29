import 'package:auth_mock_3/app/core/shared/services/database/helpers/params/create_user_params.dart';

abstract class IDatabaseService {
  Future<void> createUserInDB(CreateUserParams params);
}
