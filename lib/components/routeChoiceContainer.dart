import 'package:flutter/material.dart';

class RouteChoiceContainer extends StatelessWidget {
  RouteChoiceContainer(
      {this.routeName,
      this.bgImageUrl,
      this.description,
      this.onPressed,
      this.distance});

  final String routeName;
  final String bgImageUrl;
  final String description;
  final String distance;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xff7c94b6),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
              image: ExactAssetImage(bgImageUrl),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.white30,
              width: 3.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(4.0, 4.0),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  routeName,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
                ),
                Text(
                  distance,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.right,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
