import 'package:bike_mso/services/openweather_provider.dart';
import 'package:bike_mso/services/weather_interface.dart';
import 'package:flutter/material.dart';
import 'package:bike_mso/components/weather_card.dart';
import 'package:bike_mso/services/fake_provider.dart';
import 'package:intl/intl.dart';

class WeatherScreenState extends StatefulWidget {
  final weather = OpenWeatherProvider();
  List<bool> daysWeather;

  @override
  _WeatherScreenStateState createState() => _WeatherScreenStateState();
}

class _WeatherScreenStateState extends State<WeatherScreenState> {
  Future<List<WeatherDocument>> getWeather() async {
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
        builder: (BuildContext context,
            AsyncSnapshot<List<WeatherDocument>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                WeatherDocument document = snapshot.data[index];
                var time = new DateTime.fromMillisecondsSinceEpoch(
                        document.dateTime * 1000)
                    .toLocal();

                var format = new DateFormat.yMd().add_jm().format(time);

                var dayOfWeek = new DateFormat().add_EEEE().format(time);

                bool isMidnight(timeStr) {
                  return timeStr.endsWith('12:00 AM');
                }

                return Column(
                  children: <Widget>[
                    if (isMidnight(format))
                      Text(dayOfWeek, style: TextStyle(fontSize: 25)),
                    WeatherCard(weatherData: document),
                  ],
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
