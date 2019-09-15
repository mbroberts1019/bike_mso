import 'package:flutter/material.dart';
import 'package:bike_mso/components/routeChoiceContainer.dart';
import 'package:bike_mso/constants/polylines.dart';
import 'package:bike_mso/screens/route_screen.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:http/http.dart';
//import 'package:loadmore/loadmore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RideChoiceScreen extends StatefulWidget {
  @override
  _RideChoiceScreenState createState() => _RideChoiceScreenState();
}

class Routes {
  String routeName;
  String image;
  String polyline;
  String description;

  Routes.fromJson(var value) {
    this.routeName = value['routeName'];
    this.image = value['image'];
    this.description = value['description'];
    this.polyline = value['polyline'];
  }
}

class _RideChoiceScreenState extends State<RideChoiceScreen> {
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go Ride Bikes!!'),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('routes').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return new Center(child: CircularProgressIndicator());
              if (snapshot.hasData) {
                return ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    // mapping document to RouteDocument to then pass all key/values to map_screen

                    RouteDocument route = new RouteDocument(
                      document['description'],
                      document['directions'],
                      document['image'],
                      document['markers'],
                      document['polyline'],
                      document['routeName'],
                      document['shortDescription'],
                      document['distance'],
                      document['mapCenter'],
                      document['mapZoom'],
                    );

                    return RouteChoiceContainer(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RouteScreen(
                                route,
                              );
                            },
                          ),
                        );
                      },
                      bgImageUrl: 'assets/images/' + document['image'],
                      description: document['shortDescription'],
                      routeName: document['routeName'],
                      distance: document['distance'],
                    );
                  }).toList(),
                );
              }
            }),
      ),
    );
  }
}
