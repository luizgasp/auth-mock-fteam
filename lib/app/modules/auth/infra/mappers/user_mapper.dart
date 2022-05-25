import 'package:auth_mock_3/app/modules/auth/domain/entities/user_entity.dart';

class UserMapper extends UserEntity {
  UserMapper({
    required super.name,
    required super.country,
    required super.cpf,
    required super.rg,
    required super.phone,
  });

  factory UserMapper.fromMap(Map<String, dynamic> map) {
    return UserMapper(
      name: map['name'] ?? '',
      country: map['country'] ?? '',
      cpf: map['cpf'] ?? '',
      rg: map['rg'] ?? '',
      phone: map['phone'] ?? '',
    );
  }
}
