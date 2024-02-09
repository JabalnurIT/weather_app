import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/src/home/presentation/bloc/home_bloc.dart';

import '../../src/home/data/datasources/home_remote_data_source.dart';
import '../../src/home/data/repositories/home_repository_impl.dart';
import '../../src/home/domain/repositories/home_repository.dart';
import '../../src/home/domain/usecases/get_current_weather.dart';
import '../../src/home/domain/usecases/get_daily_forecast.dart';
import '../../src/home/domain/usecases/get_hourly_forecast.dart';
import '../services/api.dart';

part 'injection_container.main.dart';
