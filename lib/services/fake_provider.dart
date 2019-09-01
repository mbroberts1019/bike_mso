import 'package:bike_mso/services/weather_interface.dart';
import 'package:flutter/material.dart';
import 'package:bike_mso/services/location.dart';

class FakeProvider implements WeatherInterface {
  //overall weather condition
  // 12 hour weather update
  // chance of percipitation

  List<List<bool>> getFiveDays() {
    return [
      [true, false, true],
      [true, false, false],
      [true, true, false],
      [false, true, true],
      [false, false, false]
    ];
  }
}
