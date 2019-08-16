import 'package:flutter/material.dart';
import 'package:bike_mso/components/homeRouteButton.dart';
import 'route_choice_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/rattlesnakeBikePack.jpg'),
                  Text(
                    'Missoula\'s a great place to ride a bike, And we\'re here to help you find your way',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ReusableButton(
                    color: Colors.purpleAccent,
                    iconText: 'Rides',
                    buttonIcon: Icon(
                      Icons.directions_bike,
                      size: 60,
                    ),
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RideChoiceScreen()));
                    },
                  ),
                  ReusableButton(
                    color: Colors.purpleAccent,
                    iconText: 'Weather',
                    buttonIcon: Icon(
                      Icons.cloud,
                      size: 60,
                    ),
                    onPress: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ReusableButton(
                    color: Colors.purpleAccent,
                    iconText: 'Saftey 3rd',
                    buttonIcon: Icon(
                      Icons.local_hospital,
                      size: 60,
                    ),
                    onPress: () {},
                  ),
                  ReusableButton(
                    color: Colors.purpleAccent,
                    iconText: 'Bike Shops',
                    buttonIcon: Icon(
                      Icons.build,
                      size: 60,
                    ),
                    onPress: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
