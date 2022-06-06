// ignore_for_file:  must_be_immutable

import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/shared/services/overlay/i_overlay_service.dart';
import '../../domain/entities/country_entity.dart';
import '../../domain/usecases/country_api/i_country_usecase.dart';

class CountryStore extends StreamStore<IAppException, List<CountryEntity>> {
  final ICountryUsecase _countryUsecase;
  final IOverlayService _overlayService;

  CountryStore(ICountryUsecase countryUsecase, IOverlayService overlayService)
      : _countryUsecase = countryUsecase,
        _overlayService = overlayService,
        super([]);

  CountryEntity? currentCountry;

  Future<void> getCountries() async {
    setLoading(true);

    final response = await _countryUsecase.getCountries();

    response.fold(
      (left) {
        setError(left);
        _overlayService.showSnackBar(left.message);
      },
      (right) {
        update(right);
        currentCountry = right[0];
      },
    );
  }
}
