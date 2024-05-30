import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  //currently products is an empty list
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    //we inistialed fetch products
    fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }

  //function to fetch the api
  Future<void> fetchProduct() async {
    var uri = 'https://fakestoreapi.com/products';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      //we are decoding the json response
      List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        // we are seting proucts to the jsonData toList
        products = jsonData.map((data) => Product.fromJson(data)).toList();
      });
    } else {
      // final snacBarMessage = (content: const Text("An error has occured"));
      // var SnackBar = ScaffoldMessenger(child: snacBarMessage);
    }
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(product.image),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(product.title),
            subtitle: Text(product.description),
            trailing: Text("${product.price}"),
          )
        ],
      ),
    );
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
