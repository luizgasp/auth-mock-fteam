import 'package:auth_mock_3/app/core/shared/exceptions/country_api_exception.dart';
import 'package:auth_mock_3/app/core/shared/helpers/value_objects/name.dart';

import '../../domain/entities/country_entity.dart';

class CountryMapper extends CountryEntity {
  CountryMapper({
    required super.name,
    required super.countryImage,
  });

  factory CountryMapper.fromMap(Map<String, dynamic> map) {
    try {
      return CountryMapper(
        name: Name(map['name']),
        countryImage: map['image'],
      );
    } catch (error, stackTrace) {
      throw CountryApiException(message: 'Mapper Country Error', stackTrace: stackTrace);
    }
  }
}
