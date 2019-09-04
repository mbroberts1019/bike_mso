import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BikeShopCard extends StatelessWidget {
  BikeShopCard(this.shopName, this.shopTagLine, this.imgName, this.shopUrl,
      this.doRent, this.doRepairs, this.sellBikes, this.fourStars);

  final String shopName;
  final String shopTagLine;
  final String imgName;
  final String shopUrl;
  final bool doRent;
  final bool doRepairs;
  final bool sellBikes;
  final bool fourStars;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/$imgName"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5.0),
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
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      shopName,
                      style: TextStyle(fontSize: 25.0, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      shopTagLine,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 10),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.directions_bike,
                                size: 25.0,
                                color: doRent ? Colors.black : Colors.black26),
                            Text(
                              'Rent',
                              style: TextStyle(
                                fontSize: 10,
                                color: doRent ? Colors.black : Colors.black26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.build,
                                size: 25.0,
                                color:
                                    doRepairs ? Colors.black : Colors.black26),
                            Center(
                              child: Text(
                                'Service',
                                style: TextStyle(
                                  fontSize: 10,
                                  color:
                                      doRepairs ? Colors.black : Colors.black26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.attach_money,
                                size: 25.0,
                                color:
                                    sellBikes ? Colors.black : Colors.black26),
                            Center(
                              child: Text(
                                'Sales',
                                style: TextStyle(
                                  fontSize: 10,
                                  color:
                                      sellBikes ? Colors.black : Colors.black26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 5),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.insert_emoticon,
                                size: 25.0,
                                color:
                                    fourStars ? Colors.black : Colors.black26),
                            Center(
                              child: Text(
                                'Four Stars',
                                style: TextStyle(
                                  fontSize: 10,
                                  color:
                                      fourStars ? Colors.black : Colors.black26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              right: 20,
              child: Container(
                height: 70,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.pink,
                ),
                child: FlatButton(
                  onPressed: () {
                    print('Cliked');
                    _launchURL(shopUrl);
                  },
                  child: Text('Go to Google'),
                ),
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
