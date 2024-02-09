import 'package:flutter/cupertino.dart';

import '../../../../src/home/domain/entities/weather.dart';

class WeatherProvider extends ChangeNotifier {
  String _selectedForecast = 'Hourly';

  String get selectedForecast => _selectedForecast;

  void initSelectedForecast(String selectedForecast) {
    if (_selectedForecast != selectedForecast) {
      _selectedForecast = selectedForecast;
      notifyListeners();
    }
  }

  int _selectedTemperatureIndex = 0;

  int get selectedTemperatureIndex => _selectedTemperatureIndex;

  void initSelectedTemperatureIndex(int selectedTemperatureIndex) {
    if (_selectedTemperatureIndex != selectedTemperatureIndex) {
      _selectedTemperatureIndex = selectedTemperatureIndex;
      notifyListeners();
    }
  }

  int _selectedForecaseIndex = 0;

  int get selectedForecaseIndex => _selectedForecaseIndex;

  void initSelectedForecaseIndex(int selectedForecaseIndex) {
    // if (_selectedForecaseIndex != selectedForecaseIndex) {
    _selectedForecaseIndex = selectedForecaseIndex;
    notifyListeners();
    // }
  }

  Weather _currentWeather = const Weather.empty();

  Weather get currentWeather => _currentWeather;

  void initCurrentWeather(Weather currentWeather) {
    if (_currentWeather != currentWeather) {
      _currentWeather = currentWeather;
      notifyListeners();
    }
  }

  List<Weather> _hourlyForecast = [];

  List<Weather> get hourlyForecast => _hourlyForecast;

  void initHourlyForecast(List<Weather> hourlyForecast) {
    if (_hourlyForecast != hourlyForecast) {
      _hourlyForecast = hourlyForecast;

      for (int i = 0; i < hourlyForecast.length; i++) {
        if (hourlyForecast[i].selectedWeather) {
          initSelectedForecaseIndex(i);
        }
      }
      notifyListeners();
    }
  }

  List<Weather> _dailyForecast = [];

  List<Weather> get dailyForecast => _dailyForecast;

  void initDailyForecast(List<Weather> dailyForecast) {
    if (_dailyForecast != dailyForecast) {
      _dailyForecast = dailyForecast;

      for (int i = 0; i < dailyForecast.length; i++) {
        if (dailyForecast[i].selectedWeather) {
          initSelectedForecaseIndex(i);
        }
      }
      notifyListeners();
    }
  }
}
