import 'package:flutter/material.dart';
import 'package:bike_mso/components/bikeShopCard.dart';
import 'package:bike_mso/constants/bikeShopData.dart';

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
      body: ListView(
        children: <Widget>[
          BikeShopCard(kBicycleHangar),
          BikeShopCard(kBicycleHangarDowntown),
          BikeShopCard(kBigSkyBikes),
          BikeShopCard(kBikeDoctor),
          BikeShopCard(kFreeCycles),
          BikeShopCard(kHellgateCyclery),
          BikeShopCard(kMissoulaBikeSource),
          BikeShopCard(kMissoulaBikeWorks),
          BikeShopCard(kOpenRoadBicycles),
        ],
      ),
    );
  }
}

//shopName: 'Bicycle Hangar',
//shopTagLine: 'Free Tuneups for Life',
//imgName: 'kimWilliamsBridgeClub.jpg',
//doRent: true,
//doRepairs: true,
//costMoney: true,
//fourStars: true,
