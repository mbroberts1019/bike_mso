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

  bool firstbool;
  bool secondbool;
  bool thirdbool;

  Future getData() async {
    http.Response responseData = await http.get(url);

    if (responseData.statusCode == 200) {
      String data = responseData.body;
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
    for (final item in items) {
      print(item);
    }

//    List<WeatherDocument> weatherDocuments =
//        parsedJson['list'].map((Map model) => WeatherDocument.fromJson(model));

    //print(weatherDocuments);
    //print('running');

    currentTemp = parsedJson['list'][0]['main']['temp'];
    tempUpdate1 = parsedJson['list'][1]['main']['temp'];
    tempUpdate2 = parsedJson['list'][2]['main']['temp'];
    tempUpdate3 = parsedJson['list'][3]['main']['temp'];

    currentHour = parsedJson['list'][0];
    threeHourUpdate = parsedJson['list'][1];
    sixHourUpdate = parsedJson['list'][2];

    return parsedJson;
  }

  Future<List<bool>> getFiveDays() async {
    await loadData();

    bool firstbool = currentTemp < 60 ? true : false;
    bool secondbool = tempUpdate2 > 70 ? true : false;
    bool thirdbool = tempUpdate3 > 70 ? true : false;

    List<bool> daysWeather = [firstbool, secondbool, thirdbool];
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
    //this.weatherId = json['weather']['id'];
    //this.description = json['weather']['description'];
  }
}
