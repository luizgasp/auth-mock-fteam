part of 'country_bloc.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

class CountryLoadingState extends CountryState {}

class CountryLoadedState extends CountryState {
  final List<CountryEntity> countries;

  const CountryLoadedState({required this.countries});

  @override
  List<Object> get props => [countries];
}

class CountryErrorState extends CountryState {}
