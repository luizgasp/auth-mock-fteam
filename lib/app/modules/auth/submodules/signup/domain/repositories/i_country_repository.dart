import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/utils/either.dart';
import '../entities/country_entity.dart';

abstract class ICountryRepository {
  Future<Either<IAppException, List<CountryEntity>>> getCountries();
}
