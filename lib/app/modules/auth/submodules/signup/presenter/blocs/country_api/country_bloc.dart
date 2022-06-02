import 'package:equatable/equatable.dart';
import "package:flutter_bloc/flutter_bloc.dart";

import '../../../../../../../core/shared/exceptions/country_api_exception.dart';
import '../../../domain/entities/country_entity.dart';
import '../../../domain/useCases/countryApi/i_country_usecase.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final ICountryUsecase countryUsecase;

  CountryBloc(this.countryUsecase) : super(CountryLoadingState()) {
    on<FetchCountriesEvent>((event, emit) async {
      try {
        final countries = await countryUsecase.getCountries();
        emit(CountryLoadedState(countries: countries));
      } on CountryApiException {
        emit(CountryErrorState());
        //throw CountryApiException(message: error.message, stackTrace: stackTrace);
      }
    });
  }
}
