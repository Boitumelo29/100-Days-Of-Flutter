import 'package:flutter/material.dart';

void main() => runApp(const MyListApp());

class MyListApp extends StatelessWidget {
  const MyListApp({super.key});
  final String title = "List App";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: Drawer(
          child: ListView(
            children: const [
              DrawerHeader(
                child: UserAccountsDrawerHeader(
                    accountName: Text('Boitumelo'),
                    accountEmail: Text("Thobejane")),
              ),
              ListTile(
                title: Text("Home"),
              ),
              ListTile(
                title: Text("LogOut"),
              )
            ],
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),

          /// we added a listview with containers, we then defined that list and stated that the list is going to contain widgets
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                color: Colors.red,
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.pink,
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
