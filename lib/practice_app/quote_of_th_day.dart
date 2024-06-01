import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = "Quote Of The Day API APP";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage(title: title));
  }
}

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}

//the model

class QuoteOfThDay {
  final String author;
  final String body;

  QuoteOfThDay({required this.author, required this.body});

  factory QuoteOfThDay.fromJson(Map<String, dynamic> json) {
    return QuoteOfThDay(author: json['author'], body: json['body']);
  }
}
