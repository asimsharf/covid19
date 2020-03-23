/*
* @[Author] [Asim Sharfeldin Mohamed]
* @[Phone] [+249913000262]
* @[Company] [SudaGoras]
* @[Email] [asimsharf@gmail.com]
* @[WebSite] [https://www.sudagoras.com]
*/
import 'package:covid19/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: HomePage(),
      title: Text(
        "كورونا Covid-19",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
      image: Image.asset("assets/logo.png"),
      backgroundColor: Color(0xFFFF1919),
      styleTextUnderTheLoader: TextStyle(
        color: Colors.white,
      ),
      photoSize: 100.0,
      onClick: () => print("Covid-19 كورونا"),
      loaderColor: Colors.white,
      loadingText: Text(
        "يتم التحميل...",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
