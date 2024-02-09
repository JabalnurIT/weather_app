import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/src/home/domain/entities/weather.dart';
import 'package:weather_app/src/home/domain/repositories/home_repository.dart';
import 'package:weather_app/src/home/domain/usecases/get_current_weather.dart';

import 'home_repository.mock.dart';

void main() {
  late HomeRepository repository;
  late GetCurrentWeather usecase;

  setUp(() {
    repository = MockHomeRepo();
    usecase = GetCurrentWeather(repository);
  });

  const tWeather = Weather.empty();

  test(
    'should call the [HomeRepo.getCurrentWeather]',
    () async {
      when(
        () => repository.getCurrentWeather(),
      ).thenAnswer(
        (_) async => const Right(tWeather),
      );

      final result = await usecase();

      expect(result, equals(const Right<dynamic, Weather>(tWeather)));

      verify(() => repository.getCurrentWeather()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
