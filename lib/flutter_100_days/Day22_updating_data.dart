import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String title = "Updating Data on Internet ";

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
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: FutureBuilder<Album>(
          future: _futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(hintText: "Enter Text"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text("Update Text"),
                    ),
                  ],
                );
              } else if (snapshot.hasData) {
                var snackBar = const SnackBar(
                  content: Text("An error has occured"),
                );
                return ScaffoldMessenger(child: snackBar);
              }
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

// in order for us to update anything on the internet we need to first fetch it from the internet
//to fetch we get and to update we put
  Future<Album> fetchAlbum() async {
    const String uri = 'https://jsonplaceholder.typicode.com/albums/1';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      var snackBar = const SnackBar(content: Text("An error has occures"));
      throw ScaffoldMessenger(child: snackBar);
    }
  }

  Future<Album> updateAlbum() async {
    const String uri = 'https://jsonplaceholder.typicode.com/albums/1';
    final response = await http.put(Uri.parse(uri), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    });

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      var snackBar = const SnackBar(content: Text("An error has occures"));
      throw ScaffoldMessenger(child: snackBar);
    }
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
