import 'dart:convert';
import 'package:bike_mso/services/weather_interface.dart';
import 'package:http/http.dart' as http;
import 'package:bike_mso/constants/keys.dart';
import 'package:bike_mso/constants/constweather.dart';
import 'package:json_annotation/json_annotation.dart';

const apikey = kOpenweatherkey;

class OpenWeatherProvider {
  final String url = '$openWeatherMapURL?id=524901&APPID=$apikey&zip=59801';

  //create weather doc 1.2.3

  var currentTemp;
  var tempUpdate1;
  var tempUpdate2;
  var tempUpdate3;

  var currentHour;
  var threeHourUpdate;
  var sixHourUpdate;

  WeatherDocument weatherDoc1;
  WeatherDocument weatherDoc2;
  WeatherDocument weatherDoc3;
  WeatherDocument weatherDoc4;

  Future getData() async {
    http.Response responseData = await http.get(url);

    if (responseData.statusCode == 200) {
      String data = responseData.body;
      print(data);
      return data;
    } else {
      print(responseData.statusCode);
    }
  }

  Future<dynamic> loadData() async {
    var data = await getData();
    var parsedJson = jsonDecode(data);
    final items = (parsedJson['list'] as List)
        .map((i) => new WeatherDocument.fromJson(i));

    return items;
  }

  Future<List<WeatherDocument>> getFiveDays() async {
    var weatherList = await loadData();
    List<WeatherDocument> daysWeather = weatherList.toList();
    //print(weatherCheck(threeHourUpdate));
    return daysWeather;
  }

  //seperate method for checking data.
//returns true or false
  bool weatherCheck(data) {
    bool ride = true;

    var time = new DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000);
    //print(time);
    //print(data['weather'][0]['id']);
    if (data['weather'][0]['id'] < 800) {
      ride = false;
    } else if (data['list'][0]['main']['temp'] > 60) {
      ride = false;
    } else if (data['weather'][0]['wind'] > 10) {
      ride = false;
    }
    return ride;
  }
}

//@JsonSerializable()
class WeatherDocument {
  dynamic temperature;
  dynamic windSpeed;
  dynamic dateTime;
  dynamic weatherId;
  dynamic description;

  WeatherDocument(
      {this.temperature,
      this.windSpeed,
      this.dateTime,
      this.weatherId,
      this.description});

  WeatherDocument.fromJson(Map json) {
    this.temperature = json['main']['temp'];
    this.dateTime = json['dt'];
    this.windSpeed = json['wind']['speed'];
    this.weatherId = json['weather'][0]['id'];
    this.description = json['weather'][0]['description'];
  }
}
