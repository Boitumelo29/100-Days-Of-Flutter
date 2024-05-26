import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = "Radial Hero Animation";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(
        title: title,
      ),
    );
  }
}

//Radical transformation means turning a circular shape into a square shape and in radical hero animation the same is done using a hero widget
//a hero widget is used to  create hero Animation
// and a hero is a widget is a widget that moves between screens
// you can read more here https://www.geeksforgeeks.org/flutter-radial-hero-animation/?ref=lbp

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});

  static const double kMinRadius = 32;
  static const double kMaxRadius = 128;
  static const opacityCurve = Interval(0, 0, curve: Curves.fastOutSlowIn);

  @override
  Widget build(BuildContext context) {
    timeDilation = 4;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: const EdgeInsets.all(33),
        alignment: FractionalOffset.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildHero(context, Icons.abc, "first"),
            _buildHero(context, Icons.abc, "second"),
            _buildHero(context, Icons.abc, "third")
          ],
        ),
      ),
    );
  }

  Widget _buildHero(
      BuildContext context, IconData imageName, String description) {
    return Container(
      width: kMinRadius * 3,
      height: kMinRadius * 3,
      child: Hero(
        createRectTween: _createRectTween,
        tag: imageName,
        child: RadicalExpansion(
          maxRadius: kMaxRadius,
          child: Photo(
            icon: imageName,
            onTap: () {
              Navigator.of(context).push(PageRouteBuilder<void>(pageBuilder:
                  (BuildContext context, Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                return AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return Opacity(
                          opacity: opacityCurve.transform(animation.value),
                          child: _buildPage(
                            context,
                            imageName,
                            description,
                          ));
                    });
              }));
            },
          ),
        ),
      ),
    );
  }

  static Widget _buildPage(
      BuildContext context, IconData imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: Hero(
                  createRectTween: _createRectTween,
                  tag: imageName,
                  child: RadicalExpansion(
                    maxRadius: kMaxRadius,
                    child: Photo(
                      icon: imageName,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              Text(
                description,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  static RectTween _createRectTween(Rect? begin, Rect? end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }
}

class Photo extends StatelessWidget {
  final IconData icon;
  // final Color color;
  final VoidCallback onTap;
  const Photo(
      {super.key,
      //required this.color,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: LayoutBuilder(
          builder: (context, index) {
            return Icon(icon);
          },
        ),
      ),
    );
  }
}

class RadicalExpansion extends StatelessWidget {
  const RadicalExpansion({
    Key? key,
    required this.maxRadius,
    required this.child,
  })  : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);

  final double maxRadius;
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          height: clipRectSize,
          width: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}
