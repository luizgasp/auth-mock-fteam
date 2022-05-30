import 'package:auth_mock_3/app/core/shared/services/overlay/i_overlay_service.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/entities/country_entity.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/repositories/i_country_repository.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/useCases/countryApi/i_country_usecase.dart';

class CountryUsecaseImp implements ICountryUsecase {
  final ICountryRepository countryRepository;
  final IOverlayService overlayService;

  CountryUsecaseImp(this.countryRepository, this.overlayService);

  // TODO - Fazer o try/catch dos usecases usando o dartz
  @override
  Future<List<CountryEntity>> getCountries() async {
    return await countryRepository.getCountries();
  }
}
