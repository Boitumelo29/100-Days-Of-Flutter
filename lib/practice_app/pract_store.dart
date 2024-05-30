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
    super.initState();
    // now we are initialing it
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    //fetchData();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 80,
              width: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(products[index].image),
                  ),
                  title: Text(products[index].title),
                  subtitle: Text("R${products[index].price}"),
                ),
              ),
            );
          }),
    );
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
    } else {
      //var snackBar
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
        price: json['price'].toDouble(),
        title: json['title']);
  }
}
