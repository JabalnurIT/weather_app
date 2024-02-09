part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeError extends HomeState {
  const HomeError(
    this.message,
  );

  final String message;

  @override
  List<Object> get props => [message];
}

class HomeUpdating extends HomeState {
  const HomeUpdating();
}

class CurrentWeatherUpdated extends HomeState {
  const CurrentWeatherUpdated(this.weather);

  final Weather weather;

  @override
  List<Object> get props => [weather];
}

class DailyForecastUpdated extends HomeState {
  const DailyForecastUpdated(this.forecast);

  final List<Weather> forecast;

  @override
  List<Object> get props => [forecast];
}

class HourlyForecastUpdated extends HomeState {
  const HourlyForecastUpdated(this.forecast);

  final List<Weather> forecast;

  @override
  List<Object> get props => [forecast];
}

class TemperatureUnitChanged extends HomeState {
  const TemperatureUnitChanged(this.temperatureUnit);

  final String temperatureUnit;

  @override
  List<Object> get props => [temperatureUnit];
}
