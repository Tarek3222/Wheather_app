import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/custom_list_tile.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModelList});

  final List<WeatherModel> weatherModelList;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              getThemeColor(weatherModelList[0].weatherState),
              getThemeColor(weatherModelList[0].weatherState)[400]!,
              getThemeColor(weatherModelList[0].weatherState)[300]!,
              getThemeColor(weatherModelList[0].weatherState)[200]!,
              getThemeColor(weatherModelList[0].weatherState)[100]!,
              getThemeColor(weatherModelList[0].weatherState)[50]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                weatherModelList[0].cityName,
                style:const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
               Text(
                'updated at ${weatherModelList[0].lastUpdate.hour}:${weatherModelList[0].lastUpdate.minute}',
                style:const TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    weatherModelList[0].image.contains('https:')?
                    weatherModelList[0].image:'https:${weatherModelList[0].image}',
                    width: 90,
                    height: 90,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                  ),
                    Text(
                    '${weatherModelList[0].temp.round()}°',
                    style:const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                   Column(
                    children: [
                      Text(
                        'Maxtemp: ${weatherModelList[0].maxTemp.round()}°',
                        style:const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                       Text(
                        'Mintemp: ${weatherModelList[0].minTemp.round()}°',
                        style:const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
               Text(
                weatherModelList[0].weatherState,
                style:const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
               Container(
                  width: 300,
                  height: 200,
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView.builder(
                    itemCount: weatherModelList.length,
                    itemBuilder: (context, index) {
                      return CustomListTile(image: weatherModelList[index].image,title: Jiffy.parse(weatherModelList[index].date.toString()).EEEE, maxTemp: weatherModelList[index].maxTemp, minTemp: weatherModelList[index].minTemp,);
                    }
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
