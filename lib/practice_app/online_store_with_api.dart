import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String storeName = "My Stores";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(storeName: storeName),
    );
  }
}

// it is advised to split your api call into these 4 sections
// api services: code related to teh API to perform any api related action
//apimodel: the model of the api, we generate online and paste here
//utils: the widgets
//screens: screen we fetch date from

//main
class HomePage extends StatefulWidget {
  final String storeName;
  const HomePage({super.key, required this.storeName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.storeName),
      ),
      body: const ProductScreen(),
    );
  }
}

//screen
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

//model
// here in this class we have created the model where we ill be pasting our api into
class Product {
  final int id;
  final double price;
  final String title;
  final String image;
  final String description;

  Product(
      {required this.id,
      required this.price,
      required this.title,
      required this.image,
      required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        price: json['price'].toDouble(),
        title: json['title'],
        image: json['image'],
        description: json['description']);
  }
}
