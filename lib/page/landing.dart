import 'package:flutter/material.dart';
import 'package:flutter_sport_app/page/auth.dart';
import 'package:flutter_sport_app/page/home.dart';

class LandingPage extends StatelessWidget{
  const LandingPage ({Key key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = false;
    return isLoggedIn ? HomePage(): AuthorizationPage();
  }
}