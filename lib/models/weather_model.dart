class WeatherModel {
  final String? cityImage;
  final String? cityName;
  final String? date;
  final double? temp;
  final double? maxTemp;
  final double? minTemp;
  final String? weatherCondition;

  WeatherModel(
      {this.cityImage,
      this.cityName,
      this.date,
      this.maxTemp,
      this.minTemp,
      this.temp,
      this.weatherCondition});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityImage: json["forecast"]["forecastday"][0]["day"]["condition"]
            ["icon"],
        cityName: json["location"]["name"],
        date: json["current"]["last_updated"],
        temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]
            ["text"]);
  }
}
