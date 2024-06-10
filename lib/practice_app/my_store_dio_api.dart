import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = "My Store";

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
        return ListTile(
          leading: ClipRRect(
            child: Image.network(
              jsonList[index]['image'],
              width: 50,
              height: 50,
              fit: BoxFit.fill,
            ),
          ),
          title: Text(jsonList[index]['title']),
          subtitle: Text(jsonList[index]['price']),
        );
      }),
    );
  }

  void getData() async {
    try {
      var response = await Dio().get("'https://fakestoreapi.com/products");

      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data['products'] as List;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
