import 'package:flutter/material.dart';
import 'package:bike_mso/components/routeChoiceContainer.dart';

class RideChoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go Ride Bikes!!'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: RouteChoiceContainer(
                bgImageUrl: 'assets/images/kimWilliamsBridgeClub.jpg',
                description:
                    'A short dirt road ride along the Clark Fork east of town.',
                routeName: 'Kickin\' it on the Kim',
              ),
            ),
            Expanded(
              child: Center(
                child: Text('Route 1'),
              ),
            ),
            Expanded(
              child: Center(
                child: Text('Route 1'),
              ),
            ),
            Expanded(
              child: Center(
                child: Text('Route 1'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
