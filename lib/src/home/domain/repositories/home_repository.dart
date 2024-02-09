import 'package:weather_app/src/home/domain/entities/weather.dart';

import '../../../../core/utils/typedef.dart';

abstract class HomeRepository {
  const HomeRepository();

  ResultFuture<Weather> getCurrentWeather();

  ResultFuture<List<Weather>> getDailyForecast();

  ResultFuture<List<Weather>> getHourlyForecast();
}
