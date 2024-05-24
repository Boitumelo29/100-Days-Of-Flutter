import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Progress indicator"),
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              color: Colors.pink,
            ),
            SizedBox(
              height: 10,
            ),
            LinearProgressIndicator(
              color: Colors.pink,
              value: 80,
              valueColor: AlwaysStoppedAnimation(Colors.white24),
            )
          ],
        ),
      ),
    );
  }
}
