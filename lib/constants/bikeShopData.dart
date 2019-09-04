import 'package:flutter/material.dart';

final kBicycleHangar = new BikeShop(
  'Bicycle Hangar',
  'Free Tuneups for Life',
  'kimWilliamsBridgeClub.jpg',
  'www.google.com/maps/place/Bicycle+Hangar/@46.8577816,-114.0165069,15z/data=!4m8!1m2!2m1!1sgoogle+maps+bicycle+Hangar!3m4!1s0x535dcdc198b4b2dd:0xccb015e2a373910f!8m2!3d46.853907!4d-114.0108293',
  false,
  true,
  true,
  true,
);

class BikeShop {
  BikeShop(this.shopName, this.shopTagLine, this.imgName, this.shopUrl,
      this.doRent, this.doRepairs, this.sellBikes, this.fourStars);

  final String shopName;
  final String shopTagLine;
  final String imgName;
  final String shopUrl;
  final bool doRent;
  final bool doRepairs;
  final bool sellBikes;
  final bool fourStars;
}
