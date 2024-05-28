import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = "Arguments in Names Routes";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: (settings) {
          if (settings.name == PassArgumentScreen.routeName) {}
        },
        debugShowCheckedModeBanner: false,
        home: HomePage(title: title));
  }
}

//In flutter we use: Navigator.
// an example is: Navigator.pushNamed()

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class PassArgumentScreen extends StatelessWidget {
  static const routeName = '/passArguments';
  final String title;
  final String message;
  const PassArgumentScreen(
      {super.key, required this.message, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

class Arguments {
  final String titleBar;
  final String textMessage;

  Arguments({required this.titleBar, required this.textMessage});
}

class ExtractArgumentScreen extends StatelessWidget {
  //static const routeName = ''
  const ExtractArgumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
