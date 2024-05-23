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
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        backgroundColor: Colors.pink,
      ),
      body: const Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Hello world this is day 2"),
          Text("We are learing about drawers")
        ]),
      ),
      drawer: Drawer(
        backgroundColor: Colors.pink,
        child: ListView(
          children: const [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                accountName: Text("Boitumelo"),
                accountEmail: Text("tumi@gmail.com"),
              ),
            ),
            ListTile(
              title: Text("Edit profile"),
            ),
            ListTile(
              title: Text("Edit profile"),
            ),
            ListTile(
              title: Text("Edit profile"),
            ),
            ListTile(
              title: Text("Edit profile"),
            ),
          ],
        ),
      ),
    );
  }
}
