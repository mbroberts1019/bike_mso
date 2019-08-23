import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  ReusableButton(
      {@required this.color, this.buttonIcon, this.onPress, this.iconText});

  final Color color;
  final Widget buttonIcon;
  final Function onPress;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: <Widget>[
          Container(
            child: buttonIcon,
            height: 90,
            width: 90,
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color,
            ),
          ),
          Text(
            iconText,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}