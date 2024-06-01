import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = "Rick And Morty API Call";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage(title: title));
  }
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
     List<Character> characters = [];
  @override
  Widget build(BuildContext context) {

    @override
    void initState() {
      super.initState();
      // now we are initialing it
      fetchData();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(itemCount:characters.length , itemBuilder: (context, snapshot){
       if(characters.isNotEmpty){
         ListTile(title: Text("characters[snapshot].name"));
       }else{
         Text("no data");
       }

      }),
    );
  }

  Future<void> fetchData() async {
    var uri = "https://rickandmortyapi.com/api";
    final response =
        await http.get(Uri.https('rickandmortyapi.com', 'api/character'));
    print("my call ${response.body}");
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        characters = jsonData.map((e) => Character.fromJson(e)).toList();
      });
    }
  }
}

//The model
class Character {
  final String id;
  final String name;
  final String species;
  final String image;

  Character(
      {required this.id,
      required this.name,
      required this.species,
      required this.image});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        id: json['id'],
        name: json['name'],
        species: json['species'],
        image: json['image']);
  }
}
