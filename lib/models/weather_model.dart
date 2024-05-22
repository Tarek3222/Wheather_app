class WeatherModel {
  final String cityName;
  final DateTime lastUpdate;
  final double temp;
  final String weatherState;
  final double minTemp;
  final double maxTemp;
  final String image;

  WeatherModel(
      {required this.cityName,
      required this.image,
      required this.lastUpdate,
      required this.temp,
      required this.weatherState,
      required this.minTemp,
      required this.maxTemp});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        lastUpdate: DateTime.parse(json['current']['last_updated']),
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        weatherState: json['forecast']['forecastday'][0]['day']['condition']['text'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon']);
  }
}
