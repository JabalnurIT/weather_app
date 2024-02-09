import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/weather.dart';
import '../../domain/usecases/get_current_weather.dart';
import '../../domain/usecases/get_daily_forecast.dart';
import '../../domain/usecases/get_hourly_forecast.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required GetCurrentWeather getCurrentWeather,
    required GetDailyForecast getDailyForecast,
    required GetHourlyForecast getHourlyForecast,
  })  : _getCurrentWeather = getCurrentWeather,
        _getDailyForecast = getDailyForecast,
        _getHourlyForecast = getHourlyForecast,
        super(const HomeInitial()) {
    on<HomeEvent>((event, emit) {
      emit(const HomeLoading());
    });
    on<ChangeTemperatureUnitEvent>((event, emit) {
      emit(TemperatureUnitChanged(event.temperatureUnit));
    });
    on<GetCurrentWeatherEvent>(_getCurrentWeatherHandler);
    on<GetDailyForecastEvent>(_getDailyForecastHandler);
    on<GetHourlyForecastEvent>(_getHourlyForecastHandler);
  }
  final GetCurrentWeather _getCurrentWeather;
  final GetDailyForecast _getDailyForecast;
  final GetHourlyForecast _getHourlyForecast;

  Future<void> _getCurrentWeatherHandler(
    GetCurrentWeatherEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await _getCurrentWeather();
    result.fold(
      (failure) => emit(HomeError(failure.errorMessage)),
      (data) => emit(CurrentWeatherUpdated(data)),
    );
  }

  Future<void> _getDailyForecastHandler(
    GetDailyForecastEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await _getDailyForecast();
    result.fold(
      (failure) => emit(HomeError(failure.errorMessage)),
      (data) => emit(DailyForecastUpdated(data)),
    );
  }

  Future<void> _getHourlyForecastHandler(
    GetHourlyForecastEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await _getHourlyForecast();
    result.fold(
      (failure) => emit(HomeError(failure.errorMessage)),
      (data) => emit(HourlyForecastUpdated(data)),
    );
  }
}
