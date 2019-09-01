import 'package:flutter/material.dart';

class BikeShopCard extends StatelessWidget {
  BikeShopCard(this.shopName, this.shopTagLine, this.imgName, this.doRent,
      this.doRepairs, this.costMoney, this.fourStars);

  final String shopName;
  final String shopTagLine;
  final String imgName;
  final bool doRent;
  final bool doRepairs;
  final bool costMoney;
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
                  decoration: BoxDecoration(color: Colors.white),
                  child: Text(
                    shopName,
                    style: TextStyle(fontSize: 25.0, color: Colors.black),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Text(
                    shopTagLine,
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 10),
                        child: Icon(Icons.directions_bike,
                            size: 25.0,
                            color: doRent ? Colors.black : Colors.black26),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Icon(Icons.build,
                            size: 25.0,
                            color: doRepairs ? Colors.black : Colors.black26),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Icon(Icons.attach_money,
                            size: 25.0,
                            color: costMoney ? Colors.black : Colors.black26),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 5),
                        child: Icon(Icons.insert_emoticon,
                            size: 25.0,
                            color: fourStars ? Colors.black : Colors.black26),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
