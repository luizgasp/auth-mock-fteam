import 'package:flutter/cupertino.dart';

import '../../domain/entities/country_entity.dart';
import '../stores/country_store.dart';

class ProfileController {
  final CountryStore countryStore;

  ProfileController(this.countryStore);

  final nameController = TextEditingController();

  CountryEntity? get country => countryStore.currentCountry;
  set country(CountryEntity? country) => countryStore.currentCountry = country;
}
