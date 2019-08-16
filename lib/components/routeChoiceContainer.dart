import 'package:flutter/material.dart';

class RouteChoiceContainer extends StatelessWidget {
  RouteChoiceContainer(
      {this.routeName, this.bgImageUrl, this.description, this.onPressed});

  final String routeName;
  final String bgImageUrl;
  final String description;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff7c94b6),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            image: ExactAssetImage(bgImageUrl),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.deepPurple,
            width: 5.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              routeName,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
            ),
            Text(description,
                style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic))
          ],
        ),
      ),
    );
  }
}
