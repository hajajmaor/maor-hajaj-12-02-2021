class CurrentWeather {
  final String weatherText, linkToWatch;
  final int weatherIcon;
  final double currentTemperature;

  const CurrentWeather(
      {this.weatherIcon,
      this.weatherText,
      this.linkToWatch,
      this.currentTemperature});
  CurrentWeather.fromJson(Map jsondata)
      : weatherIcon = jsondata["WeatherIcon"],
        weatherText = jsondata["WeatherText"],
        linkToWatch = jsondata["MobileLink"],
        currentTemperature = jsondata["Temperature"]['Metric']['Value'];
}
