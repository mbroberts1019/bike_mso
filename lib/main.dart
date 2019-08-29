import 'package:flutter/material.dart';
import 'package:bike_mso/screens/home_screen.dart';
import 'package:bike_mso/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color.fromRGBO(7, 79, 181, 1),
        accentColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: Colors.indigoAccent,
        textTheme: TextTheme(
          headline: TextStyle(
            fontFamily: 'Lora',
          ),
          body1: TextStyle(
            color: Colors.white,
            fontFamily: 'RobotoMono',
          ),
        ),
      ),
      home: LoadingScreen(),
    );
  }
}
