import 'package:bike_mso/services/weather_interface.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:bike_mso/services/fake_provider.dart';

class WeatherScreenState extends StatefulWidget {
  final WeatherInterface weather = FakeProvider();

  @override
  _WeatherScreenStateState createState() => _WeatherScreenStateState();
}

class _WeatherScreenStateState extends State<WeatherScreenState> {
  Widget buildRow(List<bool> daiyOverView) {
    Icon morning;
    if (daiyOverView[0]) {
      morning = Icon(Icons.thumb_up);
    } else {
      morning = Icon(Icons.thumb_down);
    }

    Icon afterNoon;
    if (daiyOverView[1]) {
      afterNoon = Icon(Icons.thumb_up);
    } else {
      afterNoon = Icon(Icons.thumb_down);
    }

    Icon evening;
    if (daiyOverView[2]) {
      evening = Icon(Icons.thumb_up);
    } else {
      evening = Icon(Icons.thumb_down);
    }

    return Container(
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: morning,
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              color: Colors.red,
            ),
          ),
          Container(
            child: afterNoon,
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              color: Colors.yellow,
            ),
          ),
          Container(
            child: evening,
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Up Coming Biking Weather'),
      ),
      body: ListView(
          //padding: EdgeInsets.all(15.0),
          children: widget.weather.getFiveDays().map(buildRow).toList()),
    );
  }
}
