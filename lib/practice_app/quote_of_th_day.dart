import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<QuoteOfThDay> qoute;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qoute = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<QuoteOfThDay>(
        future: qoute,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                children: <Widget>[
                  Text(snapshot.data!.author),
                  const SizedBox(),
                  Text(snapshot.data!.body)
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

//fetching the data

Future<QuoteOfThDay> fetchData() async {
  var uri = "https://favqs.com/api/qotd";
  final response = await http.get(Uri.parse(uri));
  print(response.body);
  if (response.statusCode == 200) {
    return QuoteOfThDay.fromJson(json.decode(response.body));
  }
  throw "";
}

//the model
class QuoteOfThDay {
  final String author;
  final String body;

  QuoteOfThDay({required this.author, required this.body});

  factory QuoteOfThDay.fromJson(Map<String, dynamic> json) {
    var quoteJson = json['quote'];
    return QuoteOfThDay(
        author: quoteJson['author'], body: quoteJson['body'] ?? "null");
  }
}
