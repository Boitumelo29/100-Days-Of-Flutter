import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = "Radial Hero Animation";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(
        title: title,
      ),
    );
  }
}

//Radical transformation means turning a circular shape into a square shape and in radical hero animation the same is done using a hero widget
//a hero widget is used to  create hero Animation
// and a hero is a widget is a widget that moves between screens
// you can read more here https://www.geeksforgeeks.org/flutter-radial-hero-animation/?ref=lbp

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});

  static const double kMinRadius = 32;
  static const double kMaxRadius = 128;
  static const opacityCurve = Interval(0, 0, curve: Curves.fastOutSlowIn);

  @override
  Widget build(BuildContext context) {
    timeDilation = 4;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: const EdgeInsets.all(33),
        alignment: FractionalOffset.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[],
        ),
      ),
    );
  }

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }
}
