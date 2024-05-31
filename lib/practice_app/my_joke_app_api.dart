import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skeleton_text/skeleton_text.dart';

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
  late Future<Jokes> joke;

  @override
  void initState() {
    super.initState();
    joke = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: 250,
            height: 200,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 178, 124, 187),
                borderRadius: BorderRadius.circular(20)),
            child: FutureBuilder(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text(snapshot.data!.joke),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              changeJoke();
                            },
                            child: const Text("New Joke"))
                      ],
                    );
                  } else {
                    return SkeletonAnimation(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 206, 166, 214),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }

  void changeJoke() {
    setState(() {
      build(context);
    });
  }
}

//I need to return Jokes here
Future<Jokes> fetchData() async {
  var uri = "https://icanhazdadjoke.com/";
  final response =
      await http.get(Uri.parse(uri), headers: {'Accept': 'application/json'});
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
