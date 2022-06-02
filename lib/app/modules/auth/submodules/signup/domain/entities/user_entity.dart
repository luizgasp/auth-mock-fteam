import '../../../../../../core/shared/helpers/value_objects/name.dart';

class UserEntity {
  final Name name;
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
