import 'package:auth_mock_3/app/modules/home/submodules/profile/domain/entities/user_entity.dart';

class UserMapper extends UserEntity {
  UserMapper({
    required super.name,
    required super.cpf,
    required super.rg,
    required super.country,
  });

  factory UserMapper.fromMap(Map<String, dynamic>? map) {
    return UserMapper(
      name: map!['name'] ?? '',
      cpf: map['cpf'] ?? '',
      rg: map['rg'] ?? '',
      country: map['country'] ?? '',
    );
  }
}
