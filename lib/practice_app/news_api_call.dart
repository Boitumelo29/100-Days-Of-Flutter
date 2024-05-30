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
  //late Future<Article> _futureNews;
List<Article> news = [];

  @override
  void initState() {
    super.initState();
    //here we are overring and initiaising _fetchNews to = _futureNews
    _fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: ListView.builder(
            itemCount:news.lenght,
            itemBuild:(context, index){
              return Column(children: <Widget>[
                ListTile(title:Text(news.index.title))
              ])
            }
          )
        ));
  }
//fetching the data
  Future<void> _fetchNews() async {
    var uri =
        "https://newsapi.org/v2/everything?q=tesla&from=2024-04-30&sortBy=publishedAt&apiKey=7ba67c0508f34c7981013a3fef187aca";
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      //json.decode takes json formatted string and it converts it into dart
      List<dynamic>jsonData = json.decode(response.body)
      setState((){
        news = jsonData.map((data)=> Article.fromJson(data)).toList();
      });
      } else {
        // "No articles found";
      }
    } else {
      // 'error';
    }
  }
}

//the model
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
        author: json['author'] ?? 'unknown',
        description: json['description'],
        title: json['title'],
        image: json['urlToImage']);
  }
}
