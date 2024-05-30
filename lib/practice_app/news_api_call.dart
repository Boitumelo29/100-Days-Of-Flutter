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
  late Future<Article> _futureNews;

  @override
  void initState() {
    super.initState();
    //here we are overring and initiaising _fetchNews to = _futureNews
    _futureNews = _fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: FutureBuilder<Article>(
            future: _futureNews,
            builder: (context, snapshot) {
              print(snapshot.data?.title);
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[Text(snapshot.data!.title)],
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }

  Future<Article> _fetchNews() async {
    var uri =
        'https://newsapi.org/v2/everything?q=tesla&from=2024-04-29&sortBy=publishedAt&apiKey=7ba67c0508f34c7981013a3fef187aca';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      return Article.fromJson(json.decode(response.body));
    } else {
      throw 'error';
    }
  }
}

class Article {
  final String status;
  final String author;
  final String title;
  final String description;
  final String image;

  Article(
      {required this.status,
      required this.author,
      required this.title,
      required this.description,
      required this.image});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        status: json['status'],
        author: json['author'],
        description: json['description'],
        title: json['title'],
        image: json['urlToImage']);
  }
}
