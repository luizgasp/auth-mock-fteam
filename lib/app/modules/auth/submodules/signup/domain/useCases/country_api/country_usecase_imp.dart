import '../../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../../core/utils/either.dart';
import '../../entities/country_entity.dart';
import '../../repositories/i_country_repository.dart';
import 'i_country_usecase.dart';

class CountryUsecaseImp implements ICountryUsecase {
  final ICountryRepository countryRepository;

  CountryUsecaseImp(this.countryRepository);

  @override
  Future<Either<IAppException, List<CountryEntity>>> getCountries() async {
    return await countryRepository.getCountries();
  }
}
