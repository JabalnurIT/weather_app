import 'package:dartz/dartz.dart';
import 'package:weather_app/src/home/data/datasources/home_local_data_source.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';
import '../models/weather_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final HomeRemoteDataSource _remoteDataSource;

  final HomeLocalDataSource _localDataSource;

  @override
  ResultFuture<WeatherModel> getCurrentWeather() async {
    try {
      final location = await _localDataSource.getCurrentLocation();
      final result = await _remoteDataSource.getCurrentWeather(
        currentLocation: location,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<WeatherModel>> getDailyForecast() async {
    try {
      final location = await _localDataSource.getCurrentLocation();
      final result = await _remoteDataSource.getDailyForecast(
        currentLocation: location,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<WeatherModel>> getHourlyForecast() async {
    try {
      final location = await _localDataSource.getCurrentLocation();
      final result = await _remoteDataSource.getHourlyForecast(
        currentLocation: location,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
