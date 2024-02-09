import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/typedef.dart';

class WeatherHelper {
  static DataMap extractCurrentWeather(DataMap? map) {
    if (map == null) {
      throw const ServerException(
          message: "Response data is null", statusCode: 505);
    }

    final location = map['location'] as DataMap?;
    final current = map['current'] as DataMap?;
    if (location == null ||
        current == null ||
        current['temp_c'] == null ||
        current['temp_f'] == null ||
        current['condition'] == null ||
        current['condition']['text'] == null ||
        current['condition']['icon'] == null ||
        current['last_updated'] == null) {
      throw const ServerException(
          message: "Missing required columns from response", statusCode: 505);
    }

    return {
      'location': location['name'],
      'latitude': location['lat'],
      'longitude': location['lon'],
      'temperature_celsius': current['temp_c'],
      'temperature_fahrenheit': current['temp_f'],
      'weather_description': current['condition']['text'],
      'weather_icon': current['condition']['icon'],
      'date': DateTime.parse(current['last_updated']),
      'selected_weather': false,
    };
  }

  static List<DataMap> extractDailyForecast(DataMap? map) {
    final date = DateTime.now();
    if (map == null) {
      throw const ServerException(
          message: "Response data is null", statusCode: 505);
    }

    final location = map['location'] as DataMap?;
    final forecast = map['forecast'] as DataMap?;

    if (location == null || forecast == null) {
      throw const ServerException(
          message: "Missing required columns from response", statusCode: 505);
    }

    final forecastDay = forecast['forecastday'] as List?;

    if (forecastDay == null || forecastDay.isEmpty) {
      throw const ServerException(
          message: "Missing required columns from response", statusCode: 505);
    }

    for (var day in forecastDay) {
      if (day['date'] == null ||
          day['day'] == null ||
          day['day']['avgtemp_c'] == null ||
          day['day']['avgtemp_f'] == null ||
          day['day']['condition'] == null ||
          day['day']['condition']['text'] == null ||
          day['day']['condition']['icon'] == null) {
        throw const ServerException(
            message: "Missing required columns from response", statusCode: 505);
      }
    }

    return forecastDay
        .map<DataMap>((e) => {
              'location': location['name'],
              'latitude': location['lat'],
              'longitude': location['lon'],
              'temperature_celsius': e['day']['avgtemp_c'],
              'temperature_fahrenheit': e['day']['avgtemp_f'],
              'weather_description': e['day']['condition']['text'],
              'weather_icon': e['day']['condition']['icon'],
              'date': DateTime.parse(e['date']),
              'selected_weather': date.day == DateTime.parse(e['date']).day
            })
        .toList();
  }

  static List<DataMap> extractHourlyForecast(DataMap? map) {
    final date = DateTime.now();
    if (map == null) {
      throw const ServerException(
          message: "Response data is null", statusCode: 505);
    }

    final location = map['location'] as DataMap?;
    final forecast = map['forecast'] as DataMap?;

    if (location == null || forecast == null) {
      throw const ServerException(
          message: "Missing required columns from response", statusCode: 505);
    }

    final forecastDay = forecast['forecastday'] as List?;

    if (forecastDay == null || forecastDay.isEmpty) {
      throw const ServerException(
          message: "Missing required columns from response", statusCode: 505);
    }

    final forecastHour = forecastDay[0]['hour'] as List?;

    if (forecastHour == null || forecastHour.isEmpty) {
      throw const ServerException(
          message: "Missing required columns from response", statusCode: 505);
    }

    for (var hour in forecastHour) {
      if (hour['time'] == null ||
          hour['temp_c'] == null ||
          hour['temp_f'] == null ||
          hour['condition'] == null ||
          hour['condition']['text'] == null ||
          hour['condition']['icon'] == null) {
        throw const ServerException(
            message: "Missing required columns from response", statusCode: 505);
      }
    }
    return forecastHour
        .map<DataMap>((e) => {
              'location': location['name'],
              'latitude': location['lat'],
              'longitude': location['lon'],
              'temperature_celsius': e['temp_c'],
              'temperature_fahrenheit': e['temp_f'],
              'weather_description': e['condition']['text'],
              'weather_icon': e['condition']['icon'],
              'date': DateTime.parse(e['time']),
              'selected_weather': date.hour == DateTime.parse(e['time']).hour
            })
        .toList();
  }
}
