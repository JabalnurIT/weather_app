import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String locationName;
  final double latitude;
  final double longitude;
  final double temperatureCelsius;
  final double temperatureFahrenheit;
  final String weatherDescription;
  final String weatherIcon;
  final DateTime date;
  final bool selectedWeather;

  const Weather({
    required this.locationName,
    required this.latitude,
    required this.longitude,
    required this.temperatureCelsius,
    required this.temperatureFahrenheit,
    required this.weatherDescription,
    required this.weatherIcon,
    required this.date,
    required this.selectedWeather,
  });

  Weather.empty()
      : locationName = '',
        latitude = 0,
        longitude = 0,
        temperatureCelsius = 6.1,
        temperatureFahrenheit = 43.0,
        weatherDescription = 'Clear',
        weatherIcon = '//cdn.weatherapi.com/weather/64x64/night/113.png',
        date = DateTime.now(),
        selectedWeather = false;

  @override
  List<Object?> get props => [
        locationName,
        latitude,
        longitude,
        temperatureCelsius,
        temperatureFahrenheit,
        weatherDescription,
        weatherIcon,
        date,
        selectedWeather,
      ];

  @override
  String toString() {
    return 'Weather{locationName: $locationName, latitude: $latitude, '
        'longitude: $longitude, temperatureCelsius: $temperatureCelsius, '
        'temperatureFahrenheit: $temperatureFahrenheit, '
        'weatherDescription: $weatherDescription, weatherIcon: $weatherIcon, '
        'date: $date, selectedWeather: $selectedWeather}';
  }
}
