import '../../../../../../core/shared/helpers/value_objects/cpf.dart';
import '../../../../../../core/shared/helpers/value_objects/name.dart';
import '../../../../../../core/shared/helpers/value_objects/phone.dart';
import '../../../../../../core/shared/helpers/value_objects/rg.dart';

class UserEntity {
  final Name name;
  final CPF cpf;
  final RG rg;
  final Phone phone;
  final String country;

  UserEntity({
    required this.name,
    required this.cpf,
    required this.rg,
    required this.phone,
    required this.country,
  });
}
