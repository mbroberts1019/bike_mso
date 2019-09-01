import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard({this.weatherDetails, this.onPress});

  final Widget weatherDetails;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
    );
  }
}
