import 'package:weather_app/src/home/domain/entities/weather.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../repositories/home_repository.dart';

class GetCurrentWeather implements UsecaseWithoutParams<Weather> {
  const GetCurrentWeather(this._repository);

  final HomeRepository _repository;

  @override
  ResultFuture<Weather> call() => _repository.getCurrentWeather();
}
