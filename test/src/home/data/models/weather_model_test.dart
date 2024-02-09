import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/utils/typedef.dart';
import 'package:weather_app/src/home/data/models/weather_model.dart';
import 'package:weather_app/src/home/domain/entities/weather.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tWeatherModel = WeatherModel.empty();

  test('should be a subclass of [Weather] entity',
      () => expect(tWeatherModel, isA<Weather>()));

  var tMap = jsonDecode(fixture('weather.json')) as DataMap;
  tMap['date'] = DateTime.parse(tMap['date'] as String);
  group('fromMap', () {
    test('should return a valid [WeatherModel] from the Map', () {
      final result = WeatherModel.fromMap(tMap);

      expect(result, equals(tWeatherModel));
    });

    test('should throw an Error when the map is invalid ', () {
      final map = DataMap.from(tMap)..remove('location');

      const call = WeatherModel.fromMap;

      expect(() => call(map), throwsA(isA<Error>()));
    });
  });
  group('toMap', () {
    test('should return a valid [DataMap] from the model', () {
      final result = tWeatherModel.toMap();

      expect(result, equals(tMap));
    });
  });
}
