import '../../../../core/utils/typedef.dart';
import '../../domain/entities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    required super.locationName,
    required super.latitude,
    required super.longitude,
    required super.temperatureCelsius,
    required super.temperatureFahrenheit,
    required super.weatherDescription,
    required super.weatherIcon,
    required super.date,
    required super.selectedWeather,
  });

  WeatherModel.empty()
      : this(
          locationName: '',
          latitude: 0,
          longitude: 0,
          temperatureCelsius: 0,
          temperatureFahrenheit: 0,
          weatherDescription: '',
          weatherIcon: '',
          date: DateTime.now(),
          selectedWeather: false,
        );

  WeatherModel copyWith({
    String? locationName,
    double? latitude,
    double? longitude,
    double? temperatureCelsius,
    double? temperatureFahrenheit,
    String? weatherDescription,
    String? weatherIcon,
    DateTime? date,
    bool? selectedWeather,
  }) {
    return WeatherModel(
      locationName: locationName ?? super.locationName,
      latitude: latitude ?? super.latitude,
      longitude: longitude ?? super.longitude,
      temperatureCelsius: temperatureCelsius ?? super.temperatureCelsius,
      temperatureFahrenheit:
          temperatureFahrenheit ?? super.temperatureFahrenheit,
      weatherDescription: weatherDescription ?? super.weatherDescription,
      weatherIcon: weatherIcon ?? super.weatherIcon,
      date: date ?? super.date,
      selectedWeather: selectedWeather ?? super.selectedWeather,
    );
  }

  WeatherModel.fromMap(DataMap map)
      : super(
          locationName: map['location'],
          latitude: map['latitude'],
          longitude: map['longitude'],
          temperatureCelsius: map['temperature_celsius'],
          temperatureFahrenheit: map['temperature_fahrenheit'],
          weatherDescription: map['weather_description'],
          weatherIcon: map['weather_icon'],
          date: map['date'],
          selectedWeather: map['selected_weather'],
        );

  DataMap toMap() {
    return {
      'location': super.locationName,
      'latitude': super.latitude,
      'longitude': super.longitude,
      'temperature_celsius': super.temperatureCelsius,
      'temperature_fahrenheit': super.temperatureFahrenheit,
      'weather_description': super.weatherDescription,
      'weather_icon': super.weatherIcon,
      'date': super.date,
      'selected_weather': super.selectedWeather,
    };
  }

  factory WeatherModel.fromEntity(Weather entity) {
    return WeatherModel(
      locationName: entity.locationName,
      latitude: entity.latitude,
      longitude: entity.longitude,
      temperatureCelsius: entity.temperatureCelsius,
      temperatureFahrenheit: entity.temperatureFahrenheit,
      weatherDescription: entity.weatherDescription,
      weatherIcon: entity.weatherIcon,
      date: entity.date,
      selectedWeather: entity.selectedWeather,
    );
  }
}
