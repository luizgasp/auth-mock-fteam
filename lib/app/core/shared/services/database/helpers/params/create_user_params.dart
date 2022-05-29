class CreateUserParams {
  final String name;
  final String email;
  final String cpf;
  final String rg;
  final String country;

  CreateUserParams({
    required this.name,
    required this.email,
    required this.cpf,
    required this.rg,
    required this.country,
  });
}
