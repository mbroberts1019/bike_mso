import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard({
    this.timeOfDay,
    this.onPress,
    this.colorChoice,
    this.message,
    //this.weatherData,
  }) {
    if (timeOfDay == 'thumbs_up') {
      icon = Icon(Icons.thumb_up);
      pigment = Colors.green;
      message = Text('Optimal riding weather');
    } else {
      icon = Icon(Icons.thumbs_up_down);
      pigment = Colors.red;
      message = Text('Ride at you discretion');
    }
  }

  final String timeOfDay;
  final Function onPress;
  var colorChoice;
  Icon icon;
  Color pigment;
  Text message;
  //WeatherDocument weatherData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Column(
          children: <Widget>[icon, message],
        ),
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          color: pigment,
        ),
      ),
    );
  }
}
