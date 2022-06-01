import '../../../../../../core/shared/helpers/value_objects/name_type.dart';

class UserEntity {
  final NameType name;
  final String cpf;
  final String rg;
  final String country;

  UserEntity({
    required this.name,
    required this.cpf,
    required this.rg,
    required this.country,
  });
}
