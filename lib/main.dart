import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sport_app/page/landing.dart';


void main() => runApp(FitnessApp());

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Jas Orda',
        theme: ThemeData(
            primaryColor: Colors.orange,
            textTheme: TextTheme(title: TextStyle(color: Colors.white))),
        home: LandingPage());
  }
}

