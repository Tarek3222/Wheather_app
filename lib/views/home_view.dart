import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

import '../cubits/get_weather_cubit/get_weather_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // backgroundColor: Colors.blue[400],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchView()));
            },
            icon: const Icon(
              Icons.search,
              size: 30,
              fill: 0.9,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder:(context, state) {
          if(state is WeatherInitialState){
            return const NoWeatherBody();
          } else if(state is WeatherLoadedState){
            return  WeatherInfoBody(
              weatherModelList: state.weatherModel,
            );
          }else if(state is WeatherLoadingState){
            return const Center(child: CircularProgressIndicator());
          }
          else{
            return const Center(child: Text('Something went wrong, try again later'));
          }
        } ,
        ),
    );
  }
}


// StateManagement   Cubit as a Statemanagement

// create state 
//create cubit
//creat function
//provide cubit
//integrate cubit in state management
