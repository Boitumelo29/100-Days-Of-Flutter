import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = "Rick And Mortey API Call";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(title: title)
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
    return const Placeholder();
  }
}


//The model

class Character{
  final String id;
  final String name;
  final String species;
  final String image;

  Character({required this.id, required this.name, required this.species, required this.image});

  factory Character.fromJson(Map<String, dynamic>json){
    return Character(id: json['id'], name: json['name'], species: json['species'], image: json['image']);
  }
}