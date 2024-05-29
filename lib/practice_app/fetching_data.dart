import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String title = "Fetching Data From The Internet";

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
  late Future<Album> _fetchAlbum();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _fetchAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FutureBuilder<Album>(
                future: _fetchAlbum(),
                builder: (context, snapshot) {
                  return const Column(
                    children: <Widget>[],
                  );
                })
          ],
        ),
      ),
    );
  }
 
}

   Future<Album> _fetchAlbum() async {
    var uri = 'https://jsonplaceholder.typicode.com/albums/1';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      return Album.fromJson(json.decode(response.body));
    } else {
      const snackBar = SnackBar(content: Text("An Error has occured"));
      const snackBarMessage = ScaffoldMessenger(child: snackBar);
      throw snackBarMessage;
    }
  }

   // Future<Album> updateAlbum(String title) {
  //   var uri = 'https://jsonplaceholder.typicode.com/albums/1';
  //   final response = http.post(Uri.parse(uri));
  // }

class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(id: json['id'], title: json['title']);
  }
}
