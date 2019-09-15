import 'package:flutter/material.dart';
import 'package:bike_mso/services/openweather_provider.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

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
  }

  String timeOfDay;
  final Function onPress;
  var colorChoice;
  Color pigment = Colors.black12;
  Text message;
  WeatherDocument weatherData;

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  bool goodTimeToRide(int condition) {
    return condition >= 800;
  }

  @override
  Widget build(BuildContext context) {
    var time =
        new DateTime.fromMillisecondsSinceEpoch(weatherData.dateTime * 1000)
            .toLocal();

    var format = new DateFormat.yMd().add_jm().format(time);

    bool isMidnight(timeStr) {
      return timeStr.endsWith('12:00 PM');
    }

    var tempF = ((weatherData.temperature - 273.15) * 9 / 5 + 32).round();
    var windMph = (weatherData.windSpeed * 2.237).round();

    var weatherTxt = TextStyle(
        fontSize: 24,
        color: goodTimeToRide(weatherData.weatherId)
            ? Colors.blueGrey
            : Colors.indigo);

    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                child: Center(
                  child: Text(getWeatherIcon(weatherData.weatherId),
                      style: TextStyle(fontSize: 80)),
                ),
                decoration: BoxDecoration(
                    color: pigment, borderRadius: BorderRadius.circular(75.00)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(format.toString(), style: weatherTxt),
                  Text(tempF.toString() + ' ℉', style: weatherTxt),
                  Text("Wind: $windMph MPH", style: weatherTxt),
                ],
              ),
            ],
          ),
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            color: goodTimeToRide(weatherData.weatherId)
                ? Colors.lightGreenAccent
                : Colors.deepOrange,
          ),
        ),
      ),
    );
  }
}
