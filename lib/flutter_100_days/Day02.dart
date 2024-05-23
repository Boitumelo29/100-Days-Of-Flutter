import 'package:flutter/material.dart';

//Day 2 is on creating a drawer,
//Drawer widget is used tp provide access to different destionations in the application.

// its properties include, child, hashCode, key, runtimeType, elvation, semanticLabel
//Drawer({Key key, double elevation: 16.0, Widget child, String semanticLabel})

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = "Flutter Day 2";
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
