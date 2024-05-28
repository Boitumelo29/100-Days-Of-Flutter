import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = "Web Sockets";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(title: title),
    );
  }
}
//WebSockets are used to connect with the server just like the http package. It supports two-way communication with a server without polling.

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
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<Album>(
          future: _futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(snapshot.data.title),
                    TextField(
                      controller: _controller,
                      decoration:
                          const InputDecoration(hintText: "Enter Title"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Update data"))
                  ],
                );
              } else if (snapshot.hasError) {
                var snackBar = SnackBar(content: Text("${snapshot.error}"));
                return ScaffoldMessenger(child: snackBar);
              }
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<Album> fetchAlbum() async {
    var uri = 'https://jsonplaceholder.typicode.com/albums/1';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      return Album.fromJson(json.decode(response.body));
    } else {
      var snackBar = const SnackBar(content: Text("an error has occured"));
      throw ScaffoldMessenger(child: snackBar);
    }
  }

  Future<Album> updateAlbum() async {
    var uri = 'https://jsonplaceholder.typicode.com/albums/1';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      return Album.fromJson(json.decode(response.body));
    } else {
      var snackBar = const SnackBar(content: Text("an error has occured"));
      throw ScaffoldMessenger(child: snackBar);
    }
  }
}

// we are creating the album class,
class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(id: json['id'], title: json["title"]);
  }
}
