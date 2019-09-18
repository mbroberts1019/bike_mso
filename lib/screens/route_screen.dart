// this will be our route screen, it will contain information on each route and the map of said route
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:bike_mso/components/map_display.dart';
import 'package:bike_mso/components/infoWidget.dart';

class RouteScreen extends StatefulWidget {
  RouteScreen(this.route);

  final RouteDocument route;

  @override
  _RouteScreenState createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  RouteDocument route;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.route.routeName),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.blueGrey,
                      width: 3.0,
                    )),
                height: height * 0.35,
                child: MapDisplay(
                    widget.route.encodedString,
                    widget.route.markers,
                    widget.route.mapCenter,
                    widget.route.mapZoom),
              ),
            ),
            Container(
              height: height * 0.45,
              //color: Colors.white10,
              child: ListView(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.deepPurpleAccent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(4.0, 4.0),
                          )
                        ],
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 8.0,
                        ),
                      ),
                      child: InfoWidget(
                        title: 'Description',
                        body: widget.route.description,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.lightBlueAccent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(4.0, 4.0),
                          )
                        ],
                        border: Border.all(
                          color: Colors.blue,
                          width: 8.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InfoWidget(
                          title: 'Directions',
                          body: widget.route.directions,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.orange,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(4.0, 4.0),
                          )
                        ],
                        border: Border.all(
                          color: Colors.deepOrangeAccent,
                          width: 8.0,
                        ),
                      ),
                      child: InfoWidget(
                        title: 'Attractions',
                        body:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class being passed to MapScreen that holds all key/values from database

class RouteDocument {
  RouteDocument(
      this.description,
      this.directions,
      this.image,
      this.markers,
      this.encodedString,
      this.routeName,
      this.shortDescription,
      this.distance,
      this.mapCenter,
      this.mapZoom);

  dynamic description;
  dynamic directions;
  dynamic image;
  dynamic markers;
  dynamic encodedString;
  dynamic routeName;
  dynamic shortDescription;
  dynamic distance;
  dynamic mapCenter;
  dynamic mapZoom;
}
