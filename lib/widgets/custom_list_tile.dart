import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.title,
      required this.maxTemp,
      required this.image, required this.minTemp});

  final String title;
  final double maxTemp;
  final double minTemp;
  final String image;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        image.contains('https:') ? image : 'https:$image',
        width: 45,
        height: 50,
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.cloud),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      trailing: Text(
        "${maxTemp.round()}° ${minTemp.round()}°",
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
