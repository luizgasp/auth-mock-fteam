import '../../dtos/create_user_params_dto.dart';

abstract class IDatabaseService {
  Future<void> createUserInDB(CreateUserParamsDTO params);
}
