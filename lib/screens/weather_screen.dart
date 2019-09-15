import 'package:bike_mso/services/openweather_provider.dart';
import 'package:bike_mso/services/weather_interface.dart';
import 'package:flutter/material.dart';
import 'package:bike_mso/components/weather_card.dart';
import 'package:bike_mso/services/fake_provider.dart';

class WeatherScreenState extends StatefulWidget {
  final weather = OpenWeatherProvider();
  List<bool> daysWeather;

  @override
  _WeatherScreenStateState createState() => _WeatherScreenStateState();
}

class _WeatherScreenStateState extends State<WeatherScreenState> {
  Widget buildRow(List<bool> daiyOverView) {
    String morning;
    if (daiyOverView[0]) {
      morning = 'thumb_up';
    } else {
      morning = 'thumb_down';
    }

    String afterNoon;
    if (daiyOverView[1]) {
      afterNoon = 'thumb_up';
    } else {
      afterNoon = 'thumb_down';
    }

    String evening;
    if (daiyOverView[2]) {
      evening = 'thumb_up';
    } else {
      evening = 'thumb_down';
    }

    return Container(
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          WeatherCard(
            timeOfDay: morning,
          ),
          WeatherCard(
            timeOfDay: afterNoon,
          ),
          WeatherCard(
            timeOfDay: evening,
          ),
        ],
      ),
    );
  }

  Future<List<bool>> getWeather() async {
    return await widget.weather.getFiveDays();
  }

  @override
  Widget build(BuildContext context) {
    getWeather();
    return Scaffold(
      appBar: AppBar(
        title: Text('Up Coming Biking Weather'),
      ),
      body: FutureBuilder(
        future: getWeather(),
        builder: (BuildContext context, AsyncSnapshot<List<bool>> snapshot) {
          if (snapshot.hasData) {
            {
              return buildRow(snapshot.data);
            }
          } else {
            return buildRow([false, false, false]);
          }
        },
      ),
    );
  }
}
