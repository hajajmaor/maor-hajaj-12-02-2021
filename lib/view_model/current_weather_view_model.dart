import 'package:weather_app/model/current_weather.dart';

class CurrentWeatherViewModel {
  final CurrentWeather model;

  CurrentWeatherViewModel(this.model);
  CurrentWeatherViewModel.fromJson(Map jsondata)
      : this.model = CurrentWeather.fromJson(jsondata);
  CurrentWeatherViewModel.fromServer(String cityName)
      : model = CurrentWeather();
}
