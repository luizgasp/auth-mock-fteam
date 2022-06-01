import 'dtos/create_user_dto.dart';

abstract class IDatabaseService {
  Future<void> createUserInDB(CreateUserDTO params);
}
