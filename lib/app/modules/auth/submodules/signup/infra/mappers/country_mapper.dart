import '../../domain/entities/country_entity.dart';

class CountryMapper extends CountryEntity {
  CountryMapper({
    required super.name,
    required super.countryImage,
  });

  factory CountryMapper.fromMap(Map<String, dynamic> map) {
    return CountryMapper(
      name: map['name'] ?? '',
      countryImage: map['image'] ?? '',
    );
  }
}
