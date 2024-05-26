import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final String title = "Lottie Example";
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(title: title),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.network(
                'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
                height: 200.0,
                repeat: true,
                animate: true),
            Lottie.network(
                'https://assets1.lottiefiles.com/private_files/lf30_yQtj4O.json',
                height: 200.0,
                repeat: true,
                animate: true),
          ],
        ),
      ),
    );
  }
}
