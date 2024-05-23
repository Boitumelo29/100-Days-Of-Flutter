import 'package:flutter/material.dart';
import 'package:flutter100days/main.dart';

//Day 2 is on creating a drawer,
//Drawer widget is used tp provide access to different destionations in the application.

// its properties include, child, hashCode, key, runtimeType, elvation, semanticLabel
//Drawer({Key key, double elevation: 16.0, Widget child, String semanticLabel})

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = "Flutter Day 2";

  //this is the constuctor of MyApp,
  // the Explanation https://stackoverflow.com/questions/52056035/myhomepagekey-key-this-title-superkey-key-in-flutter-what-would-b
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(
        appTitle: appTitle,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String appTitle;
  const MyHomePage({Key? key, required this.appTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Column(children: []),
    ));
  }
}
