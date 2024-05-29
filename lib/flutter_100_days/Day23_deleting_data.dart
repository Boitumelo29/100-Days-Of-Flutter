import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String title = "Deleting From Internet";

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
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Text(snapshot.data!.title),
                ],
              );
            }
          }
        },
      ),
    );
  }

  Future<Album> fetchAlbum() async {
    var uri = 'https://jsonplaceholder.typicode.com/albums/1';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      return Album.fromJson(
        jsonDecode(
          response.body,
        ),
      );
    } else {
      var snackBar = const SnackBar(content: Text("An error has occured"));
      throw ScaffoldMessenger(child: snackBar);
    }
  }
}

Future<Album> updateAlbum(String title) async {
  const String uri = 'https://jsonplaceholder.typicode.com/albums/1';
  final response = await http.put(Uri.parse(uri),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{'title': title}));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    var snackBar = const SnackBar(content: Text("An error has occures"));
    throw ScaffoldMessenger(child: snackBar);
  }
}

Future<Album> deleteAlbum(String id) async {
  var uri = 'https://jsonplaceholder.typicode.com/albums/$id';

  final http.Response response = await http.delete(
    Uri.parse(uri),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Item Not Deleted!');
  }
}

class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(id: json['id'], title: json['title']);
  }
}
