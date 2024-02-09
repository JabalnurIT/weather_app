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

  const Weather({
    required this.locationName,
    required this.latitude,
    required this.longitude,
    required this.temperatureCelsius,
    required this.temperatureFahrenheit,
    required this.weatherDescription,
    required this.weatherIcon,
    required this.date,
  });

  Weather.empty()
      : locationName = '',
        latitude = 0,
        longitude = 0,
        temperatureCelsius = 0,
        temperatureFahrenheit = 0,
        weatherDescription = '',
        weatherIcon = '',
        date = DateTime.now();

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
      ];

  @override
  String toString() {
    return 'Weather{locationName: $locationName, latitude: $latitude, '
        'longitude: $longitude, temperatureCelsius: $temperatureCelsius, '
        'temperatureFahrenheit: $temperatureFahrenheit, '
        'weatherDescription: $weatherDescription, weatherIcon: $weatherIcon, '
        'date: $date}';
  }
}
