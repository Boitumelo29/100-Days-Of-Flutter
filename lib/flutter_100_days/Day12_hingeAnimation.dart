import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = "Hinge Animation";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(title: title),
    );
  }
}

//hinge animation is an animation where an element can turn over with a sudden movement

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
//In Dart, the late keyword is used to declare a non-nullable variable that will be initialized after its declaration but before it is used for the first time.
  late AnimationController _controller;
  late Animation rotationAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 200));

    rotationAnimation = Tween(end: 0.15, begin: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(curve: Curves.bounceOut, 0.0, 0.5)));

    _slideAnimation = Tween(end: 0.15, begin: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(curve: Curves.bounceOut, 0.0, 0.5)));

    _opacityAnimation = Tween(end: 0.15, begin: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(curve: Curves.bounceOut, 0.0, 0.5)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text(title),
          ),
    );
  }
}
