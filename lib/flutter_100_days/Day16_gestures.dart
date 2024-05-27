import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = "Gesture Example";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(title: title),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          child: GestureDetector(
            onTap: () {
              const snackBar =
                  SnackBar(content: Text("You have tapped on the button"));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text("Tap Button"),
            ),
          ),
        ),
      ),
    );
  }
}
