import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class ListConverter {
  ListConverter(this.polyDecodedList);

  final List<PointLatLng> polyDecodedList;

  List<LatLng> polyCoordinates = [];

  List mapCoords() {
    //print(polyDecodedList);

    var coordsMap =
        polyDecodedList.map((point) => LatLng(point.latitude, point.longitude));

    polyCoordinates = coordsMap.toList();

    //print(polyCoordinates);

    return polyCoordinates;
  }
}
