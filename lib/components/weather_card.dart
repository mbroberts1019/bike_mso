import 'package:flutter/material.dart';
import 'package:bike_mso/services/openweather_provider.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard({
    this.onPress,
    this.weatherData,
  }) {
    bool goRide(weatherData) {
      if (weatherData.temp > 50) {
        return true;
      } else {
        return false;
      }
    }

    if (timeOfDay == 'thumbs_up') {
      pigment = Colors.green;
      icon = Icon(Icons.thumb_up, color: Colors.black54, size: 40);

      message = Text('Optimal riding weather');
    } else {
      pigment = Colors.red;
      icon = Icon(Icons.thumbs_up_down, color: Colors.black54, size: 40);
      message = Text('Ride at you discretion');
    }
  }

  String timeOfDay;
  final Function onPress;
  var colorChoice;
  Icon icon;
  Color pigment;
  Text message;
  WeatherDocument weatherData;

  @override
  Widget build(BuildContext context) {
    var time =
        new DateTime.fromMillisecondsSinceEpoch(weatherData.dateTime * 1000);
    var tempF = ((weatherData.temperature - 273.15) * 9 / 5 + 32).round();

    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 60,
                width: 60,
                child: icon,
                decoration: BoxDecoration(color: pigment),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(time.toString()),
                  Text(tempF.toString()),
                  Text(weatherData.weatherId.toString()),
                  message,
                ],
              ),
            ],
          ),
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            color: Colors.purpleAccent,
          ),
        ),
      ),
    );
  }
}
