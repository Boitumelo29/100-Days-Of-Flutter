import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

import 'package:flutter/scheduler.dart' show timeDilation;

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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[],
        ),
      ),
    );
  }

  Widget _buildHero(
      BuildContext context, String imageName, String description) {
    return Container(
      width: kMinRadius * 3,
      height: kMinRadius * 3,
      // child: Hero(
      //   createRectTween: _createRectTween,
      //   tag: imageName,
      //   child: RadicalExpansion(),),
    );
  }

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }
}

class Photo extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  const Photo(
      {super.key,
      required this.color,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: LayoutBuilder(
          builder: (context, index) {
            return Icon(icon);
          },
        ),
      ),
    );
  }
}
