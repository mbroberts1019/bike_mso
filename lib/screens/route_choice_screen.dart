import 'package:flutter/material.dart';
import 'package:bike_mso/components/routeChoiceContainer.dart';
//import 'package:bike_mso/constants/polylines.dart';
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
              print(snapshot);

              return ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return RouteChoiceContainer(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return RouteScreen(
                            document['polyline'],
                            document['routeName'],
                          );
                        }),
                      );
                    },
                    bgImageUrl: 'assets/images/' + document['image'],
                    description: document['description'],
                    routeName: document['routeName'],
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}

//class RideChoiceScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Go Ride Bikes!!'),
//      ),
//      body: Container(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children: <Widget>[
//            Expanded(
//              child: RouteChoiceContainer(
//                onPressed: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) {
//                      return RouteScreen(
//                        kKimWilliams,
//                        'Kickin\' it on the Kim',
//                      );
//                    }),
//                  );
//                },
//                bgImageUrl: 'assets/images/kimWilliamsBridgeClub.jpg',
//                description:
//                    'A short dirt road ride along the Clark Fork east of town.',
//                routeName: 'Kickin\' it on the Kim',
//              ),
//            ),
//            Expanded(
//              child: Center(
//                child: Text('Route 5'),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
