import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class WeatherInterface {
  List<List<bool>> getFiveDays();
}
