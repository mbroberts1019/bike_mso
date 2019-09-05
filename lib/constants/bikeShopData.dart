import 'package:flutter/material.dart';

final kBicycleHangar = new BikeShop(
  'Bicycle Hangar',
  'Free Tuneups for Life',
  'bikeHangar.jpg',
  'www.google.com/maps/place/Bicycle+Hangar/@46.8577816,-114.0165069,15z/data=!4m8!1m2!2m1!1sgoogle+maps+bicycle+Hangar!3m4!1s0x535dcdc198b4b2dd:0xccb015e2a373910f!8m2!3d46.853907!4d-114.0108293',
  false,
  true,
  true,
  true,
  46.853907,
  -114.0108293,
);

final kBicycleHangarDowntown = new BikeShop(
    'Bicycle Hangar- Downtown',
    'Free Tuneups for Life',
    'bikeHanagarDT.png',
    'www.google.com/maps/place/Bicycle+Hangar+Downtown/@46.8637082,-114.0192536,14z/data=!4m8!1m2!2m1!1sgoogle+maps+bicycle+Hangar!3m4!1s0x535dcc2b056ffea3:0xeae80f03e9fadc00!8m2!3d46.8735121!4d-113.9926586',
    true,
    true,
    true,
    true,
    46.8735121,
    -113.9926586);

final kBigSkyBikes = new BikeShop(
    'Big Sky Bikes',
    'Your Premier Missoula Bike Shop',
    'bigSkyBikes.png',
    'www.google.com/maps/place/Big+Sky+Bikes/@46.867985,-113.9862867,17z/data=!3m1!4b1!4m5!3m4!1s0x535dcc2e5011984f:0x382ca0d14bfd3906!8m2!3d46.867985!4d-113.984098',
    false,
    true,
    true,
    false,
    46.867985,
    -113.984098);

final kBikeDoctor = new BikeShop(
  'Bike Doctor',
  'Relaxed, low pressure atmosphere',
  'bikeDoctor.jpeg',
  'www.google.com/maps/place/Bike+Doctor/@46.8778278,-114.0089007,17z/data=!3m1!4b1!4m5!3m4!1s0x535dce7db76c8edb:0x2fd9b1cd19e63a80!8m2!3d46.8778278!4d-114.006712',
  false,
  true,
  true,
  true,
  46.8778278,
  -114.006712,
);

final kFreeCycles = new BikeShop(
  'Free Cycles',
  'Community, Education, Engagement',
  'freeCycles.jpg',
  'www.google.com/maps/place/Free+Cycles+Missoula/@46.8691512,-114.0098059,17z/data=!3m1!4b1!4m5!3m4!1s0x535dcdd652536b63:0x74e528cc5037a24e!8m2!3d46.8691476!4d-114.0076172',
  false,
  true,
  false,
  true,
  46.8691476,
  -114.0076172,
);

final kHellgateCyclery = new BikeShop(
  'Hellgate Cyclery',
  'A world with bicycles is beautiful',
  'hellgateCyclery.jpg',
  'www.google.com/maps/place/Hellgate+Cyclery/@46.8724325,-113.9954444,17z/data=!3m1!4b1!4m5!3m4!1s0x535dcc2a46fdd44f:0x4eab17958796d300!8m2!3d46.8724325!4d-113.9932557',
  false,
  true,
  true,
  true,
  46.8724325,
  -113.9932557,
);

final kMissoulaBikeSource = new BikeShop(
  'Missoula Bike Source',
  'Montana\'s Mountain Bike Headquarters',
  'missoulaBikeSource.jpeg',
  'www.google.com/maps/place/Missoula+Bike+Source/@46.8575458,-114.0213912,17z/data=!3m1!4b1!4m5!3m4!1s0x535dcde83de3c733:0x41ae533dbb104914!8m2!3d46.8575458!4d-114.0192025',
  false,
  true,
  true,
  true,
  46.8575458,
  -114.0192025,
);

final kMissoulaBikeWorks = new BikeShop(
  'Missoula Bike Works',
  'The Ride Matters',
  'missoulaBikeWorks.jpeg',
  'www.google.com/maps/place/Missoula+Bicycle+Works/@46.8645575,-113.9994851,17z/data=!3m1!4b1!4m5!3m4!1s0x535dcdd2681d7541:0xd190785f4eacd775!8m2!3d46.8645575!4d-113.9972964',
  true,
  true,
  true,
  true,
  46.8645575,
  -113.9972964,
);

final kOpenRoadBicycles = new BikeShop(
  'Open Road Bicycles',
  'Proudly Serving Western MT for 30 years',
  'openRoad.png',
  'www.google.com/maps/place/Open+Road+Bicycles+And+Nordic/@46.8665734,-114.0060017,17z/data=!3m1!4b1!4m5!3m4!1s0x535dcdd135c86e6b:0x31f149671c7f0036!8m2!3d46.8665734!4d-114.003813',
  false,
  true,
  true,
  true,
  46.8665734,
  -114.003813,
);

class BikeShop {
  BikeShop(
    this.shopName,
    this.shopTagLine,
    this.imgName,
    this.shopUrl,
    this.doRent,
    this.doRepairs,
    this.sellBikes,
    this.fourStars,
    this.lat,
    this.long,
  );

  final String shopName;
  final String shopTagLine;
  final String imgName;
  final String shopUrl;
  final bool doRent;
  final bool doRepairs;
  final bool sellBikes;
  final bool fourStars;
  final double lat;
  final double long;
  var distance;
}
