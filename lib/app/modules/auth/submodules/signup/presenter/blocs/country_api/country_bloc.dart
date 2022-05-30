import 'package:auth_mock_3/app/core/shared/exceptions/implementations/country_api_exception.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/entities/country_entity.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/signup/domain/useCases/countryApi/i_country_usecase.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:equatable/equatable.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final ICountryUsecase countryUsecase;

  CountryBloc(this.countryUsecase) : super(CountryLoadingState()) {
    on<FetchCountriesEvent>((event, emit) async {
      try {
        final countries = await countryUsecase.getCountries();
        emit(CountryLoadedState(countries: countries));
      } on CountryApiException catch (error) {
        emit(CountryErrorState());
        //throw CountryApiException(message: error.message, stackTrace: stackTrace);
      }
    });
  }
}
