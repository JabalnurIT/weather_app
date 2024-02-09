import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/src/home/domain/entities/weather.dart';
import 'package:weather_app/src/home/domain/repositories/home_repository.dart';
import 'package:weather_app/src/home/domain/usecases/get_daily_forecast.dart';

import 'home_repository.mock.dart';

void main() {
  late HomeRepository repository;
  late GetDailyForecast usecase;

  setUp(() {
    repository = MockHomeRepo();
    usecase = GetDailyForecast(repository);
  });

  final tWeathers = List.generate(10, (index) => const Weather.empty());

  test(
    'should call the [HomeRepo.getDailyForecast]',
    () async {
      when(
        () => repository.getDailyForecast(),
      ).thenAnswer(
        (_) async => Right(tWeathers),
      );

      final result = await usecase();

      expect(result, equals(Right<dynamic, List<Weather>>(tWeathers)));

      verify(() => repository.getDailyForecast()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
