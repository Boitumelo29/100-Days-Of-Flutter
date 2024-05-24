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
      ),
    );
  }
}
