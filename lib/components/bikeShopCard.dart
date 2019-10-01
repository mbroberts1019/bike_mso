import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bike_mso/constants/bikeShopData.dart';

class BikeShopCard extends StatelessWidget {
  final BikeShop shop;

  BikeShopCard(this.shop);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 275,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/" + shop.imgName),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.blueGrey,
              width: 3.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(4.0, 4.0),
              )
            ]),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, left: 8.0),
                    child: Text(
                      shop.shopName,
                      style: TextStyle(fontSize: 25.0, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, left: 8.0),
                    child: Text(
                      shop.shopTagLine,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 8, right: 10),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.directions_bike,
                                size: 25.0,
                                color: shop.doRent
                                    ? Colors.black
                                    : Colors.black26),
                            Text(
                              'Rent',
                              style: TextStyle(
                                fontSize: 12,
                                color:
                                    shop.doRent ? Colors.black : Colors.black26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.build,
                                size: 25.0,
                                color: shop.doRepairs
                                    ? Colors.black
                                    : Colors.black26),
                            Center(
                              child: Text(
                                'Service',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: shop.doRepairs
                                      ? Colors.black
                                      : Colors.black26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.attach_money,
                                size: 25.0,
                                color: shop.sellBikes
                                    ? Colors.black
                                    : Colors.black26),
                            Center(
                              child: Text(
                                'Sales',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: shop.sellBikes
                                      ? Colors.black
                                      : Colors.black26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 10, right: 5),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.insert_emoticon,
                                size: 25.0,
                                color: shop.fourStars
                                    ? Colors.black
                                    : Colors.black26),
                            Center(
                              child: Text(
                                'Reviews',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: shop.fourStars
                                      ? Colors.black
                                      : Colors.black26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 10, right: 5),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 25,
                              child: Text(
                                shop.distance.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            Text(
                              'Miles',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: FlatButton(
                onPressed: () {
                  print('Cliked');
                  _launchURL(shop.shopUrl);
                },
                child: Icon(Icons.help_outline, size: 30, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL(shopUrl) async {
  String url = 'https://$shopUrl';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
