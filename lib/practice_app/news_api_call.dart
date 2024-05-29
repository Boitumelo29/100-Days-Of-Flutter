import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = "News App";

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}

Future<News> fetchNews() async {
  var uri =
      'https://newsapi.org/v2/everything?q=tesla&from=2024-04-29&sortBy=publishedAt&apiKey=7ba67c0508f34c7981013a3fef187aca';
  final response = await http.get(Uri.parse(uri));

  print(response.body);
  if (response.statusCode == 200) {
    return News.fromJson(json.decode(response.body));
  } else {
    throw 'error';
  }
}

class News {
  final String author;
  final String title;
  final String description;

  News({required this.author, required this.title, required this.description});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        author: json['"author'],
        description: json['description'],
        title: json['title']);
  }
}
