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
  late Future<News> _futureNews;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureNews = _fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: FutureBuilder<News>(
            future: _futureNews,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[Text(snapshot.data!.author)],
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }

  Future<News> _fetchNews() async {
    var uri =
        'https://newsapi.org/v2/everything?q=tesla&from=2024-04-29&sortBy=publishedAt&apiKey=7ba67c0508f34c7981013a3fef187aca';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      return News.fromJson(json.decode(response.body));
    } else {
      throw 'error';
    }
  }
}

class News {
  final String author;
  final String title;
  final String description;
  final String image;

  News(
      {required this.author,
      required this.title,
      required this.description,
      required this.image});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        author: json['"author'],
        description: json['description'],
        title: json['title'],
        image: json['"urlToImage']);
  }
}
