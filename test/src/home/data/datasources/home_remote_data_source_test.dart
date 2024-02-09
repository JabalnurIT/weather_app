import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:weather_app/core/services/api.dart';
import 'package:weather_app/core/utils/typedef.dart';
import 'package:weather_app/src/home/data/datasources/home_remote_data_source.dart';
import 'package:weather_app/src/home/data/models/weather_model.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockDio extends Mock implements Dio {}

class MockGeolocator extends Mock implements GeolocatorPlatform {}

void main() {
  late Dio dio;
  late API api;
  late HomeRemoteDataSourceImpl dataSource;
  final tWeather = WeatherModel.empty();
  final tWeatherList = [WeatherModel.empty()];

  setUp(() {
    dio = MockDio();
    api = API();
    dataSource = HomeRemoteDataSourceImpl(
      dio: dio,
      api: api,
    );
  });

  var tMap = jsonDecode(fixture('weather_response.json')) as DataMap;

  final tLocation = Position(
    latitude: 1.0,
    longitude: 1.0,
    timestamp: DateTime.now(),
    accuracy: 1.0,
    altitude: 1.0,
    heading: 1.0,
    speed: 1.0,
    speedAccuracy: 1.0,
    altitudeAccuracy: 1.0,
    headingAccuracy: 1.0,
  );

  final tResponseFailed = Response(
    data: {
      'message': 'ServerException',
    },
    statusCode: 500,
    requestOptions: RequestOptions(path: ''),
  );
  final tResponseSuccess = Response<dynamic>(
    data: tMap,
    statusCode: 200,
    requestOptions: RequestOptions(path: ''),
  );

  const tServerException = ServerException(
    message: 'ServerException',
    statusCode: 500,
  );

  group(
    'getCurrentWeatherTest',
    () {
      test('should complete successfully when no [Exception] is thrown',
          () async {
        when(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => Future.value(tResponseSuccess));

        final result = await dataSource.getCurrentWeather(
          currentLocation: tLocation,
        );

        expect(result, equals(tWeather));

        verify(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).called(1);
        verifyNoMoreInteractions(dio);
      });

      test(
          'should throw [ServerException] when '
          '[api] give wrong response', () async {
        when(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => Future.value(tResponseFailed));

        final call = dataSource.getCurrentWeather;
        expect(
          () => call(
            currentLocation: tLocation,
          ),
          throwsA(isA<ServerException>()),
        );

        verify(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).called(1);
        verifyNoMoreInteractions(dio);
      });

      test(
          'should throw [ServerException] when '
          '[api] doesnt have response', () async {
        when(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).thenThrow(tServerException);

        final call = dataSource.getCurrentWeather;
        expect(
          () => call(
            currentLocation: tLocation,
          ),
          throwsA(isA<ServerException>()),
        );

        verify(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).called(1);
        verifyNoMoreInteractions(dio);
      });
    },
  );

  group(
    'getDailyForecastTest',
    () {
      test('should complete successfully when no [Exception] is thrown',
          () async {
        when(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => Future.value(tResponseSuccess));

        final result = await dataSource.getDailyForecast(
          currentLocation: tLocation,
        );

        expect(result, equals(tWeatherList));

        verify(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).called(1);
        verifyNoMoreInteractions(dio);
      });

      test(
          'should throw [ServerException] when '
          '[api] give wrong response', () async {
        when(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => Future.value(tResponseFailed));

        final call = dataSource.getDailyForecast;
        expect(
          () => call(
            currentLocation: tLocation,
          ),
          throwsA(isA<ServerException>()),
        );

        verify(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).called(1);
        verifyNoMoreInteractions(dio);
      });

      test(
          'should throw [ServerException] when '
          '[api] doesnt have response', () async {
        when(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).thenThrow(tServerException);

        final call = dataSource.getDailyForecast;
        expect(
          () => call(
            currentLocation: tLocation,
          ),
          throwsA(isA<ServerException>()),
        );

        verify(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).called(1);
        verifyNoMoreInteractions(dio);
      });
    },
  );

  group(
    'getHourlyForecastTest',
    () {
      test('should complete successfully when no [Exception] is thrown',
          () async {
        when(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => Future.value(tResponseSuccess));

        final result = await dataSource.getHourlyForecast(
          currentLocation: tLocation,
        );

        expect(result, equals(tWeatherList));

        verify(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).called(1);
        verifyNoMoreInteractions(dio);
      });

      test(
          'should throw [ServerException] when '
          '[api] give wrong response', () async {
        when(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => Future.value(tResponseFailed));

        final call = dataSource.getHourlyForecast;
        expect(
          () => call(
            currentLocation: tLocation,
          ),
          throwsA(isA<ServerException>()),
        );

        verify(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).called(1);
        verifyNoMoreInteractions(dio);
      });

      test(
          'should throw [ServerException] when '
          '[api] doesnt have response', () async {
        when(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).thenThrow(tServerException);

        final call = dataSource.getHourlyForecast;
        expect(
          () => call(
            currentLocation: tLocation,
          ),
          throwsA(isA<ServerException>()),
        );

        verify(
          () => dio.get(
            any(),
            options: any(named: 'options'),
          ),
        ).called(1);
        verifyNoMoreInteractions(dio);
      });
    },
  );
}
