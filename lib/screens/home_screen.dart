import 'package:flutter/material.dart';
import 'package:bike_mso/components/homeRouteButton.dart';
import 'route_choice_screen.dart';
import 'safety_screen.dart';
import 'bikeShop_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);

    controller.forward();

    controller.addListener(() {
      setState(() {});
      //print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.43, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Color.fromRGBO(97, 130, 63, 1),
                Colors.indigoAccent[400],
                Colors.indigoAccent,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(
                          'assets/images/landscapeMtnSun.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Bike_MSO',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 80,
                                color: Colors.black87),
                          ),
                        ),
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 150,
                            ),
                            Positioned(
                              top: 55,
                              left: animation.value * 150,
                              child: Icon(
                                Icons.directions_bike,
                                size: 100,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Fun rides for all ages and abilities!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ReusableButton(
                        color: Colors.purpleAccent,
                        iconText: 'Rides',
                        buttonIcon: Icon(
                          Icons.directions_bike,
                          size: 50,
                        ),
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RideChoiceScreen()),
                          );
                        },
                      ),
                      ReusableButton(
                        color: Colors.purpleAccent,
                        iconText: 'Weather',
                        buttonIcon: Icon(
                          Icons.cloud,
                          size: 50,
                        ),
                        onPress: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ReusableButton(
                      color: Colors.purpleAccent,
                      iconText: 'Saftey 3rd',
                      buttonIcon: Icon(
                        Icons.local_hospital,
                        size: 50,
                      ),
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SafetyScreen()),
                        );
                      },
                    ),
                    ReusableButton(
                      color: Colors.purpleAccent,
                      iconText: 'Bike Shops',
                      buttonIcon: Icon(
                        Icons.build,
                        size: 50,
                      ),
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BikeShopScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
