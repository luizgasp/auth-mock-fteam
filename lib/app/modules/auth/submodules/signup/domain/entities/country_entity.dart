import '../../../../../../core/shared/helpers/value_objects/name.dart';

class CountryEntity {
  final Name name;
  final String countryImage;

  CountryEntity({
    required this.name,
    required this.countryImage,
  });
}
