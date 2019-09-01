import 'package:flutter/material.dart';

class HandSignal extends StatelessWidget {
  HandSignal(this._imgName, this._signalName);

  final String _imgName;
  final String _signalName;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black38,
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.pinkAccent[400],
            ),
            child: Image.asset('assets/images/$_imgName', fit: BoxFit.fill),
            //width: 60,
          ),
          Container(
            child: Center(child: Text(_signalName)),
          ),
        ],
      ),
    );
  }
}
