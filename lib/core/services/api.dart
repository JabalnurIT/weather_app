import '../utils/constanst.dart';

class API {
  final APIWeather weather;

  API() : weather = const APIWeather();

  String get baseUrl => kBaseUrl;
}

class APIWeather {
  const APIWeather();

  String get currentWeather => "$kHost/current.json";
  String get forecastWeather => "$kHost/forecast.json";
}
