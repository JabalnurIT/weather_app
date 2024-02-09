import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/utils/constanst.dart';
import 'package:weather_app/src/home/data/helper/weather_helper.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/api.dart';
import '../../../../core/utils/headers.dart';
import '../models/weather_model.dart';

abstract class HomeRemoteDataSource {
  const HomeRemoteDataSource();

  Future<WeatherModel> getCurrentWeather({
    required Position currentLocation,
  });
  Future<List<WeatherModel>> getDailyForecast({
    required Position currentLocation,
  });
  Future<List<WeatherModel>> getHourlyForecast({
    required Position currentLocation,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  const HomeRemoteDataSourceImpl({
    required Dio dio,
    required API api,
  })  : _dio = dio,
        _api = api;

  final Dio _dio;
  final API _api;

  @override
  Future<WeatherModel> getCurrentWeather({
    required Position currentLocation,
  }) async {
    try {
      final String latlong =
          "${currentLocation.latitude},${currentLocation.longitude}";
      final result = await _dio.get(
        "${_api.weather.currentWeather}?key=$kApiKey&q=$latlong&aqi=no",
        options: Options(
          headers: ApiHeaders.getHeaders().headers,
          validateStatus: (status) {
            return true;
          },
        ),
      );

      final weather = WeatherHelper.extractCurrentWeather(result.data);

      return WeatherModel.fromMap(weather);
    } on DioException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<WeatherModel>> getDailyForecast({
    required Position currentLocation,
  }) async {
    try {
      final String latlong =
          "${currentLocation.latitude},${currentLocation.longitude}";
      final result = await _dio.get(
        "${_api.weather.forecastWeather}?key=$kApiKey&q=$latlong&days=10&aqi=no&alerts=no",
        options: Options(
          headers: ApiHeaders.getHeaders().headers,
          validateStatus: (status) {
            return true;
          },
        ),
      );

      final weathers = WeatherHelper.extractDailyForecast(result.data);

      return weathers.map((e) => WeatherModel.fromMap(e)).toList();
    } on DioException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<WeatherModel>> getHourlyForecast({
    required Position currentLocation,
  }) async {
    try {
      final String latlong =
          "${currentLocation.latitude},${currentLocation.longitude}";
      final result = await _dio.get(
        "${_api.weather.forecastWeather}?key=$kApiKey&q=$latlong&days=1&aqi=no&alerts=no",
        options: Options(
          headers: ApiHeaders.getHeaders().headers,
          validateStatus: (status) {
            return true;
          },
        ),
      );

      final weathers = WeatherHelper.extractHourlyForecast(result.data);

      return weathers.map((e) => WeatherModel.fromMap(e)).toList();
    } on DioException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }
}
