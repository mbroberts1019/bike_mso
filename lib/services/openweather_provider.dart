import 'package:bike_mso/services/weather_interface.dart';
import 'package:bike_mso/services/location.dart';

const apikey = 'ada2337c32c1170ce60f6a0102d792fc';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class OpenWeatherProvider implements WeatherInterface {
  @override
  List<List<bool>> getFiveDays() {
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
