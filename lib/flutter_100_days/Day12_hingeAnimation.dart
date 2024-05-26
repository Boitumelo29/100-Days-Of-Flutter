import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
  late Animation<double> rotationAnimation;
  late Animation<double> slideAnimation;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 200));

    rotationAnimation = Tween<double>(begin: 0.0, end: 0.15).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.bounceOut),
      ),
    );

    slideAnimation = Tween(begin: 100.0, end: 600.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(curve: Curves.fastOutSlowIn, 0.5, 0.1)));

    opacityAnimation = Tween(end: 0.15, begin: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(curve: Curves.fastOutSlowIn, 0.5, 0.1)));
  }

//Called when this object is removed from the tree permanently.
//It is overridden to perform necessary cleanup activities when a widget or its state is permanently removed from the widget tree.
//in this case it is used to release the resources used by this object to prevent memory leaks.
//A memory leak in programming occurs when a computer program incorrectly manages memory allocations, resulting in reduced performance or system crashes.
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedBuilder(
        animation: slideAnimation,
        builder: (context, child) {
          return Container(
            width: 200,
            height: 150,
            padding: const EdgeInsets.all(0),
            margin: EdgeInsets.only(left: 100, top: slideAnimation.value),
            child: RotationTransition(
              turns: rotationAnimation,
              child: const Center(
                child: Text(
                  "Hinge Animation",
                  style: TextStyle(color: Colors.pink),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        backgroundColor: Colors.green[300],
        onPressed: () {
          _controller.forward();
        },
      ),
    );
  }
}
