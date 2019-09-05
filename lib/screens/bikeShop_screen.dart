import 'package:flutter/material.dart';
import 'package:bike_mso/components/bikeShopCard.dart';
import 'package:bike_mso/constants/bikeShopData.dart';
import 'package:bike_mso/services/location.dart';
import 'package:bike_mso/services/haversine.dart';

List<BikeShop> bikeShopList = [
  kBicycleHangar,
  kBicycleHangarDowntown,
  kBigSkyBikes,
  kBikeDoctor,
  kFreeCycles,
  kHellgateCyclery,
  kMissoulaBikeSource,
  kMissoulaBikeWorks,
  kOpenRoadBicycles,
];

class BikeShopScreen extends StatefulWidget {
  @override
  _BikeShopScreenState createState() => _BikeShopScreenState();
}

class _BikeShopScreenState extends State<BikeShopScreen> {
  @override
  void initState() {
    findAndSetDistances();

    super.initState();
  }

  void findAndSetDistances() async {
    Location location = new Location();

    await location.getCurrentLocation();
    //use Haversine to calculate and set distances for each shop
    for (BikeShop shop in bikeShopList) {
      final haversine = new Haversine.fromDegrees(
          latitude1: location.latitude,
          latitude2: shop.lat,
          longitude1: location.longitude,
          longitude2: shop.long);
      // converting meters to miles & making a string with 2 decimal places
      shop.distance = (haversine.distance() * 0.000621371).toStringAsFixed(2);
    }
    // sort list based on distance
    bikeShopList.sort((a, b) => a.distance.compareTo(b.distance));
  }

  Widget _buildShopList(BuildContext context, int index) {
    return BikeShopCard(bikeShopList[index]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Bike Shops'),
      ),
      body: ListView.builder(
        itemBuilder: _buildShopList,
        itemCount: bikeShopList.length,
      ),
    );
  }
}
