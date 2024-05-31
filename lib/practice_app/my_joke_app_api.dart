import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String title = "My Joke App";

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
  @override
  Widget build(BuildContext context) {
    fetchData();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(),
    );
  }
}

Future<Jokes> fetchData() async {
  var uri = "https://icanhazdadjoke.com/";
  final response = await http.get(Uri.parse(uri));
  if (response.statusCode == 200) {
    return Jokes.fromJson(json.decode(response.body));
  } else {
    throw "An error has occured";
  }
}

class Jokes {
  final String joke;

  Jokes({required this.joke});

  factory Jokes.fromJson(Map<String, dynamic> json) {
    return Jokes(joke: json['joke']);
  }
}
