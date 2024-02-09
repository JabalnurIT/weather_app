import 'package:weather_app/src/home/domain/entities/weather.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../repositories/home_repository.dart';

class GetHourlyForecast implements UsecaseWithoutParams<List<Weather>> {
  const GetHourlyForecast(this._repository);

  final HomeRepository _repository;

  @override
  ResultFuture<List<Weather>> call() => _repository.getHourlyForecast();
}
