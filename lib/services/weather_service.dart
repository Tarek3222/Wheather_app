import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '15af420a990f4810bb5154908242503';

  WeatherService( this.dio);

  Future<List<WeatherModel>> getCurrentWeather({required String cityName}) async {
    try {
  Response response = await dio.get(
      '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=3');

  WeatherModel weatherModelToDay=WeatherModel.fromJson(response.data,0);
  WeatherModel weatherModelSecondDay=WeatherModel.fromJson(response.data,1);
  WeatherModel weatherModelThirdDay=WeatherModel.fromJson(response.data,2);
  List<WeatherModel> weatherModelList=[weatherModelToDay,weatherModelSecondDay,weatherModelThirdDay];
  return weatherModelList;
}on DioException  catch (e) {
  final String errorMessege=e.response?.data['error']['message']?? 'oops there was an error, please try again'; // =e at found null
 throw Exception(errorMessege);
}catch(e){
  log(e.toString());// if error is not DioException 
  throw Exception('oops there was an error, please try again');
}
  }
}
