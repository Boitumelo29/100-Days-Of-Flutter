import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  List<Products> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // now we are initialing it
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    //fetchData();
    return Scaffold();
  }

  Future<void> fetchData() async {
    var uri = 'https://fakestoreapi.com/products';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      // we have to import the dart converter in order for us to use the json.decode and what this line is doing is it is decoding the response body and setting it to a list type
      List<dynamic> jsonData = json.decode(response.body);
      // we are setting products to jsonData and at the same time setting jsonData to a list
      setState(() {
        products = jsonData.map((e) => Products.fromJson(e)).toList();
      });
    }
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
