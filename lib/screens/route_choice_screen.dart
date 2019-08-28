import 'package:flutter/material.dart';
import 'package:bike_mso/components/routeChoiceContainer.dart';
import 'package:bike_mso/constants/polylines.dart';
import 'package:bike_mso/screens/route_screen.dart';

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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return RouteScreen(
                        kKimWilliams,
                        'Kickin\' it on the Kim',
                      );
                    }),
                  );
                },
                bgImageUrl: 'assets/images/kimWilliamsBridgeClub.jpg',
                description:
                    'A short dirt road ride along the Clark Fork east of town.',
                routeName: 'Kickin\' it on the Kim',
              ),
            ),
            Expanded(
              child: RouteChoiceContainer(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return RouteScreen(
                        kLoloRide,
                        'Missoula to Lolo',
                      );
                    }),
                  );
                },
                bgImageUrl: 'assets/images/loloTrail.JPG',
                description: 'A pleasant ride up the Bitterrot Trail.',
                routeName: 'Missoula to Lolo ',
              ),
            ),
            Expanded(
              child: RouteChoiceContainer(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return RouteScreen(
                        kDeerCreekSneakPoly,
                        'Deer Creek Sneak',
                      );
                    }),
                  );
                },
                bgImageUrl: 'assets/images/deerCreekT29.jpg',
                description:
                    'A half dirt road half single track loop around the back side of Mt. Sentinal.',
                routeName: 'Deer Creek Sneak',
              ),
            ),
            Expanded(
              child: Center(
                child: Text('Route 5'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
