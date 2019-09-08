import 'dart:convert';
import 'package:bike_mso/services/weather_interface.dart';
import 'package:http/http.dart' as http;
import 'package:bike_mso/constants/keys.dart';
import 'package:bike_mso/constants/constweather.dart';

const apikey = kOpenweatherkey;

class OpenWeatherProvider implements WeatherInterface {
  final String url = '$openWeatherMapURL?id=524901&APPID=$apikey&zip=59801';

  Future getData() async {
    http.Response responseData = await http.get(url);

    if (responseData.statusCode == 200) {
      dynamic data = responseData.body;
      //print(data);
      return data;
    } else {
      print(responseData.statusCode);
    }
  }

//
  //Future<List> decodedData(String jsonData) async {
//    var parsedJson = await jsonDecode(jsonData);
//    //print(parsedJson);
//    return parsedJson;
//  }

  Future<dynamic> loadData() async {
    var data = await getData();
    var parsedJson = jsonDecode(data);
    //double temperature = parsedJson['list'][0]['main']['temp'];
    //print(temperature);
    print('hit loadData');
    print(parsedJson);
    return parsedJson;
  }

  @override
  List<List<bool>> getFiveDays() {
    loadData();

    print(loadData());
    // make api call openweather api
    //parse Json data into usable data
    //pull out usefull pieces
    //sunny cloudy rain temperature air quality
    //create algorithm that checks data and returns true or false
    //return boolian values in a list.
    return [
      [true, false, true],
      [true, false, false],
      [true, true, false],
      [false, true, true],
      [false, false, false]
    ];
  }
  //seperate method for checking data.

//returns true or false
  bool weatherCheck(int temperature, String condition, int airquality) {}
}

//return jsonDecode(data);
//double temperature = decodedData['list'][0]['main']['temp'];
//print(temperature);
