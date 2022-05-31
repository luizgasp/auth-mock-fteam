import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/entities/country_entity.dart';
import 'package:flutter/material.dart';

class ProfileController {
  final profileKey = GlobalKey<FormState>();

  CountryEntity? _selectedCountry;

  CountryEntity? get country => _selectedCountry;

  void setNewCountry(CountryEntity newCountry) => _selectedCountry = newCountry;
}
