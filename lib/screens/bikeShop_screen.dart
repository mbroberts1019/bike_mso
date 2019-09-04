import 'package:flutter/material.dart';
import 'package:bike_mso/components/bikeShopCard.dart';

class BikeShopScreen extends StatefulWidget {
  @override
  _BikeShopScreenState createState() => _BikeShopScreenState();
}

class _BikeShopScreenState extends State<BikeShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Local Bike Shops'),
        ),
        body: Column(
          children: <Widget>[
            BikeShopCard(
              'Bicycle Hangar',
              'Free Tuneups for Life',
              'kimWilliamsBridgeClub.jpg',
              'www.google.com/maps/place/Bicycle+Hangar/@46.8577816,-114.0165069,15z/data=!4m8!1m2!2m1!1sgoogle+maps+bicycle+Hangar!3m4!1s0x535dcdc198b4b2dd:0xccb015e2a373910f!8m2!3d46.853907!4d-114.0108293',
              false,
              true,
              true,
              true,
            ),
          ],
        ));
  }
}

//shopName: 'Bicycle Hangar',
//shopTagLine: 'Free Tuneups for Life',
//imgName: 'kimWilliamsBridgeClub.jpg',
//doRent: true,
//doRepairs: true,
//costMoney: true,
//fourStars: true,
