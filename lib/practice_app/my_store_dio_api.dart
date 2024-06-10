import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = "";

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
  var jsonList;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile();
      }),
    );
  }

  void getData() async {
    try {
      var response = await Dio().get("");

      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data[''] as List;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
