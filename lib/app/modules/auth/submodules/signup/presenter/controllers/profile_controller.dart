import 'package:flutter/material.dart';

import '../../domain/entities/country_entity.dart';

class ProfileController {
  final profileKey = GlobalKey<FormState>();

  CountryEntity? _selectedCountry;

  CountryEntity? get country => _selectedCountry;
}
