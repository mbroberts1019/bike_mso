import 'package:flutter/material.dart';

class RideChoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go Ride Bikes!!'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text('Route 1'),
              ),
            ),
            Expanded(
              child: Center(
                child: Text('Route 1'),
              ),
            ),
            Expanded(
              child: Center(
                child: Text('Route 1'),
              ),
            ),
            Expanded(
              child: Center(
                child: Text('Route 1'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
