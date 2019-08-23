// this will be our route screen, it will contain information on each route and the map of said route
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:bike_mso/components/map_display.dart';

class RouteScreen extends StatefulWidget {
  RouteScreen(this.encodedPolyList);

  final List<PointLatLng> encodedPolyList;

  @override
  _RouteScreenState createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route Title'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: MapDisplay(),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
