import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/src/home/data/models/weather_model.dart';
import 'package:weather_app/src/home/domain/usecases/get_current_weather.dart';
import 'package:weather_app/src/home/domain/usecases/get_daily_forecast.dart';
import 'package:weather_app/src/home/domain/usecases/get_hourly_forecast.dart';
import 'package:weather_app/src/home/presentation/bloc/home_bloc.dart';

class MockGetCurrentWeather extends Mock implements GetCurrentWeather {}

class MockGetDailyForecast extends Mock implements GetDailyForecast {}

class MockGetHourlyForecast extends Mock implements GetHourlyForecast {}

void main() {
  late MockGetCurrentWeather getCurrentWeather;
  late MockGetDailyForecast getDailyForecast;
  late MockGetHourlyForecast getHourlyForecast;
  late HomeBloc homeBloc;

  setUp(() {
    getCurrentWeather = MockGetCurrentWeather();
    getDailyForecast = MockGetDailyForecast();
    getHourlyForecast = MockGetHourlyForecast();
    homeBloc = HomeBloc(
      getCurrentWeather: getCurrentWeather,
      getDailyForecast: getDailyForecast,
      getHourlyForecast: getHourlyForecast,
    );
  });

  setUpAll(() {});

  tearDown(() => homeBloc.close());

  test('InitialState must be [AuthInitial]', () {
    expect(homeBloc.state, const HomeInitial());
  });

  const tServerFailure = ServerFailure(
    message:
        'There is no user record corresponding to this identifier. The user may have been deleted.',
    statusCode: '404',
  );

  group('changeTemperatureUnitEvent', () {
    blocTest<HomeBloc, HomeState>(
      "should emit [HomeLoading, TemperatureUnitChanged] when [ChangeTemperatureUnitEvent] is added",
      build: () {
        return homeBloc;
      },
      act: (bloc) {
        bloc.add(
          const ChangeTemperatureUnitEvent(
            "c",
          ),
        );
      },
      expect: () => [
        const HomeLoading(),
        const TemperatureUnitChanged("c"),
      ],
      verify: (_) {},
    );
  });

  group('GetCurrentWeatherEvent', () {
    final tWeather = WeatherModel.empty();
    blocTest<HomeBloc, HomeState>(
      "should emit [HomeLoading, CurrentWeatherUpdated] when [GetCurrentWeatherEvent] is added and succeeds",
      build: () {
        when(() => getCurrentWeather())
            .thenAnswer((_) async => Right(tWeather));
        return homeBloc;
      },
      act: (bloc) {
        bloc.add(
          const GetCurrentWeatherEvent(),
        );
      },
      expect: () => [
        const HomeLoading(),
        CurrentWeatherUpdated(tWeather),
      ],
      verify: (_) {
        verify(() => getCurrentWeather()).called(1);
        verifyNoMoreInteractions(getCurrentWeather);
      },
    );

    blocTest<HomeBloc, HomeState>(
      "should emit [HomeLoading, HomeError] when [GetCurrentWeatherEvent] is added and fails",
      build: () {
        when(() => getCurrentWeather())
            .thenAnswer((_) async => const Left(tServerFailure));
        return homeBloc;
      },
      act: (bloc) {
        bloc.add(
          const GetCurrentWeatherEvent(),
        );
      },
      expect: () => [
        const HomeLoading(),
        HomeError(tServerFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => getCurrentWeather()).called(1);
        verifyNoMoreInteractions(getCurrentWeather);
      },
    );
  });

  group('GetDailyForecastEvent', () {
    final tWeathers = [WeatherModel.empty()];
    blocTest<HomeBloc, HomeState>(
      "should emit [HomeLoading, DailyForecastUpdated] when [GetDailyForecastEvent] is added and succeeds",
      build: () {
        when(() => getDailyForecast())
            .thenAnswer((_) async => Right(tWeathers));
        return homeBloc;
      },
      act: (bloc) {
        bloc.add(
          const GetDailyForecastEvent(),
        );
      },
      expect: () => [
        const HomeLoading(),
        DailyForecastUpdated(tWeathers),
      ],
      verify: (_) {
        verify(() => getDailyForecast()).called(1);
        verifyNoMoreInteractions(getDailyForecast);
      },
    );

    blocTest<HomeBloc, HomeState>(
      "should emit [HomeLoading, HomeError] when [GetDailyForecastEvent] is added and fails",
      build: () {
        when(() => getDailyForecast())
            .thenAnswer((_) async => const Left(tServerFailure));
        return homeBloc;
      },
      act: (bloc) {
        bloc.add(
          const GetDailyForecastEvent(),
        );
      },
      expect: () => [
        const HomeLoading(),
        HomeError(tServerFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => getDailyForecast()).called(1);
        verifyNoMoreInteractions(getDailyForecast);
      },
    );
  });

  group('GetHourlyForecastEvent', () {
    final tWeathers = [WeatherModel.empty()];
    blocTest<HomeBloc, HomeState>(
      "should emit [HomeLoading, HourlyForecastUpdated] when [GetHourlyForecastEvent] is added and succeeds",
      build: () {
        when(() => getHourlyForecast())
            .thenAnswer((_) async => Right(tWeathers));
        return homeBloc;
      },
      act: (bloc) {
        bloc.add(
          const GetHourlyForecastEvent(),
        );
      },
      expect: () => [
        const HomeLoading(),
        HourlyForecastUpdated(tWeathers),
      ],
      verify: (_) {
        verify(() => getHourlyForecast()).called(1);
        verifyNoMoreInteractions(getHourlyForecast);
      },
    );

    blocTest<HomeBloc, HomeState>(
      "should emit [HomeLoading, HomeError] when [GetHourlyForecastEvent] is added and fails",
      build: () {
        when(() => getHourlyForecast())
            .thenAnswer((_) async => const Left(tServerFailure));
        return homeBloc;
      },
      act: (bloc) {
        bloc.add(
          const GetHourlyForecastEvent(),
        );
      },
      expect: () => [
        const HomeLoading(),
        HomeError(tServerFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => getHourlyForecast()).called(1);
        verifyNoMoreInteractions(getHourlyForecast);
      },
    );
  });
}
