import 'dart:convert';

import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(future: ,builder: (context, snapshot) {
        
      },),
    );
  }

  Future<Album> fetchAlbum()async{

    var uri = 'https://jsonplaceholder.typicode.com/albums/1';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body,),);
    }else{
      var snackBar = const SnackBar(content: Text("An error has occured"));
      throw ScaffoldMessenger(child: snackBar);
    }

  }
}

//  Future<Album> updateAlbum(String title) async {
//     const String uri = 'https://jsonplaceholder.typicode.com/albums/1';
//     final response = await http.put(Uri.parse(uri),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8'
//         },
//         body: jsonEncode(<String, String>{'title': title}));

//     if (response.statusCode == 200) {
//       return Album.fromJson(jsonDecode(response.body));
//     } else {
//       var snackBar = const SnackBar(content: Text("An error has occures"));
//       throw ScaffoldMessenger(child: snackBar);
//     }
//   }

Future<Album> update(String title)async{
  var uri = 'https://jsonplaceholder.typicode.com/albums/1';
  final response = http.get(Uri.parse(uri), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8'
  } ,);

  if (response.statusCode == 200) {
   return Album.fromJson(jsonDecode(response.body));
  }else{
    throw "an error has occured";
  }
}

Future<Album> deleteAlbum(String id) async{
  var uri = 'https://jsonplaceholder.typicode.com/albums/$id';
  final response = http.delete(Uri.parse(uri));


}


class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json){
    return Album(id: json['id'], title: json['title']);
  }
}