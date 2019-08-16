import 'package:flutter/material.dart';
import 'package:bike_mso/screens/home_screen.dart';
import 'package:bike_mso/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
