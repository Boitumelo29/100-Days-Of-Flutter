import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String title = "My API Ecom Store";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(title: title),
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
    return Scaffold();
  }
}

//The Model
class Products {
  final int id;
  final double price;
  final String title;
  final String image;
  final String description;

  Products(
      {required this.id,
      required this.description,
      required this.image,
      required this.price,
      required this.title});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json['id'],
        description: json['description'],
        image: json['image'],
        price: json['price'],
        title: json['title']);
  }
}
