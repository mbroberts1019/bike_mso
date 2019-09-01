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
