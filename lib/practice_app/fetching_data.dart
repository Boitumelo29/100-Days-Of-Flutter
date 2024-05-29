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
  late Future<Album> _futureAlbum;

  @override
  void initState() {
    super.initState();
    _futureAlbum = _fetchAlbum();
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
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[Text(snapshot.data!.title)],
                    );
                  }
                  return const CircularProgressIndicator();
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
    const snackBarMessage = SnackBar(content: Text("An Error has occured"));
    const snackBar = ScaffoldMessenger(child: snackBarMessage);
    throw snackBar;
  }
}

// Future<Album> updateAlbum(String title) {
//   var uri = 'https://jsonplaceholder.typicode.com/albums/1';
//   final response = http.post(Uri.parse(uri));
//  }

class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(id: json['id'], title: json['title']);
  }
}
