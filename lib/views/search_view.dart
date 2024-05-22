import 'package:flutter/material.dart';
import 'package:weather_app/widgets/text_field_search.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Search a City',style: TextStyle(
          fontWeight: FontWeight.bold
          ),
          ),
        backgroundColor:Theme.of(context).primaryColor,
      ),
      body:const Center(
        child: TextFieldSearch(),
      ),
    );
  }
}

