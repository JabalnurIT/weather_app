part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ChangeTemperatureUnitEvent extends HomeEvent {
  const ChangeTemperatureUnitEvent(
    this.temperatureUnit,
  );

  final String temperatureUnit;

  @override
  List<Object> get props => [temperatureUnit];
}

class GetCurrentWeatherEvent extends HomeEvent {
  const GetCurrentWeatherEvent();
}

class GetDailyForecastEvent extends HomeEvent {
  const GetDailyForecastEvent();
}

class GetHourlyForecastEvent extends HomeEvent {
  const GetHourlyForecastEvent();
}
