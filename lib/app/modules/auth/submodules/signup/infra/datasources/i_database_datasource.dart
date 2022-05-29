import '../../../../../../core/shared/services/database/helpers/params/create_user_params.dart';

abstract class IDatabaseDatasource {
  Future<void> createUserInDB(CreateUserParams params);
}
