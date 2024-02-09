import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/src/home/domain/entities/weather.dart';
import 'package:weather_app/src/home/domain/repositories/home_repository.dart';
import 'package:weather_app/src/home/domain/usecases/get_hourly_forecast.dart';

import 'home_repository.mock.dart';

void main() {
  late HomeRepository repository;
  late GetHourlyForecast usecase;

  setUp(() {
    repository = MockHomeRepo();
    usecase = GetHourlyForecast(repository);
  });

  final tWeathers = List.generate(10, (index) => const Weather.empty());

  test(
    'should call the [HomeRepo.getHourlyForecast]',
    () async {
      when(
        () => repository.getHourlyForecast(),
      ).thenAnswer(
        (_) async => Right(tWeathers),
      );

      final result = await usecase();

      expect(result, equals(Right<dynamic, List<Weather>>(tWeathers)));

      verify(() => repository.getHourlyForecast()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
