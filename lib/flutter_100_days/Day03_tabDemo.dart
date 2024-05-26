import 'package:flutter/material.dart';

//Day03 is on flutter tabs: tabs are part of the ui that navigates the user through diffrent routes.
void main() {
  runApp(const TabDemo());
}

class TabDemo extends StatelessWidget {
  const TabDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Tab Bar demo",
            ),
          ),
          bottomNavigationBar: const TabBar(
            tabs: [
              Icon(Icons.home),
              Icon(Icons.camera),
              Icon(Icons.person),
            ],
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.home),
              Icon(Icons.camera),
              Icon(Icons.person),
            ],
          ),
        ),
      ),
    );
  }
}
