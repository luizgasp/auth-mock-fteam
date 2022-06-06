import 'package:flutter/cupertino.dart';

import '../../../../../../core/shared/helpers/value_objects/cpf.dart';
import '../../../../../../core/shared/helpers/value_objects/phone.dart';
import '../../../../../../core/shared/helpers/value_objects/rg.dart';
import '../../domain/entities/country_entity.dart';
import '../stores/country_store.dart';

class ProfileController {
  final CountryStore countryStore;

  ProfileController(this.countryStore);

  final nameController = TextEditingController();

  CountryEntity? get country => countryStore.currentCountry;
  set country(CountryEntity? country) => countryStore.currentCountry = country;

  final cpfInstance = CPF();
  String get cpf => cpfInstance.value;
  set cpf(String newValue) => cpf = newValue;

  final rgInstance = RG();
  String get rg => rgInstance.value;
  set rg(String newValue) => rg = newValue;

  final phoneInstance = Phone();
  String get phone => phoneInstance.value;
  set phone(String newValue) => phone = newValue;
}
