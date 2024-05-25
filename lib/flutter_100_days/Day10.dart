import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String title = "Lazy Loader";

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
    List<int> data = [];
    int currentLength = 0;

    final int increment = 10;
    bool isLoading = false;

    Future<void> loadMore() async {
      setState(() {
        isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 2));
      for (var i = 0; i <= currentLength + increment; i++) {
        data.add(i);
      }

      setState(() {
        isLoading = false;
        currentLength = data.length;
      });
    }

    @override
    void initState() {
      loadMore();
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(widget.title),
      ),
    );
  }
}
