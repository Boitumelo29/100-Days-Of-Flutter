import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
