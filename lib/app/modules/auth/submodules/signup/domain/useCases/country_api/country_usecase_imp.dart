import '../../entities/country_entity.dart';
import '../../repositories/i_country_repository.dart';
import 'i_country_usecase.dart';

class CountryUsecaseImp implements ICountryUsecase {
  final ICountryRepository countryRepository;

  CountryUsecaseImp(this.countryRepository);

// TODO - Implementar o Either
  @override
  Future<List<CountryEntity>> getCountries() async {
    return await countryRepository.getCountries();
  }
}
