class WeatherModel {
  final String cityName;
  final DateTime lastUpdate;
  final double temp;
  final String weatherState;
  final double minTemp;
  final double maxTemp;
  final String image;
  final DateTime date;

  WeatherModel( 
      {required this.cityName,
      required this.date,
      required this.image,
      required this.lastUpdate,
      required this.temp,
      required this.weatherState,
      required this.minTemp,
      required this.maxTemp});

  factory WeatherModel.fromJson(json,int index) {
    return WeatherModel(
        cityName: json['location']['name'],
        lastUpdate: DateTime.parse(json['current']['last_updated']),
        date: DateTime.parse(json['forecast']['forecastday'][index]['date']),
        temp: json['forecast']['forecastday'][index]['day']['avgtemp_c'],
        weatherState: json['forecast']['forecastday'][index]['day']['condition']['text'],
        minTemp: json['forecast']['forecastday'][index]['day']['mintemp_c'],
        maxTemp: json['forecast']['forecastday'][index]['day']['maxtemp_c'],
        image: json['forecast']['forecastday'][index]['day']['condition']['icon']);
  }
}
