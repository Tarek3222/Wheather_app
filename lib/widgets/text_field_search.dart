import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onSubmitted: (value) async{
         var getWeatherCubit=BlocProvider.of<GetWeatherCubit>(context);
         getWeatherCubit.getCurrentWeather(cityName: value);
        Navigator.pop(context);  
        },
        decoration:  InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 16,
          ),
          labelText: 'search',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          hintText: 'Enter City Name',
          suffixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
          border:const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
